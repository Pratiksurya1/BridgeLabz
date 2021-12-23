#!/bin/bash -x

ispresent=1
randomcheck=$((RANDOM%2))

if [ $ispresent -eq $randomcheck ]
then
	empRatePreHr=20
	empHrs=8
	salary=$(($empHrs*$empRatePreHr))
else
	salary=0
fi
