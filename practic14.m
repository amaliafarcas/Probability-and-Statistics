% a

X1 = [4.6 0.7 4.2 1.9 4.8 6.1 4.7 5.5 5.4];
X2 = [2.5 1.3 2.0 1.8 2.7 3.2 3.0 3.5 3.4];

n1 = length(X1);
n2 = length(X2);

alpha = input('alpha= ');

[H, P, CI, STATS] = vartest2(X1, X2, alpha);

f1 = finv(alpha/2, n1-1, n2-1);
f2 = finv(1-alpha/2, n1-1, n2-1);

fprintf('The rejection region for F is (%6.4f, %6.4f) U (%6.4f, %6.4f)\n', -inf, f1, f2, inf)
fprintf('The value of the test statistic F is %6.4f\n', STATS.fstat)
fprintf('The P-value for the variances test is %6.4f\n', P)

if H == 1 
    fprintf('The null hypothesis is rejected.\n') 
else
    fprintf('The null hypothesis is not rejected.\n')
end


%b


%h0: miu1  = miu2
%h1: miu1 > miu2 - rigth-tailed test

[h, p, ci, stats] = ttest2(X1, X2, alpha, 1,'unequal');
%vartype - unequal (bcs in point a. we got different values for population
%variances. If they were equal, we would have used 'equal' parameter.
%p-P value; ci = confidence level

if h==1
    fprintf('/nH0 is rejected. Steel pipes DO lose more heat than glass pipes.\n')
else
   fprintf('/nH0 is not rejected. Steel pipes do NOT lose more heat than glass.\n')
end

fprintf('P-value of the test statistic is %e.\n', p)
fprintf('Observed value of the test statistic is %6.4f.\n', stats.tstat)

q1 = tinv(1-alpha, stats.df);

fprintf('Rejection region F is (%6.4f, +inf)\n', q1);