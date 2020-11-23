#!/bin/bash 

declare -A diary # declare outside of the function.  

function reminder() {

    mydate="$1"
    message="$2"
    diary["$mydate"]="$message"
}


function todo() {
    mydate="$1"
    echo "$mydate:  ${diary[$mydate]}"
}
