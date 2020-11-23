#!/usr/bin/env ./libs/bats/bin/bats
load 'libs/bats-support/load'
load 'libs/bats-assert/load'

function setup() {
    source ../s721.sh
}

@test "file exists" {
    
    run touch file
    run test_file file
    assert_output 'file is a file'
    rm file
}

@test "file not exists" {
    run test_file_dir_exists file
    assert_output 'file does not exist'
}

@test "check directory exists" {
    run mkdir -p test/test2
    run test_file_dir_exists test/test2
    assert_output 'test/test2 is a directory'
    rm -rf test/test2 
}

@test "test arguments with options" {
    run test_file_dir_exists "-v"
    assert_output "-v does not exist"
}

@test "file not exists no if" {
    run rewrite_without_if_statements file
    assert_output 'file does not exist'
}

@test "check directory exists no if" {
    run mkdir -p test/test2
    run rewrite_without_if_statements test/test2
    assert_output 'test/test2 is a directory'
    rm -rf test/test2 
}

@test "test arguments with options no if" {
    run rewrite_without_if_statements "-v"
    assert_output "-v does not exist"
}

@test 'test no clobber' {
    run set_no_clobber
    assert_line 'clobber set'
    assert_line 'noclobber      	on'
    assert_line 'clobber not set'
    assert_line 'noclobber      	off'
}

@test 'test strings single brace' {
    run verify_strings
    assert_line "Strings hello and hello are equal"
    assert_line "Strings hello and good-bye are not equal"

}
