rp = 0.4;           % Passband ripple
rs = 48;          % Minimum stop band attenuation
fs = 8000;        % Sampling frequency
f = [375 450 1600 1740];   % passband and stopband Cutoff frequencies
a = [0 1 0];        % Desired amplitudes
dev = [10^(-rs/20) (10^(rp/20)-1)/(10^(rp/20)+1) 10^(-rs/20)];% maximum allowance ripple

[n,fo,ao,w] = firpmord(f,a,dev,fs);%calculate an approximate filter
%n is filter order
%fo stands for the normalised frequency edges
%a0 is the frequency amplitudes
%w stands for the weights
 
b = firpm(n+7,fo,ao,w); %b is a vector which stores the coefficients

freqz(b,1,1024,fs);%magnitude and phase plots

%create a text file called 'file_b.txt' where coefficients are stored and
%elements are defined
%define N 
file = fopen('file_b.txt','wt');
fprintf(file, '#define N %d \n', n+8); 
fclose(file);

%store coefficients into the file
file = fopen('file_b.txt','at');
fprintf(file,'double b[]={');
dlmwrite ('file_b.txt',b,'-append');
fprintf(file,'};');
fclose(file);