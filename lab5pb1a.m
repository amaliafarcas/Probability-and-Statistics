%a
x = [7 7 4 5 9 9 4 12 8 1 8 7 3 13 2 1 17 7 12 5 6 2 1 13 14 10 2 4 9 11 3 5 12 6 10 7];
n = length(x);
confLevel = input ('confidence level (1-alpha) = ');
alpha = 1- confLevel;
sigma = 5;
xbar = mean(x);
u1 = xbar - sigma/sqrt(n) * norminv(1-alpha/2);
u2 = xbar - sigma/sqrt(n) * norminv(alpha/2);

fprintf("The confidence interval for the mean(sigma known): is (%f, %f)\n", u1,u2);

%b
sigma2 = std(x);

u1 = xbar - sigma2/sqrt(n) * tinv(1-alpha/2, n-1);
u2 = xbar - sigma2/sqrt(n) * tinv(alpha/2, n-1);

fprintf("The confidence interval for the mean(sigma unknown): is (%f, %f)\n", u1,u2);

%c
s2 = var(x);
t1 = chi2inv(1 - alpha/2, n-1);
t2 = chi2inv(alpha/2, n-1);
ci1 = (n-1) * s2 / t1;
ci2 = (n-1) * s2 / t2;

fprintf("The confidence interval for the variance: is (%f, %f)\n", ci1,ci2);
fprintf("The confidence interval for the std: is (%f, %f)\n", sqrt(ci1), sqrt(ci2));
