%design specification:
order = 2; %order: 4th
fp = [180/4000 450/4000]; %passband: 180-450 Hz
rp = 0.4; %passband ripple: 0.4dB
stop_atte = 23; %Stopband attenuation: 23dB

%ellip(order, ripple(dB), stopband attenuation (dB), Passband frequencies)
rp = 0.4;
[b,a]=ellip(order, rp, stop_atte, fp);%get 
figure(1);
freqz(b,a,1000,8000)%1000 is the number of points which must match the no. of data of audio analyser

figure(2);
zplane(b,a);

formatSpec = '%1.16x';
file = fopen('coef.txt','w');
fprintf(file,'#define order %d\n',length(a)-1);
fclose(file);

file = fopen('coef.txt','at');
fprintf(file,'double a[]={');
dlmwrite ('coef.txt',a,'-append');
fprintf(file,'};\n');

fprintf(file,'double b[]={');
dlmwrite ('coef.txt',b,'-append');
fprintf(file,'};');
fclose(file);

copyfile('coef.txt', 'H:\RTDSPlab\lab5\RTDSP');%copy file into RTDSP project