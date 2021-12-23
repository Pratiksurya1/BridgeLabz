#!/bin/bash -x

isPartTime=1
isFullTime=2
maxHoursInMonth=100
empRatePerHour=20
numOfWorkingDays=20

totalEmpHr=0
totalWorkingDays=0

declare -A dailyWages
function getWorkHrs()
{
        case $1 in
                                $isFullTime)
                                        empHrs=8
                                ;;
                                $isPartTime)
                                        empHrs=4
                                ;;
                                *)
                                        empHrs=0
        esac
}
function getEmpWage(){
		echo $(($1*$empRatePerHour))
}
while [[ $totalEmpHr -lt $maxHoursInMonth &&
		$totalWorkingDays -lt $numOfWorkingDays ]]
do
	((totalWorkingDays++))
	empCheck=$((RANDOM%3))
	getWorkHrs $empCheck
	totalEmpHr=$(($totalEmpHr+$empHrs))
	dailyWages["$totalWorkingDays"]=$(($empHrs*$empRatePerHour))
done

totalSalary="$( getEmpWage $totalEmpHr)"
echo ${dailyWages[@]}
echo ${!dailyWages[@]}
