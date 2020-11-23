#!/usr/bin/env ./libs/bats/bin/bats 
load 'libs/bats-support/load'
load 'libs/bats-assert/load'



function setup() {
    # load the functions file. 
    source ../months.sh
    touch remove # Need to created for tear down to work. 
    
}

@test "verify months" {
    run verify_months "January" ../Months
    [ "$status" -eq 0 ]
    [ "$output" == "\"January\" is the name of the month." ]    
}

@test "months lower case" {
    run verify_months "january" ../Months
    [ "$status" -eq 0 ]
    [ "$output" == "\"january\" is the name of the month." ]
}

@test "months no match" {
    
    run verify_months "january February" ../Months
    [ "$status" -eq 1 ]
    [ "$output" == "\"january February\" is not the name of the month." ]

    # with spaces. 
    run verify_months "january " ../Months
    [ "$status" -eq 1 ]
    [ "$output" == "\"january \" is not the name of the month." ]
 
}

@test "no spaces" {
    run verify_months " january " ../Months
    [ "$status" -eq 1 ]
    [ "$output" == "\" january \" is not the name of the month." ]
}

@test 'assert_output() literal check for months' {
    run verify_months " january " ../Months
    assert_output "\" january \" is not the name of the month."
}


# As I have confidence in Andrew. My work 
# practices are improving. 

@test 'check day' {
    # run the function defined. 
    run verify_months_and_days Monday ../Months ../Days
    assert_line "\"Monday\" is the name of the day."
} 


@test 'check month' {
    run verify_months_and_days January ../Months ../Days
    assert_line "\"January\" is the name of the month."
} 


@test 'check no match' {
    run verify_months_and_days January12 ../Months ../Days
    assert_line "\"January12\" is neither month or a day"
} 

@test 'check passing option as parameter' {
    
    run verify_months_and_days "-v" ../Months ../Days
    assert_line "\"-v\" is neither month or a day"

}

function teardown() {
   [ -e remove ] && rm remove  
}
