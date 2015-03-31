#!/bin/bash

GMSOUT=$1
grep 'TIME     MODE' $GMSOUT | head -1 > energy.dat
awk '/    FS       BOHR/{getline;print }' $GMSOUT >> energy.dat
