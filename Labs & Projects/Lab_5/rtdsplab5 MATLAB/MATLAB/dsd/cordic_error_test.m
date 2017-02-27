error = zeros(17,1);
iter = [iter10 iter11 iter12 iter13 iter14 iter15 iter16 iter17 iter18 iter19 iter20 iter21 iter22 iter23 iter24 iter25 iter26];
%assign real values
real_value = zeros(1,10);
j=-5;
for i = 1:1:10
    real_value(i) = cos(pi*j/5); 
    j=j+1;
end


for j = 1:1:17
    for i = 1:1:10
       error(j) = abs(iter(i,j)/(2^30)-real_value(i))+error(j);
    end
    error(j) = error(j) / 10;
end
