__author__ = 'Rick Flagg'

import unittest
from parsers import *
from dao import *


class FairfaxCrimeParserTests(unittest.TestCase):

    def test_parse(self):
        self.assertIsNotNone(FairfaxOffenceParser().parse())


class OffenseDaoTests(unittest.TestCase):

    def test_persist(self):
        offences = FairfaxOffenceParser().parse()
        dao = OffenceDao()

        if len(offences) > 0:
            for record in offences:
                dao.save_offence(record)