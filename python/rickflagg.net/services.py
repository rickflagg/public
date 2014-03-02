__author__ = 'rflagg'


from flask.ext.restful import Resource
from werkzeug.contrib.cache import SimpleCache

from repositories import *


cache = SimpleCache()

class ProjectService(Resource):

    def get(self):

        retval = cache.get('projects')

        if retval is None:
            retval = ProjectRepository().RetrieveAll()
            cache.set('projects', retval, timeout=12 * 60)
        return retval
