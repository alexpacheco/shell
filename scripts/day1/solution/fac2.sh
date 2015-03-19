#!/bin/bash

echo "Enter the integer whose factorial and double factorial you want to calculate"
read counter
factorial=1
i=$counter
while [ $i -gt 1 ]; do
  factorial=$[ $factorial * $i ]
	let i-=1
done

i=$counter
dfactorial=1
until [ $i -le 2 ]; do
	dfactorial=$[ $dfactorial * $i ]
	let i-=2
done

echo "$counter! = $factorial & $counter!! = $dfactorial"
