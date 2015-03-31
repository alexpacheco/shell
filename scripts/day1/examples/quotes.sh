#!/bin/bash

HI=Hello

echo HI           # displays HI
echo $HI          # displays Hello
echo \$HI         # displays $HI
echo "$HI"        # displays Hello
echo '$HI'        # displays $HI
echo "$HIAlex"    # displays nothing
echo "${HI}Alex"  # displays HelloAlex
echo `pwd`        # displays working directory
echo $(pwd)       # displays working directory
