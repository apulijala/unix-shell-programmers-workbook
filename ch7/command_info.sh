#!/bin/bash 


function command_arg_info() {

    
    [[ ! -e "$1" ]] && {
        echo "$1 does not exist"
        return 1
    }

    [[ -f "$1" ]] && {
        echo "$1 is a file"
        return 1
    }

    [[ -d "$1" ]] && {
        echo "$1 is a directory"
        return 1
    }
}

function make_file_copy() {

    

    [ $# -ne 2 ] && {
        echo "make_file_copy dir file"
        return 1
    }

    [[ -d "$1"  && -w "$1" ]] || {
        echo "$1 must be directory and writable"
        return 1
    }

    dir="$1"
    file="$2"


    [ -f "$dir/$file" ] && cp "$dir/$file" "$dir/$file.bkup" 
    [ -f "$dir/$file" ] || touch "$dir/$file" 
}


# ./ch7/billingalarms/.terraform
# **libs**




