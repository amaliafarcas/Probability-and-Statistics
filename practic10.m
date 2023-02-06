% a

X1 = [1021 980 1017 988 1005 998 1014 985 995 1004 1030 1015 995 1023];
X2 = [1070 970 993 1013 1006 1002 1014 997 1002 1010 975];

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
    fprintf('\nThe null hypothesis is rejected.\n') 
else
    fprintf('\nThe null hypothesis is not rejected.\n')
end


%b
[h, p, ci, stats] = ttest2(X1, X2, alpha, 1,'unequal');
%vartype - unequal (bcs in point a. we got different values for population
%variances. If they were equal, we would have used 'equal' parameter.
%p-P value; ci = confidence level

if h==1
    fprintf('/nH0 is rejected. A is more reliable.\n')
else
   fprintf('/nH0 is not rejected.A is NOT more reliable.\n')
end

fprintf('P-value of the test statistic is %e.\n', p)
fprintf('Observed value of the test statistic is %6.4f.\n', stats.tstat)

q1 = tinv(1-alpha, stats.df);

fprintf('Rejection region F is (%6.4f, +inf)\n', q1);
