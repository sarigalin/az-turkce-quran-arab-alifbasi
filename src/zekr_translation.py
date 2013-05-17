#!/usr/local/bin/python
# -*- coding: utf-8 -*-

'''
Created on Jul 6, 2012

@author: Sari Galin
'''
from codecs import open
from os import linesep
from sys import argv
from datetime import date


def main():
    if len(argv) < 3:
        exit('usage: %s quran_file trans_file' % argv[0])
    charset = 'utf-8'
    
    quran_file = argv[1]
    #prepare surah numbers to be splitted
    surah_numbers = set()
         
    # read quran translation file and split each surah in a list    
    surah = []
    description = []
    surah_trans = {}
    trans_lines = open(quran_file, 'U', charset).read().split('\n')
    current = 1
    for line in trans_lines:
        #line = str(line).strip().replace('\xef\xbb\xbf', '')
        if line=='' or line.startswith('#'): 
            description.append(line)
            continue 
        parts = line.rpartition('|')
        surah.append(parts[2])
    
    #dest = ''.join( [ quran_file, ".trans"])
    dest = argv[2];
    open(dest, 'w', charset).writelines(linesep.join(surah))        



if __name__ == '__main__':
    main()
