#!/bin/tcsh

echo "Enter the integer whose factorial and double factorial you want to calculate"
set counter = $<
@ factorial = 1
@ i = $counter
while ( $i > 1 )
    @ factorial = $factorial * $i 
    @ i--
end

@ i = $counter
@ dfactorial = 1
while ( $i >= 1 )
    @ dfactorial = $dfactorial * $i
    @ i = $i - 2
end

echo "$counter\! = $factorial & $counter\!\! = $dfactorial"
