__author__ = 'rflagg'

import psycopg2
from utilities import ConfigurationManager


class BaseRepository(object):

    def __init__(self):
        pass

    def getConnectionString(self):

        config = ConfigurationManager()

        host = config.readProperty('database', 'db.host')
        database = config.readProperty('database', 'db.name')
        user = config.readProperty('database', 'db.user')
        password = config.readProperty('database', 'db.password')

        return "host='{0}' dbname='{1}' user='{2}' password='{3}'".format(host, database, user, password)

    def getConnection(self):

        try:

            self._cn = psycopg2.connect(self.getConnectionString())
            return self._cn

        except psycopg2.DatabaseError, e:

            return 'Error %s' % e

    def executeProcedure(self, procName, params=None):

        proc_params = ['refcursor']

        if params is not None:
            proc_params = proc_params + params

        cn = self.getConnection()
        cur1 = cn.cursor()
        cur1.callproc(procName, proc_params)
        cur2 = cn.cursor('refcursor')


        return cur2.fetchall()


    def executeResult(self, sql, params=None):

        cn = None
        cur = None
        retval = None

        try:
            cn = self.getConnection()
            cur = cn.cursor()

            if ConfigurationManager().readBooleanProperty("general", "show.sql") is True:
                print cur.mogrify(sql, params)

            cur.execute(sql, params)
            retval = cur.fetchall()
            return retval

        except psycopg2.DatabaseError, e:
            print 'Error %s' % e
        finally:

            if cur is not None:
                cur.close()

            if cn is not None:
                cn.close()

    def executeInsertOrUpdate(self, sql, params=None):

        cn = None
        cur = None

        try:
            cn = self.getConnection()
            cur = cn.cursor()
            cur.execute(sql, params)

            cn.commit()

        except psycopg2.DatabaseError, e:
            print 'Error %s' % e
        finally:

            if cur is not None:
                cur.close()

            if cn is not None:
                cn.close()

class OrganizationRepository(BaseRepository):

    def __init__(self):
        super(OrganizationRepository, self).__init__()

    def RetrieveServiceOrganizationByProject(self, project_id):

        record = self.executeProcedure("fn_retrieve_project_service_organization", [project_id])

        return self.BindModel(record[0])

    def RetrieveClientOrganizationByProject(self, project_id):

        record = self.executeProcedure("fn_retrieve_project_client_organization", [project_id])

        return self.BindModel(record[0])


    def BindModel(self, record):
        if record is not None:
            return {"id": record[0], "name": record[1], "active": record[2]}
        else:
            return {}


class RoleRepository(BaseRepository):

    def __init__(self):
        super(RoleRepository, self)

    def RetrieveRolesForProjects(self, project_id):

        retval = []

        records = self.executeProcedure("fn_retrieve_project_roles", [project_id])

        for record in records:
            retval.append(self.BindModel(record))

        return retval

    def BindModel(self, record):
        if record is not None:
            return {"id": record[0], "name": record[1], "active": record[2]}
        else:
            return {}


class TechnologyRepository(BaseRepository):

    def __init__(self):
        super(TechnologyRepository, self).__init__()

    def RetrieveTechnologiesForProject(self, project_id):

        retval = []

        records = self.executeProcedure("fn_retrieve_project_technologies", [project_id])

        for record in records:
            retval.append(self.BindModel(record))

        return retval

    def BindModel(self, record):
        if record is not None:
            return {"id": record[0], "name": record[1], "active": record[2],
                    "icon_path": record[3], "url": record[4]}
        else:
            return {}

class ProjectRepository(BaseRepository):

    def __init__(self):
        super(ProjectRepository, self).__init__()

    def RetrieveAll(self):
        retval = []
        records = self.executeProcedure("fn_retrieve_active_projects")

        for record in records:
            retval.append(self.BindModel(record))

        return retval

    def BindModel(self, record):

        if record is not None:

            return {
                "id": record[0],
                "name": record[1],
                "description": record[2],
                "start_date": str(record[3]),
                "end_date": str(record[4]),
                "organization": OrganizationRepository().RetrieveServiceOrganizationByProject(record[0]),
                "client": OrganizationRepository().RetrieveClientOrganizationByProject(record[0]),
                "notable": record[7],
                "active": record[8],
                "url": record[9],
                "roles": RoleRepository().RetrieveRolesForProjects(record[0]),
                "technologies": TechnologyRepository().RetrieveTechnologiesForProject(record[0])
            }
        else:
            return {}
