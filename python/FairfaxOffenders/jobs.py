__author__ = "Rick Flagg"

from parsers import *
from dao import *

def import_offences():

    #Save the Fairfax Offences
    OffenceDao().save_offence(FairfaxOffenceParser().parse())

if __name__ == "__main__":
    import_offences()