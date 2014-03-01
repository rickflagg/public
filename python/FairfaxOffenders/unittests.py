__author__ = 'rflagg'

import unittest
from services import *


class FairfaxCrimeParserTests(unittest.TestCase):

    def testParse(self):

        record = FairfaxCrimeParserService().parse()[0]

        print record
