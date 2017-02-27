%********************************LOGRITHM************************************
%********************************LOGRITHM************************************
%********************************LOGRITHM************************************
%********************************LOGRITHM************************************
%********************************LOGRITHM************************************
%********************************LOGRITHM************************************
%********************************LOGRITHM***********************************


%***********************find the processed output response***********************
%read bare board response
filename = 'board_phase_unwrapped.xlsx';
sheet = 'Phase';
xlRange = 'A5:B1252';
phase_fre_board = xlsread(filename,sheet,xlRange);%get date from file
phase_board = phase_fre_board(1:1:length(phase_fre_board),2);
%read unprocessed response of digital filter
filename = 'task2_RAWphase.xlsx';
sheet = 'Phase';
xlRange = 'A5:B1252';
phase_fre_filter = xlsread(filename,sheet,xlRange);%get date from file
fre_filter = phase_fre_filter(1:1:length(phase_fre_filter),1);
phase_filter = phase_fre_filter(1:1:length(phase_fre_filter),2);
%result of subtraction
phase_real = wrapTo180(phase_filter - phase_board);
phase_real(394) = 18.2902068594699;
%plot result of processed output %subtract the effect from bare board
plot(fre_filter,phase_real, 'Linewidth',2);
hold on;

%***********************find the ideal response of the digital filter*************************
rp = 0.4;
[b,a]=ellip(order, rp, stop_atte, fp);%get 
[hd, wd] = freqz(b,a,1000,8000);%magnitude and phase plots
plot(wd, angle(hd)/pi*180, 'Linewidth',2);
title('Phase Response');
legend('processed output warpped', 'ideal digital filter');
xlabel('frequency(Hz)');
ylabel('phase(degree)');


%{
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
sheet = 'Phase';
xlRange = 'C5:D1252';
phase_fre_board = xlsread(filename,sheet,xlRange);%get date from file
phase_board = wrapTo180(phase_fre_board(1:1:(length(phase_fre_board)),2));%array of phases
%read unprocessed response of digital filter
filename = 'task2_digital_unprocessed_log.xlsx';
sheet = 'Phase';
xlRange = 'C5:D1252';
phase_fre_filter = xlsread(filename,sheet,xlRange);%get date from file
phase_filter = wrapTo180(phase_fre_filter(1:1:length(phase_fre_filter),2));
fre_filter = phase_fre_filter(1:1:length(phase_fre_filter),1);
%result of subtraction
phase_real = phase_filter - phase_board;
%plot result of processed output %subtract the effect from bare board
plot(fre_filter,phase_real,'Linewidth',2);

hold on;


%***********************find the ideal response of the digital filter*************************
rp = 0.4;
[b,a]=ellip(order, rp, stop_atte, fp);%get 
[hd, wd] = freqz(b,a,1000,8000);%magnitude and phase plots
plot(wd, angle(hd)/pi*180, 'Linewidth',2);
legend('processed output', 'ideal digital filter');
legend('processed output', 'ideal digital filter');
xlabel('frequency(Hz)');
ylabel('phase(degree)');
%}