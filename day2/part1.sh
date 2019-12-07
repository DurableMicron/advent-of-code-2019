#!/usr/bin/bash

testCase1="1 0 0 0 99"
answer1="2 0 0 0 99"

testCase2="2 3 0 3 99"
answer2="2 3 0 6 99"

testCase3="2 4 4 5 99 0"
answer3="2 4 4 5 99 9801"

testCase4="1,1,1,4,99,5,6,0,99"
answer4="30,1,1,4,2,5,6,0,99"

# read in input
while IFS= read -r line || [[ -n "$line" ]]; do
    input=$line
done < "./day2/input.txt"

# set up
rawInput=$input
expectedOutput=$answer4
caseArray=()
echo input $case
echo expected output

# convert commas to spaces
case=${rawInput//,/ }

# put into array for easier processing
for i in ${case[@]}; do
    caseArray+=($i)
done
echo ${caseArray[@]::13}
# 1202 thing

caseArray[1]=12
caseArray[2]=2

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

# convertoutput to good format

output=${caseArray[@]}
finalOutput=${output// /,}

echo inputcalculated $finalOutput
echo expected output ${expectedOutput[@]}

echo finalAnswer ${finalOutput[0]}