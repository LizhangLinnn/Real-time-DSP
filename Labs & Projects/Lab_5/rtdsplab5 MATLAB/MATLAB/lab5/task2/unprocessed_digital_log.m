%********************************LOGRITHM************************************
%********************************LOGRITHM************************************
%********************************LOGRITHM************************************
%********************************LOGRITHM************************************
%********************************LOGRITHM************************************
%********************************LOGRITHM************************************
%********************************LOGRITHM***********************************

subplot(211);
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
semilogx(fre_filter,gain_real, 'Linewidth',2);
hold on;

%***********************find the ideal response of the digital filter*************************
rp = 0.4;
[b,a]=ellip(order, rp, stop_atte, fp);%get 
[hd, wd] = freqz(b,a,1000,8000);%magnitude and phase plots
semilogx(wd, db(hd), 'Linewidth',2);
legend('processed output', 'ideal digital filter');
xlabel('frequency(Hz)');
ylabel('magnitude(dB)');

%********************************LINEAR************************************
%********************************LINEAR************************************
%********************************LINEAR************************************
%********************************LINEAR************************************
%********************************LINEAR************************************
%********************************LINEAR************************************
%********************************LINEAR************************************
%********************************LINEAR************************************
subplot(212);
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


%***********************find the ideal response of the digital filter*************************
rp = 0.4;
[b,a]=ellip(order, rp, stop_atte, fp);%get 
[hd, wd] = freqz(b,a,1000,8000);%magnitude and phase plots
plot(wd, db(hd), 'Linewidth',2);
legend('processed output', 'ideal digital filter');
legend('processed output', 'ideal digital filter');
xlabel('frequency(Hz)');
ylabel('magnitude(dB)');