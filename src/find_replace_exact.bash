#!/bin/bash
strindex() { 
  x="${1%%$2*}"
  [[ $x = $1 ]] && echo -1 || echo ${#x}
}

NIM="‌"
EXCHARS=" ا آ ز ر ذ د ژ و ؤ"
FILE=../data/az_turkce_quran.txt
TMP_QURAN=.temp_quran
TMP=.temp
TMP2=.temp2
EX_TOKENS=ex_list
cat $FILE > $TMP_QURAN;
: > mytest

for FIND in لاشماق دن دان ده دا دیر
do
	: > $TMP
	TOKENS=$(grep -o " [^‌ ]*$FIND " $TMP_QURAN | sort | uniq)

	for T in $TOKENS
	do
		INDEX=$(( $(strindex $T $FIND) -1 ))
		CH=${T:$INDEX:1}
		if [[ $EXCHARS != *$CH* ]] #if token is not in excluded tokens
		then
			LAST_INDEX=$(( $INDEX + ${#FIND}+1 ))
			STR=${T:0:$LAST_INDEX}
			echo $STR >> $TMP;
		fi
	done
	
	cat $TMP | sort | uniq > $TMP2

	cat $TMP2 | while read T; 
	do 
		
		if [ ! $(grep  "^$T " $EX_TOKENS) ]   # if CH is not in excluded last characters 
		then
			N=${T/$FIND/$NIM$FIND};

			echo "$T --> $N"  >> mytest;
			echo "$T --> $N"
 
			#sed -i -e "s/$T/$N/g" $TMP_QURAN;
		fi	
	
	done
done

#Clean up
#mv $TMP_QURAN $FILE
rm $TMP_QURAN $TMP $TMP2

