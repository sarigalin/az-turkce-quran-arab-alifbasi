'''
Created on Oct 22, 2012

@author: sarigalin
'''
from codecs import open
from sys import argv
import sqlite3 as lite

def AndroidQuranTranslationConvertor():
    schema_version = 2
    text_version = 2
    surah = ReadVerses()
    if len(surah) == 0:
        return    
    
    try:
        #con = lite.connect('quran.azturkce.db')
        con = lite.connect(argv[2])
    
        cur = con.cursor()  
#    		DROP TABLE IF EXISTS properties;
#     	CREATE TABLE properties( property text, value text );
        cur.executescript("""
            
            DROP TABLE IF EXISTS verses;
            CREATE TABLE verses( sura integer, ayah integer, text text, primary key(sura, ayah ) );
            """)
        
        #cur.execute("INSERT INTO properties(property, value) VALUES('schema_version', ?)", str(schema_version))
        #cur.execute("INSERT INTO properties(property, value) VALUES('text_version', ?)", str(text_version))
        for ayah in surah:
            if len(ayah) == 3:
                cur.execute("INSERT INTO verses(sura, ayah, text) VALUES(?, ?, ?)", ayah)
        con.commit()
        
    except lite.Error, e:
        
        if con:
            con.rollback()
            
        print "Error %s:" % e.args[0]
        exit(1)
        
    finally:
        
        if con:
            con.close() 
        

            
def ReadVerses():
    
    charset = 'utf-8'
    
    quran_file = argv[1]
             
    # read quran translation file and split each surah in a list    
    surah = []
    description = []
    
    trans_lines = open(quran_file, 'U', charset).read().split('\n')
    
    for line in trans_lines:
        #line = str(line).strip().replace('\xef\xbb\xbf', '')
        if line=='' or line.startswith('#'): 
            description.append(line)
            continue 
        parts = line.split('|')
        surah.append(parts)
    
    return surah


if __name__ == '__main__':
    if len(argv) < 3:
        exit('usage: %s quran_file db_name' % argv[0])
    AndroidQuranTranslationConvertor()

