#!/bin/bash 

declare -A results
read -p "Enter First Number=" num_1
read -p "Enter Second Number=" num_2
read -p "Enter Third Number=" num_3

result_1=$(($num_1+$num_2*$num_3))
result_2=$(($num_1*$num_2+$num_3))
result_3=`echo "scal=2; $num_3*$num_2/$num_3" | bc`
result_4=$(($num_1%$num_2+$num_3))

results[result_1]=$result_1
results[result_2]=$result_2
results[result_3]=$result_3
results[result_4]=$result_4

count=0
for result in ${results[@]}
do
	resultArr[(count++)]=$result
done
echo Original Array: ${resultArr[@]}

length=${#resultArr[@]}
for((i=0;i<$length-1;i++))
do
	for((j=0;j<$length-1;j++))
	do
		if [ ${resultArr[j]%.*} -lt ${resultArr[j+1]%.*} ]
		then
			temp=${resultArr[j]}
			resultArr[j]=${resultArr[j+1]}
			resultArr[j+1]=$temp
		fi
	done
done
echo Descending Order: ${resultArr[@]}


for((i=0;i<$length-1;i++))
do
        for((j=0;j<$length-1;j++))
        do
                if [ ${resultArr[j]%.*} -gt ${resultArr[j+1]%.*} ]
                then
                        temp=${resultArr[j]}
                        resultArr[j]=${resultArr[j+1]}
                        resultArr[j+1]=$temp
                fi
        done
done
echo Ascending Order: ${resultArr[@]}
