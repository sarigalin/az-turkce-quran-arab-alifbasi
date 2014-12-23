# !/bin/bash
QURAN=../data/az_turkce_quran.txt
DB=../quran.az.musayev.db
ANDROID_DB_PATH=/sdcard/quran_android/databases/

./build_android_quran.sh $QURAN $DB
adb push $DB $ANDROID_DB_PATH
