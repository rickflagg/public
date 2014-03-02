__author__ = 'rflagg'

import ConfigParser
import os

class ConfigurationManager(object):

    def readProperty(self, section, key):
        config = ConfigParser.ConfigParser()
        config.read(os.path.dirname(os.path.realpath(__file__)) + os.sep + 'app.cfg')
        return config.get(section, key)

    def readBooleanProperty(self, section, key):
        config = ConfigParser.ConfigParser()
        config.read(os.path.dirname(os.path.realpath(__file__)) + os.sep + 'app.cfg')
        return config.getboolean(section, key)


class PrintHelpers(object):

    def PrintClassAttributes(self, klazz):
        attrs = vars(klazz)
        print ', '.join("%s: %s" % item for item in attrs.items())