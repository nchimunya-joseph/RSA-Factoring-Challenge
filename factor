#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <file>"
	exit 1
fi

file="$1"

while read -r number || [ -n "$number" ]; do
	divisor=2
	while [ $divisor -le $(( number / 2)) ]; do
		if [ $((number % divisor)) -eq 0 ]; then
			factor1=$divisor
			factor2=$((number / divisor))
			echo "$number=$factor1*$factor2"
		fi
		divisor=$((divisor + 1))
	done
done < "$file"
