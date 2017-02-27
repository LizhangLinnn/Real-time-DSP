clear all;
%read from files
fileID = fopen('iter10.dat','r');
A = textscan(fileID,'%s');
fclose(fileID);
%read from files
fileID = fopen('iter11.dat','r');
A(2) = textscan(fileID,'%s');
fclose(fileID);
%read from files
fileID = fopen('iter12.dat','r');
A(3) = textscan(fileID,'%s');
fclose(fileID);
%read from files
fileID = fopen('iter13.dat','r');
A(4) = textscan(fileID,'%s');
fclose(fileID);
%read from files
fileID = fopen('iter14.dat','r');
A(5) = textscan(fileID,'%s');
fclose(fileID);
%read from files
fileID = fopen('iter15.dat','r');
A(6) = textscan(fileID,'%s');
fclose(fileID);
%read from files
fileID = fopen('iter16.dat','r');
A(7) = textscan(fileID,'%s');
fclose(fileID);
%read from files
fileID = fopen('iter17.dat','r');
A(8) = textscan(fileID,'%s');
fclose(fileID);
%read from files
fileID = fopen('iter18.dat','r');
A(9) = textscan(fileID,'%s');
fclose(fileID);
%read from files
fileID = fopen('iter19.dat','r');
A(10) = textscan(fileID,'%s');
fclose(fileID);
%read from files
fileID = fopen('iter20.dat','r');
A(11) = textscan(fileID,'%s');
fclose(fileID);
%read from files
fileID = fopen('iter21.dat','r');
A(12) = textscan(fileID,'%s');
fclose(fileID);
%read from files
fileID = fopen('iter22.dat','r');
A(13) = textscan(fileID,'%s');
fclose(fileID);
%read from files
fileID = fopen('iter23.dat','r');
A(14) = textscan(fileID,'%s');
fclose(fileID);
%read from files
fileID = fopen('iter24.dat','r');
A(15) = textscan(fileID,'%s');
fclose(fileID);
%read from files
fileID = fopen('iter25.dat','r');
A(16) = textscan(fileID,'%s');
fclose(fileID);
%read from files
fileID = fopen('iter26.dat','r');
A(17) = textscan(fileID,'%s');
fclose(fileID);


%assign real values
real_value = zeros(1,11);
k=0;
for a = 1:1:11
    real_value(a) = cos(pi*k/10); 
    k=k+1;
end


B=zeros(11,11);
AveError = zeros(17,1);
for j = 1:1:17
    for i = 1:1:11
       B(i,j) = bin2dec(A{j}{i})/2^30; %convert binary to decimal
       if(B(i,j)>2)
          B(i,j) = B(i,j)-4; %convert unsigned value to signed value (32bit)
       end
       AveError(j) = abs(B(i,j)-real_value(i))+ AveError(j); %calculate average error
    end 
    AveError(j) = AveError(j)/11;
end

subplot(211)
plot([10:26],AveError,'Linewidth',2);
xlabel('Iter Num');
ylabel('Averaged Absolute Error');

subplot(212)
plot([21:1:26],AveError(12:17),'Linewidth',2);
xlabel('Iter Num');
set(gca,'Xtick',21:1:27);
ylabel('Averaged Absolute Error');
