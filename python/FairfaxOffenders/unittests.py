__author__ = 'Rick Flagg'

import unittest
from services import *


class FairfaxCrimeParserTests(unittest.TestCase):

    def testParse(self):
        self.assertIsNotNone(FairfaxCrimeParserService().parse())


