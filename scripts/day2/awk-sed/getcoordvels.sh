#!/bin/bash

narg=($#)
if [ $narg -ne 6 ]; then
  echo "4 arguments needed: [GAMESS output file] [Number of atoms] [Time Step (fs)] [Coordinates file] [Velocity file] [Fourier Transform Vel. File]"
  exit 1
fi

gmsout=$1
natoms=$2
deltat=$3
coords=$4
vels=$5
ftvels=$6
au2ang=0.5291771
sec2fs=1e15
mass=mass.dat

rm -rf $vels $coords $ftvels

######## Atomic Masses (needed for MW Velocities) ########## 
cat $gmsout | sed -n '/ATOMIC ISOTOPES/,/1 ELECTRON/p' | \
  egrep -i = | \
  sed -e 's/=//g' | \
  xargs | awk '{for (i=2;i<=NF;i+=2){printf "%s\n",$i;printf "%s\n",$i;printf "%s\n",$i}}' > $mass
## Use the following with grep####
#grep -i -A1 'ATOMIC ISOTOPES' $gmsout | \
#	grep -iv atomic | \
#	awk '{for (i=2;i<=NF;i+=2){printf "%s\n",$i;printf "%s\n",$i;printf "%s\n",$i}}' > $mass
## Use the following with grep and sed ####
#grep -i -A1 'ATOMIC ISOTOPES' $gmsout | \
#	sed -e '/ATOMIC/d' -e 's/[0-9]=//g' | \
#	awk '{for (i=1;i<=NF;i+=1){printf "%s\n",$i;printf "%s\n",$i;printf "%s\n",$i}}' > $mass

######## Coordinates and Velocities ########################
awk '/           CARTESIAN COORDINATES / { \
  icount=3; \
  printf "%d\n\n",'$natoms'
  while (getline>0 && icount<=7){ \
    print $0 ;\
    ++icount \
  } \
}' $gmsout | sed '/----/d' > tmp.$$ 

#egrep -i -A5 'cartesian coordinates' $gmsout | \
#	sed -e '/CARTESIAN/d' -e '/----/d' > tmp.$$
#
cat tmp.$$ | cut -c -42 | \
  awk '{if ( NF == 4){ \
	  printf " %4.2f %9.6f %9.6f %9.6f\n",$1,$2*'$au2ang',$3*'$au2ang',$4*'$au2ang' \
	} else { \
	  print $0 \
	} \
	}' > $coords
cat tmp.$$ | cut -c 42- | sed '/^ *$/d' | \
  awk '{if ( NR % '$natoms' ==0){ \
	  printf " %15.8e %15.8e %15.8e\n",$1*'$sec2fs',$2*'$sec2fs',$3*'$sec2fs' \
	  } \
	else { \
	  printf " %15.8e %15.8e %15.8e",$1*'$sec2fs',$2*'$sec2fs',$3*'$sec2fs' \
	} \
      }' > $vels

rm -rf tmp.$$


octave -q <<EOF
vels=load("$vels");
atmass=load("$mass");
atmass=diag(atmass);
mwvels=vels*atmass;
ftmwvels=abs(fft(mwvels));
N=rows(ftmwvels);
M=columns(ftmwvels);
deltaw=1/N/$deltat;
fid=fopen("$ftvels","w");
for I=[1:N]
  sumft=0;
  for J=[1:M]
    sumft=sumft+ftmwvels(I,J)^2;
  endfor
  fprintf(fid," %15.8e  %21.14e\n",(I-1)*deltaw,sumft);
endfor
fclose(fid);
EOF

gnuplot << EOF
set title ""
set xlabel "Frequency (cm^{-1})"
set ylabel ""
set xrange [0:4000]
plot "$ftvels" u (\$1*33356):2 title '' w l
pause 50
EOF
