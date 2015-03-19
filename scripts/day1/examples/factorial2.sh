#!/bin/bash

echo -n "Enter a number less than 10: "
read counter
factorial=1
until [ $counter -le 1 ]; do                                                                                                                                         
  factorial=$[ $factorial * $counter ]
  if [ $counter -eq 2 ]; then 
    break
  else
    let counter-=2
  fi                                                                                                                                        
done                                                                                                                                                            
echo $factorial
