% a

X1 = [46 37 39 48 47 44 35 31 44 37];
X2 = [35 33 31 35 34 30 27 32 31 31];

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
conflevel = input ('alpha=');
alpha= 1- conflevel;

m1 = mean(X1);
m2 = mean(X2);
m = m1 - m2;
v1 = var(X1);
v2 = var(X2);

% a) sigma1 == sigma2
sp = sqrt(((n1-1)*v1 + (n2-1)*v2)/(n1+n2-2));
t1 = tinv(1 - alpha/2, n1+n2-2);
t2 = tinv(alpha/2, n1+n2-2);
ci1 = m - t1 * sp * sqrt(1/n1+1/n2);
ci2 = m + t2 * sp * sqrt(1/n1+1/n2);
fprintf('The Confidence Level for the difference of means (sigma1 == sigma2): (%3.4f, %3.4f)\n', ci1, ci2);

% b) sigma1 != sigma2

c = (v1/n1) / (v1/n1+ v2/n2);
n = 1/(c^2/(n1-1) + (1-c)^2/(n2-1));
t1 = tinv(1- alpha/2, n);
t2 = tinv(alpha/2, n); % t2 = -t1
ci1 = m - t1 * sqrt(v1/n1+ v2/n2);
ci2 = m - t2 * sqrt(v1/n1+ v2/n2);
fprintf('C.I. for the difference of means (sigma1 != sigma2): (%3.4f, %3.4f)\n', ci1, ci2);
