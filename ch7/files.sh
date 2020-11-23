#!/bin/bash 

function newer() {

    [[ $# -ne 2 ]] && {
        echo "Usage: newer file file1"
        return 1
    }

    [[ -f "$1" && -f "$2" ]] || {
        echo "$1 and $2 must be both files"
        return 1
    }

    if [ "$1" -nt "$2" ]; then #; adds new line
        echo "$1"
    else 
        echo "$2"
    fi 

}
