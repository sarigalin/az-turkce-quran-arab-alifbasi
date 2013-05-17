#!/bin/bash
QURAN=$1
PACK=$2
TRANS=$3
PROP_FILE=translation.properties
PROP_PATH=../data/
python zekr_translation.py $QURAN $TRANS
cp $PROP_PATH/$PROP_FILE ./

zip $PACK $TRANS $PROP_FILE

rm $TRANS
rm $PROP_FILE
