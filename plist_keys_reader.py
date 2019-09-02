#!/usr/bin/python3

import sys, getopt
import plistlib
from optparse import OptionParser
from sys import version_info

class Parameters(object):
    def __init__(self, inputFile):
        self.inputFile = inputFile


class PropertiesReader(object):
    def readProperties(self, argv):
        usage = "usage: %prog -i <title>"
        parser = OptionParser(usage=usage)
        parser.add_option("-i", "--input", dest="varinput",
                          help="Input File", metavar="STRING")
        (options, args) = parser.parse_args()
        return  Parameters(options.varinput)


class PlistReader(object):
    def readFile(self, parameters):
        inputPlistDict = plistlib.readPlist(parameters.inputFile)
        keysIn = map(lambda x: "\""+x+"\"", inputPlistDict.keys())
        str = ",\n".join(keysIn)
        print str
        # for key, value in inputPlistDict.items():
            # print key,



def main(argv):
    parameters = PropertiesReader().readProperties(argv)
    PlistReader().readFile(parameters)


if __name__ == "__main__":
    main(sys.argv[1:])
