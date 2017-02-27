%subtract the effect from bare board
%find the real response of the digital filter

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
%plot result
semilogx(fre_filter(10:1:1247),gain_real(10:1:1247));
