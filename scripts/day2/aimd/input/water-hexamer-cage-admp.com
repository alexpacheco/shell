%chk=water-hexamer-cage-admp.chk
%mem=512mb
%nprocshared=4

#n b3lyp/6-31+G(d,p) admp(stepsize=2500,maxpoints=4000,NKE=24226) guess=read

ADMP: 1ps dynamics of water hexamer at 300K with dt=0.25fs and mu=0.1amu
Water Hexamer Cage Structure Hincapi et. al. JPCA, 7809, 114 (2010)
optimization+frequency calculation @ /home/apacheco/CompChem/ElecStr/Opt-Freq/GAUSSIAN/water-hexamer

0 1
  O     0.978969532638     -1.142644543287      1.451493357825
  H     1.024252825027     -1.529200357649      0.546750520997
  H     1.544848174496     -0.355925188777      1.362206956933
  O    -1.499402508757     -0.224594152702      1.426663356920
  H    -2.028458101278     -0.444911512141      2.202466935264
  H    -0.584097619753     -0.616359104755      1.558170993853
  O     1.954859826888      1.114720785859     -0.120870190621
  H     1.087127550567      1.589371632855     -0.140502638715
  H     2.647564620247      1.779238286895     -0.214438340227
  O    -0.618623237046      2.026584632638     -0.136598171261
  H    -1.001930820176      1.546858861773      0.621248088281
  H    -1.029263477339      1.588949006923     -0.900652758489
  O    -1.713634054603     -0.432717434496     -1.314196197016
  H    -2.464018480644     -0.821588311245     -1.779083531746
  H    -1.871909458873     -0.539606274582     -0.350184344444
  O     1.028443339429     -1.401646974904     -1.317491608096
  H     0.110309173467     -1.151771438626     -1.530268037147
  H     1.520672425868     -0.562674105541     -1.287718226581

