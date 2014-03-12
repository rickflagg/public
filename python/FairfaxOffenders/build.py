__author__ = "Rick Flagg"

import psycopg2
import sys
import shutil


class BuildProperties(object):
    def __init__(self):
        self._props = {}
        self.initialize_properties()

    def initialize_properties(self):

        self._props['run.development.sql'] = True
        self._props['dev.sql.host'] = 'localhost'
        self._props['dev.sql.database'] = 'criminal_offenders'
        self._props['dev.sql.user'] = 'criminal_offenders_user'
        self._props['dev.sql.password'] = '~^28Y=k*!~(*]7K'


        return self._props

    @property
    def build_properties(self):
        return self._props


class PostgresqlTask(object):
    def __init__(self, host, database, user, password):
        self._host = host
        self._database = database
        self._user = user
        self._password = password
        self._cn = None

    def connection_string(self):

        return "host='{0}' dbname='{1}' user='{2}' password='{3}'".format(self._host, self._database,
                                                                          self._user, self._password)

    def connection(self):

        try:
            self._cn = psycopg2.connect(self.connection_string())

        except psycopg2.DatabaseError, e:
            print 'Error %s' % e
            sys.exit(1)

        return self._cn

    def run_script(self, path):

        try:

            cn = self.connection()

            print "Running Script: {0}".format(path)

            sql = FileTask().read_file(path)

            cur = cn.cursor()

            cur.execute(sql)

            cn.commit()

        except Exception, e:

            print 'Error %s' % e
            sys.exit(1)

class FileTask(object):
    def read_file(self, path):
        return open(path, 'r').read()


class ApplicationBuild(object):
    def __init__(self):

        self._props = BuildProperties().build_properties
        self._dev_postgresql_task = PostgresqlTask(self._props['dev.sql.host'], self._props['dev.sql.database'], self._props['dev.sql.user'], self._props['dev.sql.password'])



    def create_database(self):

        if self._props['run.development.sql'] is True:

            print "Syncing development database"

            self._dev_postgresql_task.run_script("resources/sql/Sprint_1.sql")

    def perform_build(self):

        self.create_database()

if __name__ == "__main__":
    ApplicationBuild().perform_build()