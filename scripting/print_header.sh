#!/bin/bash
print_header () {
	cols=$( tput cols )
	rows=$( tput lines )

	if [ $cols -lt 62 ]
	then
		printf "Try to grow your terminal\n"
		exit
	fi
	tput clear
	counter=0
	while [ $counter -lt $cols  ]
	do
		printf "#"
		counter=$(( $counter + 1 ))
	done
	printf "#"
	sleep 0.1
	counter=0
	while [ $counter -lt $(( $cols - 2 ))  ]
	do
		printf " "
		counter=$(( $counter + 1 ))
	done
	printf "##"
	sleep 0.1
	counter=0
	while [ $counter -lt $(( $cols - 30 ))  ]
	do
		printf " "
		counter=$(( $counter + 1 ))
	done
	counter=$(( $counter + 20 ))
	printf "   ___   ___   ___"
	while [ $counter -lt $cols ]
	do
		printf " "
		counter=$(( $counter + 1 ))
	done
	printf "##"
	sleep 0.1
	printf "      Created by: oouklich"
	counter=26
	while [ $counter -lt $(( $cols - 30 ))  ]
	do
		printf " "
		counter=$(( $counter + 1 ))
	done
	printf "|     |     |     |"
	counter=$(( $counter + 21 ))
	while [ $counter -lt $cols ]
	do
		printf " "
		counter=$(( $counter + 1 ))
	done
	printf "##"
	sleep 0.1
	counter=0
	while [ $counter -lt $(( $cols - 30 ))  ]
	do
		printf " "
		counter=$(( $counter + 1 ))
	done
	printf "|  ___|  ___|     |"
	counter=$(( $counter + 21 ))
	while [ $counter -lt $cols ]
	do
		printf " "
		counter=$(( $counter + 1 ))
	done
	printf "##"
	sleep 0.1
	counter=30
	printf "      ouklichoussama@gmail.com"
	while [ $counter -lt $(( $cols - 30 ))  ]
	do
		printf " "
		counter=$(( $counter + 1 ))
	done
	printf "|     |     |     |"
	counter=$(( $counter + 21 ))
	while [ $counter -lt $cols ]
	do
		printf " "
		counter=$(( $counter + 1 ))
	done
	printf "##"
	sleep 0.1
	counter=0
	while [ $counter -lt $(( $cols - 30 ))  ]
	do
		printf " "
		counter=$(( $counter + 1 ))
	done
	printf "|  ___|  ___|     |"
	counter=$(( $counter + 21 ))
	while [ $counter -lt $cols ]
	do
		printf " "
		counter=$(( $counter + 1 ))
	done
	printf "##"
	sleep 0.1
	counter=2
	while [ $counter -lt $cols  ]
	do
		printf " "
		counter=$(( $counter + 1 ))
	done
	printf "#"
	counter=0
	while [ $counter -lt $cols  ]
	do
		printf "#"
		counter=$(( $counter + 1 ))
	done
}
print_header
