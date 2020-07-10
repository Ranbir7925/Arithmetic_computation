#!/bin/bash 

read -p "Enter First Number=" num_1
read -p "Enter Second Number=" num_2
read -p "Enter Third Number=" num_3

result_1=$(($num_1+$num_2*$num_3))
result_2=$(($num_1*$num_2+$num_3))
result_3=`echo "scal=2; $num_3*$num_2/$num_3" | bc`
