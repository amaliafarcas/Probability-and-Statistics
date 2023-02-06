n=3;
p=0.5;

x=2;
c1=binocdf(x, n, p);
fprintf('%f ', c1);

x=2-0.01;
c2=binocdf(x, n, p);
fprintf(' %f ', c2);