#!/usr/bin/env ./libs/bats/bin/bats
load 'libs/bats-support/load'
load 'libs/bats-assert/load'


function setup() {
    source ../files.sh
    touch file 
    sleep 1 # so definelty know that in
    touch file1
}

@test "invalid less arguments" {
    run newer file
    [ "$status" -eq 1 ]
    assert_output "Usage: newer file file1"
}


@test "test newer pass" {
    run newer file file1
    [ "$status" -eq 0 ] 
    assert_output 'file1'
}

@test "test newer inverted" {
    run newer file1 file
    [ "$status" -eq 0 ] 
    assert_output 'file1'
}

@test 'test invalid files' {

    [[ -e file3 ]] && rm file3
    run newer file3 file
    [ "$status" -eq 1 ] 
    assert_output "file3 and file must be both files"


}



function teardown() {
    rm file
    rm file1
}


