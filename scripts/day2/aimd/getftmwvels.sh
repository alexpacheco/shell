#!/usr/bin/env octave -qf


if(nargin!=4)
   printf ("%s\n", "This script needs 4 arguments, [Velocity File (input)], [FT-VAC File (output)], [Number of Atoms], [Time Step in fs]" )
endif

arg_list = argv();
printf ("Argument list:");
for i = 1:nargin
  printf (" %s", arg_list{i});
endfor
printf ("\n");

Vels = arg_list{1};
VelsFT = arg_list{2};
NAtoms = eval(arg_list{3});
deltat = eval(arg_list{4});

M = NAtoms*3;
mwvels = load(Vels);
N = rows(mwvels);
ftmwvels = abs(fft(mwvels,N));
fid = fopen(VelsFT,"w");

dw = 1/(N*deltat);
for I=[1:N]
  sumft=0;
  for J=[1:M]
    sumft=sumft+ftmwvels(I,J)^2;
  endfor
  fprintf(fid," %15.8e  %21.14e\n",(I-1)*dw,sumft);
endfor
fclose(fid);

# Below was added for octave tutorial
A=load(VelsFT);
int=A(:,1)*33356; # convert from fs^-1 to cm^-1
spectra_orig=A(:,2)/norm(A(:,2)); # normalized original spectra
# Do interpolation of Spectra for octave demo
intensity=linspace(0,4000,400000);
# Linear Interpolation
spectra_lin=interp1(int,spectra_orig,intensity,'linear');
# Spline Interpolation
spectra_spl=interp1(int,spectra_orig,intensity,'spline');
# Cubic Interpolation
spectra_cub=interp1(int,spectra_orig,intensity,'cubic');

plot(int,spectra_orig,'r',intensity,spectra_lin+0.2,'g', \
  intensity,spectra_spl+0.4,'b',intensity,spectra_cub+0.6,'m');

legend("original","linear","spline","cubic");
axis([0,4000,0,1]);
xlabel('Frequency');
ylabel('Normalized Spectra');

print -color -deps spectra.eps;
