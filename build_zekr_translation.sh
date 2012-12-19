#!/bin/bash

python zekr_translation.py az-turkce-quran-sarigalin.ir.txt 
zip IR-az_mammadaliyev.trans.zip az-turkce-quran-sarigalin.ir.txt.trans.txt translation.properties
rm az-turkce-quran-sarigalin.ir.txt.trans.txt
rm -r /home/mehdi/.zekr/cache/mixed/*
cp IR-az_mammadaliyev.trans.zip /home/mehdi/.zekr/text/trans/
