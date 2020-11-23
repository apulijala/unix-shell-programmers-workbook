#!/bin/bash 
# https://www.youtube.com/watch?v=Wm-HpV4Qze8&t=129s
# 8:30 AM. 
# Will be availble in current shell

function verify_months() {

    MONTHS_FILE="$2"
    [ -z "$MONTHS_FILE" ] && MONTHS_FILE="./Months"

    if grep -i "^$1\$" $MONTHS_FILE > /dev/null 
    then 
        echo "\"$1\" is the name of the month."
        return 0
    else 
        echo "\"$1\" is not the name of the month."
        return 1 # if exit is used. Shell will exit. 
    fi

}

function verify_months_and_days() {

    MONTHS_FILE="$2"
    DAYS_FILE="$3"

    [ -n "$MONTHS_FILE" ] || MONTHS_FILE="./Months"
    [ -z "$DAYS_FILE" ] && DAYS_FILE="./Days"

    if grep -i "^$1\$" $MONTHS_FILE > /dev/null
    then
        echo "\"$1\" is the name of the month."
    elif grep -i "^$1\$" $DAYS_FILE > /dev/null 
    then 
        echo "\"$1\" is the name of the day."
    else 
        echo "\"$1\" is neither month or a day"
    fi 
 
}


# Script running in non source mode 
if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then 
    verify_months "$1"
fi
