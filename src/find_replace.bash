#!/bin/bash
strindex() { 
  x="${1%%$2*}"
  [[ $x = $1 ]] && echo -1 || echo ${#x}
}
FIND=لار
NIM="‌"
EXCHARS="اآزرذدژو"
FILE=../data/az_turkce_quran.txt
SRC=.temp_quran
TMP=.temp
TMP2=.temp2
cat $FILE > $SRC;
: > mytest

for FIND in لار لر
do
	: > $TMP
	TOKENS=$(grep -o " [^‌ ]*$FIND[^‌ ]* " $SRC | sort | uniq)

	for T in $TOKENS
	do
		INDEX=$(( $(strindex $T $FIND) -1 ))
		CH=${T:$INDEX:1}
		if [[ $EXCHARS != *$CH* ]] # if CH is not in excluded last characters
		then
			LAST_INDEX=$(( $INDEX + ${#FIND}+1 ))
			STR=${T:0:$LAST_INDEX}
			echo $STR >> $TMP;
		fi
	done
	
	cat $TMP | sort | uniq > $TMP2

	cat $TMP2 | while read T; 
	do 
		N=${T/$FIND/$NIM$FIND};
		#echo "$T --> $N"  >> mytest;
		
		echo "$T --> $N" 
		sed -i -e "s/$T/$N/g" $SRC;
	done
done
