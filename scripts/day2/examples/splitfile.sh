#!/bin/bash

csplit h2o-opt-freq.log "/Normal termination of Gaussian 09/+1"
split -l 758 -d -a 5 h2o-opt-freq.log water
