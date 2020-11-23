#!/bin/bash -x 
function test_file() {

    if [[ -e "$1" && -f "$1" ]]
    then 
        echo "$1 is a file"
    else 
        echo "$1 is not a file"
    fi
}

function test_file_dir_exists() {

    if [ -e "$1" ]; then 
        if [ -f "$1" ]; then 
            echo "$1 is a file"
        elif [ -d "$1" ]; then 
            echo "$1 is a directory"
        fi

    else 
        echo "$1 does not exist"
    fi 
}

function rewrite_without_if_statements {

    [ -e "$1" ] && {

        [ -f "$1" ] && {
            echo "$1 is a file"
            return # so further action required. 
        }

        [ -d "$1" ] && {
            echo "$1 is a directory"
            return
        }

    }

    [ -e "$1" ] || {
        echo "$1 does not exist"
    }
}

function set_no_clobber() {
    set -o noclobber
    [ -o noclobber ]   && echo "clobber set"
    set -o  | grep noclobber
    set +o noclobber 
    [ ! -o noclobber ]   && echo "clobber not set"
    set -o  | grep noclobber
}

function verify_strings() {
    var="hello"
    [ "$var" = "hello" ] && {
        echo "Strings $var and hello are equal"
    }
    
    var="good-bye"
    [ "$var" != "hello" ] && {
        echo "Strings hello and $var are not equal"
    }
    

}   

