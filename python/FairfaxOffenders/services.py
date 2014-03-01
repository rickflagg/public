__author__ = 'rflagg'

from utilities import *
import urllib
import urllib2
import StringIO
import json

class GeoCodeParserService(object):

    def getGeoCodeByAddress(self, address):

        urlParams = {
                'address': address,
                'sensor': 'false',
        }
        url = 'http://maps.google.com/maps/api/geocode/json?' + urllib.urlencode(urlParams)
        response = urllib2.urlopen(url)
        responseBody = response.read()

        body = StringIO.StringIO(responseBody)
        result = json.load(body)
        if 'status' not in result or result['status'] != 'OK':
                return None
        else:
                return {
                        'lat': result['results'][0]['geometry']['location']['lat'],
                        'lng': result['results'][0]['geometry']['location']['lng']
                }


class FairfaxCrimeParserService(object):

    def __init__(self):
        pass

    def parse(self):

        retval = []
        i = 0

        raw = urllib2.urlopen(ConfigurationManager().readProperty("urls", "fairfax.crimes.url")).readlines()

        for line in raw:

            if i > 0:

                record = {}

                record["last.name"] = line[:25].strip()
                record["first.name"] = line[26:51].strip()
                record["middle.name"] = line[61:95].strip()
                record["age"] = line[100:104].strip()
                record["date.arrested"] = line[105:115].strip()
                record["charge.statute"] = line[131: 156].strip()
                record["charge.description"] = line[157:210].strip()

                #'3138 GLEN CARLYN RD, FALLS CHURCH, VA 22041'
                record["address"] = line[210:len(line)].strip().split(',')[0].strip()

                geoCode = GeoCodeParserService().getGeoCodeByAddress(record['address'])

                if geoCode is not None:
                    record = (record.items() + geoCode.items())

                retval.append(record)

            i = (i + 1)

        return retval

