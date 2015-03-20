#!/bin/bash

echo "BASH script to extract velocity information from CPMD Trajectory files and obtain Velocity Fourier Transforms using octave"
echo "Usage ./getcpmdvels.sh 18 cpmdvels.dat"
./getcpmdvels.sh 18 cpmdvels.dat

echo "BASH script to extract energy data from GAMESS DRC calculation"
echo "./getengcons.sh nh3-drc.out (output is written to energy.dat)"
./getengcons.sh nh3-drc.out

echo "BASH script to extract coordinates and velocities from GAMESS DRC calculations and obtain Velocity Fourier Transforms using octave"
echo "Usage: ./getcoordvels.sh nh3-drc.out 4 0.25 <output: coords file in xyz format> <output: vels file> <output: ftvels file>"
./getcoordvels.sh nh3-drc.out 4 0.25 nh3drc.xyz nh3drc.vels nh3drc.ftvels

echo "AWK script to extract mass weighted velocities from GAUSSIAN ADMP calculations"
echo "Usage: ./getmwvels.sh water-hexamer-cage-admp.log 18 <output: mwvels file>"
./getmwvels.awk water-hexamer-cage-admp.log 18 admpvels.out

echo "AWK script to extract nuclear coordinates from GAUSSIAN ADMP calculations"
echo "Usage: ./gettrajxyz.sh water-hexamer-cage-admp.log 18 <output: coords file in xyz format>"
./gettrajxyz.awk water-hexamer-cage-admp.log 18 traj.xyz


exit
