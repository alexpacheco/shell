#!/bin/tcsh

echo -n "Enter a number less than 10: "
set counter = $<                                                                                                                                                  
set factorial = 1                                                                                                                                                 
while ( $counter > 0 )
   @ factorial = $factorial * $counter
   @ counter -= 1                                                                                                                                     
end                                                                                                                                                             
echo $factorial

