%***********************find the processed output response***********************
%read bare board response
filename = 'bareBoard.xlsx';
sheet = 'Gain';
xlRange = 'A5:B1252';
gain_fre_board = xlsread(filename,sheet,xlRange);%get date from file
gain_board = gain_fre_board(1:1:(length(gain_fre_board)-1),2);%array of gains
%read unprocessed response of digital filter
filename = 'task1_gainLargeRange.xlsx';
sheet = 'Gain';
xlRange = 'A5:B1252';
gain_fre_filter = xlsread(filename,sheet,xlRange);%get date from file
gain_filter = gain_fre_filter(1:1:length(gain_fre_filter),2);
fre_filter = gain_fre_filter(1:1:length(gain_fre_filter),1);
%result of subtraction
gain_real = gain_filter - gain_board;
%plot result of processed output %subtract the effect from bare board
semilogx(fre_filter(10:1:1247),gain_real(10:1:1247));

hold on;


%***********************find the ideal response of the analog filter***********************
sys = tf([1],[0.001 1]);
%bode(sys),grid;
[h, w]=freqs([1],[0.001 1]);
semilogx(w, db(h));
hold on;

%***********************find the ideal response of the digital filter*************************
[hd, wd] = freqz([1/17 1/17],[1 -15/17],1000,8000);%magnitude and phase plots
semilogx(wd, db(hd));
legend('processed output', 'ideal analogue filter', 'ideal digital filter');
