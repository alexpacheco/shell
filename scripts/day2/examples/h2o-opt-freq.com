%chk=h2o-opt-freq.chk
%mem=512mb
%NProcShared=4
#p b3lyp/6-31G opt freq gfinput

H2O OPT FREQ B3LYP

0 1
 O
 H    1    r1
 H    1    r1       2    a1
 r1   1.05                     
 a1  109.47122                  

