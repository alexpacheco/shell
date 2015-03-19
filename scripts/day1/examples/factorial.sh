#!/bin/bash

echo -n "Enter a number less than 10: "
read counter                                                                                                                                                      
factorial=1                                                                                                                                                     
while [ $counter -gt 0 ]
do
   factorial=$(( $factorial * $counter ))                                                                                                                       
   counter=$(( $counter - 1 ))                                                                                                                                  
done                                                                                                                                                            
echo $factorial

