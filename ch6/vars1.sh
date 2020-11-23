#!/bin/bash 

typeset -i i j k
typeset -F i j k
typeset -F x y z

i=3.5; j=4.9; k=99.99 
echo "Using the variables i=$i, j=$j, k=$k"
x=3.5; y=4.9; z=99.99 
echo "Using the variables x=$x, y=$y, z=$z"
i=hello; x="Hello, world!"
echo "i=$i and x=$x"

typeset +n alpha beta gamma
typeset -n gamma=delta
typeset -n delta=mydelta # resassignmet is happenging. this is valid. 

alpha="helloalpha"; beta="hellobeta"; gamma="hellogamma"; delta="hellodelta"; mydelta="myhellodelta"
echo "alpha=$alpha; beta'$beta gamma=$gamma  delta=$delta and mydelta=$mydelta"

i=9; j=5; 
echo "i is $((i=i+j))"
echo "i now is $((i+=j))"
echo "i now is $((i%=j))"

i=3; j=5; k=7
unset m 
m="i*j%k"
echo $((i*j%k))
echo $((k=m))
echo $k


declare -i l m n 
declare -F o p q

l=4; m=10; n=30
echo "l=$l; m=$m and n=$n"

l=4.4; m=10.4; n=30.5
echo "l=$l; m=$m and n=$n"

declare -l name 
name="HEllO"
echo "name is $name"
x=$(echo "3.1412*2" | bc)
echo "pi is $x"


declare -a days
days[0]="Monday"
days[1]="Tuesday"
days[2]="Wednesday"
days[3]="Thursday"
days[4]="Friday"
days[5]="Saturday"
days[6]="Sunday"

echo "Fifth day is " ${days[4]}
echo "Seventh day is " ${days[6]}

days=("Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday")
echo "Fifth day using second syntax is " ${days[4]}
echo "Seventh day using second is " ${days[6]}


echo "Number of days in a week is " "${#days[@]}"
echo "day of week is " "${#days[2]}"
echo "Number of days in a week is " ${days[*]}

declare -A venus mars 
venus["domain"]="cs.qc.edu"
venus["address"]="149.4.44.10"
venus["building"]="Science Building"
venus["room"]="A-219"

echo "number of elements in venus are " "${#venus[@]}"
echo "values of elements are" "${venus[@]}"
echo "keys of elements are" "${!venus[@]}"

echo "number of elements in venus are " "${#mars[@]}"
echo "values of elements are" "${mars[@]}"
echo "keys of elements are" "${!mars[@]}"


for day in "${days[@]}"
do 
    echo "Day is $day"
done


for key in "${!venus[@]}"
do 
    echo "Key is $key and value is ${venus[$key]}"
done
