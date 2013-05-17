# !/bin/bash
QURAN=../data/az_turkce_quran.txt
TRANS=az_turkce_quran.trans

ZEKR_TRANS_PATH=~/.zekr/text/trans/
ZEKR_CACHE=~/.zekr/cache/mixed/
ZEKR_PACK=../IR-az_mammadaliyev.trans.zip

./build_zekr_translation.sh $QURAN $ZEKR_PACK $TRANS
rm -r $ZEKR_CACHE*
cp $ZEKR_PACK $ZEKR_TRANS_PATH
