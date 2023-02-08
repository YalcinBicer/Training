#!/bin/bash

cat event_history.csv | grep serdar | grep -i TerminateInstance | grep -Eo "i-[a-zA-Z0-9]{17}" > result.txt 
cat result.txt

echo "Serdar tarafindan terminate edilen instance sayisi = "
cat result.txt | grep -ic ^i
