
fprintf('\npoint a\n\n');

%test for 2 populations
%alpha = input('significance level (0,1) = ');
alpha = 0.05;

%h0: sigma1  = sigma2
%h1: sigma1 =! sigma2 - two-tailed test
X1 = [3.1 2.9 3.8 3.3 2.7 3.0 2.8 2.5 2.6 2.0 3.2 2.4 2.3 3.1 2.1 3.4];

X2 = [6.9 6.4 4.7 4.3 5.1 6.3 5.9 5.4 5.3 5.2 5.1 5.9 5.8 4.9];
%tail values: -1 for left tailed
%           : 0 for both, default
%           : 1 for rigth tailed
tail = 0;
[h, p, ci, stats] = vartest2(X1,X2,alpha,tail);
%p-P value; ci = confidence level

if h == 0
    fprintf('H0 is not rejected, i.e, sigmas are equal\n');
else 
    fprintf('H0 is rejected, population variances differ \n');
end

q1 = finv(alpha/2, stats.df1, stats.df2);
q2 = finv(1-alpha/2, stats.df2, stats.df1);
fprintf('Observed value is %1.4f\n', stats.fstat);
fprintf('P-value is %1.4f\n', p);
fprintf('Rejection region R is (-inf, %3.4f) U (%3.4f, inf)\n', q1, q2);

fprintf('\npoint b\n\n');


%b



%h0: miu1  = miu2
%h1: miu1 > miu2 - rigth-tailed test

[h, p, ci, stats] = ttest2(X1, X2, alpha, -1,'equal');
%vartype - equal (bcs in point a. we got the same values for population variances.
%p-P value; ci = confidence level

fprintf('P-value of the test statistic is %e.\n', p)
fprintf('Observed value of the test statistic is %6.4f.\n', stats.tstat)

q1 = tinv(1-alpha, stats.df);

fprintf('Rejection region F is (%6.4f, +inf)\n', -q1);

if h==1
    fprintf('/nH0 is rejected. Bank Employees dispose of more white paper per year than Other Employees.\n')
else
   fprintf('/nH0 is not rejected. Bank Employees do NOT dispose of more white paper per year than Other Employees.\n')
end

