#!/bin/bash

narg=($#)
if [ $narg -ne 2 ]; then
  echo "2 arguments needed:[Number of atoms] [Velocity file]\n"
  exit 1
fi

natom=$1
vels=$2

cat TRAJECTORY | \
  awk '{ if ( NR % '$natom' == 0){ \
           printf " %s %s %s\n",$5,$6,$7 \
         }else{ \
           printf " %s %s %s",$5,$6,$7 \
         } \
       }' > $vels


