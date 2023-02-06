clear ALL
clc;

N = input('number of simulations = ');
p = input('probability of success (p in (0, 1)) = ');

U = rand;
X = (U<p);


for i = 1:N
    %the ith simulation
    U = rand;
    X(i) = (U<p);
end

U_X = unique(X);
n_X = hist(X, length(U_X)); %count the freq of occ 
relative_freq = n_X/N;
[U_X; relative_freq]