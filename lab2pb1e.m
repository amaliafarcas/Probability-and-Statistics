n=3;
p=0.5;

x=1-0.01;
c1=binocdf(x, n, p);
fprintf(' %f ', 1-c1);

x=1;
c2=binocdf(x, n, p);
fprintf('%f ', 1-c2);

