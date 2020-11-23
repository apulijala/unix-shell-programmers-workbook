#!/usr/bin/env ./libs/bats/bin/bats 
# This is loading bats environment. don't know how. 

load 'libs/bats-support/load'
load 'libs/bats-assert/load'

function setup() {
    source ../command_info.sh
    touch file
    [ -e dir ] || mkdir dir
    touch dir/file
}


@test 'test existence' {
    run command_arg_info file1
    assert_line 'file1 does not exist'

    
}

@test 'test file' {
    run command_arg_info file
    assert_output 'file is a file'
}


@test 'test directory' {
    run command_arg_info dir
    assert_output 'dir is a directory'
    
}

@test "test file copy invalid args more" {
    run make_file_copy dir dir1 dir2
    [ "$status" -eq 1 ] 
    assert_output "make_file_copy dir file"
}

@test "test file copy invalid args" {
    run make_file_copy 
     [ "$status" -eq 1 ] 
    assert_output "make_file_copy dir file"
}

@test "test first argument must be directory" {
    run make_file_copy dir1 file
    # [ "$status" -eq 1 ] 
    assert_output "dir1 must be directory and writable"
}

@test "test directory is writable" {
   # skip # don't know why it is not working. 
    [[ -e dir1 ]] || mkdir dir1
    chmod a-w dir1 # as bats is being executed by someone else
    run make_file_copy dir1 file
    assert_output "dir1 must be directory and writable"
    [[ -e dir1 ]] && rmdir dir1
}

@test "check duplicate is created if file exists" {

    run make_file_copy dir file
    [ -f "dir/file.bkup" ]
}


@test "check duplicate is created if file exists" {

    run make_file_copy dir file1
    [ -f "dir/file1" ]
    rm "dir/file1"
}



function teardown() {
    echo "nothing"
    rm file; rm -rf dir
}
