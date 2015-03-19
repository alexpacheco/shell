#!/bin/bash

echo "Enter two integers"
read num1 num2

echo "$num1 + $num2 = " $num1 + $num2
echo "$num1 + $num2 = " $(($num1 + $num2))

let SUM=$num1+$num2
echo "sum of $num1 & $num2 is " $SUM

echo "$num1/$num2 = " $(echo "scale=5;$num1/$num2" | bc)
echo "$num2/$num1 = " $(bc -l <<< $num2/$num1)

exit
