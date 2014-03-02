import os
import psycopg2
import sys
import shutil
import tarfile
import ConfigParser

class FileTask(object):
    def readFile(self, path):
        return open(path, 'r').read()


class BuildProperties(object):
    def __init__(self):
        self._props = {}
        self.initialize_properties()

    def initialize_properties(self):

        self._props['release.dir'] = 'C:\\Users\\rflagg\\Documents\\ExternalSandbox\\deployments\\python\\homesite\\production'
        self._props['run.development.sql'] = True
        self._props['dev.sql.host'] = 'localhost'
        self._props['dev.sql.database'] = 'rickflagg.net'
        self._props['dev.sql.user'] = 'rickflagg_user'
        self._props['dev.sql.password'] = 'V41Z<SX(960+d0|'


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

    def getConnectionString(self):

        return "host='{0}' dbname='{1}' user='{2}' password='{3}'".format(self._host, self._database,
                                                                          self._user, self._password)

    def getConnection(self):

        try:
            self._cn = psycopg2.connect(self.getConnectionString())

        except psycopg2.DatabaseError, e:
            print 'Error %s' % e
            sys.exit(1)

        return self._cn

    def runScript(self, path):

        try:

            cn = self.getConnection()

            print "Running Script: {0}".format(path)

            sql = FileTask().readFile(path)

            cur = cn.cursor()

            cur.execute(sql)

            cn.commit()

        except Exception, e:

            print 'Error %s' % e
            sys.exit(1)


class ApplicationBuild(object):

    def __init__(self):

        self._props = BuildProperties().build_properties
        self._dev_postgresql_task = PostgresqlTask(self._props['dev.sql.host'], self._props['dev.sql.database'],
                                                   self._props['dev.sql.user'], self._props['dev.sql.password'])
        self._prod_postgresql_task = PostgresqlTask(self._props['dev.sql.host'], self._props['dev.sql.database'],
                                                    self._props['dev.sql.user'], self._props['dev.sql.password'])

        self._prod_release_dir = self._props['release.dir']

        self._dev_release_dir = os.path.join(os.getcwd(),
                                        os.path.join(self._props['release.dir'], "development"))


    def create_database(self):

        if self._props['run.development.sql'] is True:

            print "Syncing development database"

            self._dev_postgresql_task.runScript("resources/sql/sprint1.sql")


            self._dev_postgresql_task.runScript("resources/sql/functions/fn_RetrieveActiveProjects.sql")
            self._dev_postgresql_task.runScript("resources/sql/functions/fn_RetrieveProjectServiceOrganization.sql")
            self._dev_postgresql_task.runScript("resources/sql/functions/fn_RetrieveProjectClientOrganization.sql")
            self._dev_postgresql_task.runScript("resources/sql/functions/fn_RetrieveProjectServiceOrganization.sql")
            self._dev_postgresql_task.runScript("resources/sql/functions/fn_RetrieveProjectRoles.sql")
            self._dev_postgresql_task.runScript("resources/sql/functions/fn_RetrieveProjectTechnologies.sql")

    def deploy(self):

        shutil.copyfile("resources/configuration/app.cfg.production", os.path.join(self._prod_release_dir, "app.cfg"))
        shutil.copyfile("homesite.py", os.path.join(self._prod_release_dir, "homesite.py"))
        shutil.copyfile("repositories.py", os.path.join(self._prod_release_dir, "repositories.py"))
        shutil.copyfile("services.py", os.path.join(self._prod_release_dir, "services.py"))
        shutil.copyfile("utilities.py", os.path.join(self._prod_release_dir, "utilities.py"))

        shutil.copyfile("resources/configuration/homesite.wsgi", os.path.join(self._prod_release_dir, "homesite.wsgi"))

        #Index Template
        shutil.copyfile("templates/index.html", os.path.join(self._prod_release_dir, "templates/index.html"))

        #Style
        shutil.copyfile("static/style/site.css", os.path.join(self._prod_release_dir, "static/style/site.css"))

        #Robots.txt
        shutil.copyfile("static/robots.txt", os.path.join(self._prod_release_dir, "robots.txt"))

        #jquery.pcarousel
        shutil.copyfile("static/js/jquery.pcarousel.js", os.path.join(self._prod_release_dir, "static/js/jquery.pcarousel.js"))

        #sitemap
        shutil.copyfile("static/sitemap.xml", os.path.join(self._prod_release_dir, "sitemap.xml"))


    def perform_build(self):

        self.create_database()
        self.deploy()

if __name__ == "__main__":
    ApplicationBuild().perform_build()

