#!/usr/bin/bash

# this runs the intcode computer 

#iterate over noun and verbs until we get desirect output
desiredOutput=19690720
# values between 0..99
for noun in {0..99}; do
    for verb in {0..99}; do
        verb=12
        noun=41
        output=$(./day2/part2-intcode.sh $noun $verb)
        if [[ $output == $desiredOutput ]]; then
            echo verb is $verb noun is $noun
            
            outputAnswer=$((100*$noun+$verb))
            echo therefore desired output is $outputAnswer
            exit 
        fi
        echo $output from $verb $noun
    done
done


