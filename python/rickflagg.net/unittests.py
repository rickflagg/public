__author__ = 'rflagg'

import unittest
from repositories import *
from utilities import PrintHelpers

class ProjectRepositoryTests(unittest.TestCase):

    def testRetrieveAll(self):

        records = ProjectRepository().RetrieveAll()

        self.assertIsNotNone(records)
        #PrintHelpers().PrintClassAttributes(records[0])

        print dict(records)