__author__ = "Rick Flagg"

import psycopg2
from utilities import *


class BaseDao(object):

    def __init__(self):
        pass

    def connection_string(self):

        config = ConfigurationManager()

        host = config.read_property('database', 'db.host')
        database = config.read_property('database', 'db.name')
        user = config.read_property('database', 'db.user')
        password = config.read_property('database', 'db.password')

        return "host='{0}' dbname='{1}' user='{2}' password='{3}'".format(host, database, user, password)

    def connection(self):

        try:

            self._cn = psycopg2.connect(self.connection_string())
            return self._cn

        except psycopg2.DatabaseError, e:

            print 'Error %s' % e

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

        try:

            cur.callproc(procName, params)
            cn.commit()

        except psycopg2.DatabaseError, e:
            print 'Error %s' % e
        finally:

            if cur is not None:
                cur.close()

            if cn is not None:
                cn.close()

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

        if len(dict) > 0:
            for key, value in dict.iteritems():
                retval.append(value)

        return retval

class OffenceDao(BaseDao):

    def __init__(self):
        super(OffenceDao, self).__init__()

    def save_offence(self, values={}):
        if len(values):

            params = [
                values["last.name"],
                values["first.name"],
                values["middle.name"],
                values["age"],
                values["date.arrested"],
                values["charge.statute"],
                values["charge.description"],
                values["address"],
                values["lat"],
                values["lng"],
                values["state"],
                values["area"]
            ]

            self.execute_function("fn_save_offence", params)

