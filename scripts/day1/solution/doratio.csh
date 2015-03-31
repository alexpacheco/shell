#!/bin/tcsh

echo "Enter first integer"
set num1 = $<
set num2 = $<

echo "$num1 / $num2 = " $num1 / $num2

@ RATIO = $num1 / $num2
echo "ratio of $num1 & $num2 is " $RATIO

set ratio=`echo "scale=5 ; $num1/$num2" | bc`
echo "ratio of $num1 & $num2 is " $ratio

exit
