x = [7 7 4 5 9 9 4 12 8 1 8 7 3 13 2 1 17 7 12 5 6 2 1 13 14 10 2 4 9 11 3 5 12 6 10 7];
n = length(x);
conflvl = input('confidence level: ');
alpha = 1 - conflvl;
sigma = 5;
xbar = mean(x);
u1 = xbar - sigma/sqrt(n) * norminv(1-alpha/2);
u2 = xbar - sigma/sqrt(n) * norminv(alpha/2);

fprintf("The confidence interval for the mean(sigma known): is (%f, %f)\n", u1,u2);

