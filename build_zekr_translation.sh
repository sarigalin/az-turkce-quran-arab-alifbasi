#!/bin/bash

python zekr_translation.py az_turkce_quran.txt 
zip IR-az_mammadaliyev.trans.zip az_turkce_quran.txt.trans.txt translation.properties
rm az_turkce_quran.txt.trans.txt
