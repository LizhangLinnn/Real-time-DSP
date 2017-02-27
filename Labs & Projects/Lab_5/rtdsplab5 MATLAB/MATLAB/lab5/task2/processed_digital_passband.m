%***********************find the processed output response***********************
%read bare board response
filename = 'bareBoard_log.xlsx';
sheet = 'Gain';
xlRange = 'A5:B1252';
gain_fre_board = xlsread(filename,sheet,xlRange);%get date from file
gain_board = gain_fre_board(1:1:(length(gain_fre_board)),2);%array of gains
%read unprocessed response of digital filter
filename = 'task2_digital_unprocessed_log.xlsx';
sheet = 'Gain';
xlRange = 'A5:B1252';
gain_fre_filter = xlsread(filename,sheet,xlRange);%get date from file
gain_filter = gain_fre_filter(1:1:length(gain_fre_filter),2);
fre_filter = gain_fre_filter(1:1:length(gain_fre_filter),1);
%result of subtraction
gain_real = gain_filter - gain_board;
%plot result of processed output %subtract the effect from bare board
plot(fre_filter,gain_real,'Linewidth',2);
hold on;

%add horizontal lines (boundaries)
flag1=0;
flag2=0;
%index180 = 0;%the index for the lower frequency bound of passband
%index450 = 0;%the index for the upper frequency bound of passband
for i=1:1:length(fre_filter)
   if(fre_filter(i)>=180 && flag1 == 0)
        index180 = i;
        flag1 = 1;
   end
   if(fre_filter(i)>=450 && flag2==0)
        index450 = i;
        flag2 = 1;
   end
end
UB = max(gain_real(index180:1:index450)); %upper boundary
LB = min(gain_real(index180:1:index450)); %lower boundary
plot ([180 450],[UB UB]);%upper boundary
hold on;
plot ([180 450],[LB LB]);%lower boundary



%***********************find the ideal response of the digital filter*************************
%design specification:
order = 2; %order: 4th
fp = [180/4000 450/4000]; %passband: 180-450 Hz
rp = 0.4; %passband ripple: 0.4dB
stop_atte = 23; %Stopband attenuation: 23dB
[b,a]=ellip(order, rp, stop_atte, fp);%get 
[hd, wd] = freqz(b,a,1000,8000);%magnitude and phase plots
plot(wd, db(hd), 'Linewidth',2);
grid;
title('magnitude response');
xlabel('frequency(Hz)');
ylabel('magitude(dB)');
legend('processed output','passband maximum gain','passband minimum gain','ideal digital filter');