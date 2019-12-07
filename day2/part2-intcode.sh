#!/usr/bin/bash

# this merely spits out the output of the intcode operations

# read in input
while IFS= read -r line || [[ -n "$line" ]]; do
    input=$line
done < "./day2/input.txt"

# set up
rawInput=$input
expectedOutput=$answer4
caseArray=()

# convert commas to spaces
case=${rawInput//,/ }

# put into array for easier processing
for i in ${case[@]}; do
    caseArray+=($i)
done
# 1202 thing

caseArray[1]=$1
caseArray[2]=$2

# init i
i=0
# we use a break to leave this loop
while true; do
    op=${caseArray[$i]}
    # if 99 we have hit the end
    if [[ $op == 99 ]]; then
        break
    fi
    # addition
    if [[ $op == 1 ]]; then
        firstAddition=${caseArray[${caseArray[$i+1]}]}
        secondAddition=${caseArray[${caseArray[$i+2]}]}
        additionResult=$(($firstAddition + $secondAddition))
        caseArray[${caseArray[$i+3]}]=$additionResult
    # subtraction
    elif [[ $op == 2 ]]; then
        firstmultiplication=${caseArray[${caseArray[$i+1]}]}
        secondmultiplication=${caseArray[${caseArray[$i+2]}]}
        multiplicationResult=$(($firstmultiplication * $secondmultiplication))
        caseArray[${caseArray[$i+3]}]=$multiplicationResult
    fi
    # iterate by 4
    i=$((i+4))
done


echo ${caseArray[0]}