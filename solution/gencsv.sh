#!/bin/bash
counter=0
while [ $counter -lt 10 ]
do
	randnum=$((RANDOM%100))
	echo "$counter, $randnum" >> inputFile
	counter=$(($counter+1))
done

