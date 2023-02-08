#!/bin/bash


#cat event_history.csv | grep serdar | grep -i Terminateinstance | grep -Eo "i-[a-zA-Z0-9]{17}" > /tmp/result.txt | cat result.txt

instances=`cat event_history.csv | grep serdar | grep -i TerminateInstances | grep -Eo "i-[a-zA-Z0-9]{17}"`

count=0
count_ins=0
for i in $instances
do
    ((count_ins++))
    if [ $i == "i-0ea92db42217ddad8" ]
    then
        ((count++))
    fi
done
echo "Serdar tarafindan terminate edilen instance sayisi = $count_ins"
echo   "Belirtilen instance'in (i-0ea92db42217ddad8) kapatilma sayisi : $count"