n=3;
p=0.5;

x=0;
c1=binopdf(x, n, p);
fprintf("%f ", c1);

x=1;
c2=binopdf(x, n, p);
fprintf(" %f ", 1-c2)