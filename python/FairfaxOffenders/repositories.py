__author__ = "Rick Flagg"

import psycopg2
from utilities import *


class BaseRepository(object):

    def __init__(self):
        pass

    def connection_string(self):

        config = ConfigurationManager()

        host = config.readProperty('database', 'db.host')
        database = config.readProperty('database', 'db.name')
        user = config.readProperty('database', 'db.user')
        password = config.readProperty('database', 'db.password')

        return "host='{0}' dbname='{1}' user='{2}' password='{3}'".format(host, database, user, password)

    def connection(self):

        try:

            self._cn = psycopg2.connect(self.connection_string())
            return self._cn

        except psycopg2.DatabaseError, e:

            return 'Error %s' % e

    def execute_refcursor_function(self, procName, params=None):

        proc_params = ['refcursor']

        if params is not None:
            proc_params = proc_params + params

        cn = self.connection()
        cur1 = cn.cursor()
        cur1.callproc(procName, proc_params)
        cur2 = cn.cursor('refcursor')


        return cur2.fetchall()

    def execute_function(self, procName, params=None):

        cn = self.connection()
        cur = cn.cursor()
        cur.callproc(procName, params)

    def execute_result(self, sql, params=None):

        cn = None
        cur = None
        retval = None

        try:
            cn = self.connection()
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

    def execute_insert_or_update(self, sql, params=None):

        cn = None
        cur = None

        try:
            cn = self.connection()
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

    def dictionary_to_parameters(self, dict=None):

        retval = []

        if dict.hasKeys():
            for key, value in dict.iteritems():
                retval.append(value)

        return retval

class OffenceRepository(BaseRepository):

    def __init__(self):
        super(BaseRepository, self).__init__()

    def save_offence(self, values={}):

        if values.has_keys():
            self.executeNoResultFunction("", self.dictionary_to_parameters(values) )

