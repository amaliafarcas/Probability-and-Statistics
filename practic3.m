x = [3.26 1.89 2.42 2.03 3.07 2.95 1.39 3.06 2.46 3.35 1.56 1.79 1.76 3.82 2.42 2.96];
n = length(x);
confLevel = input ('confidence level (1-alpha) = ');
alpha = 1- confLevel;
xbar = mean(x);

sigma2 = std(x);

u1 = xbar - sigma2/sqrt(n) * tinv(1-alpha/2, n-1);
u2 = xbar - sigma2/sqrt(n) * tinv(alpha/2, n-1);

fprintf("The confidence interval for the mean(sigma unknown): is (%f, %f)\n", u1,u2);

%b

 
% b) sigma unknown 
alpha = input('significance value = ');
m0 = input('testing value = ');
[H, P, CI, STATS] = ttest(x, m0, alpha, 1);
RR = [tinv(1-alpha, n-1), inf];

fprintf('The value of the test statistic z is %.4f\n', STATS.tstat)
fprintf('The rejection region is (%.4f, %.4f)\n', RR)
fprintf('The P-value of the test is %.4f\n', P)

% result of the test, H = 0, if H0 is NOT rejected, H = 1, if H0 IS rejected
if H == 1 
    fprintf('\nThe null hypothesis is rejected.\n') 
    fprintf('The data suggests that the average exceeds 3.\n')
else
    fprintf('\nThe null hypothesis is not rejected.\n')
    fprintf('The data suggests that the average DOES NOT exceed 3.\n')
end
