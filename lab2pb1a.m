n=input('Number of trials: ')
f1=binopdf(0:n, n, 1/2);
plot(0:n, f1);
A=[0:n;binopdf(0:n, n, 1/2)];

x=0:0.001:n;
f2=binocdf(x, n, 1/2);
plot(x, f2);

plot(0:n, f1, '*')
hold on
plot(x, f2);
axis([-0.1,3.1,-0.1,1.1]);

hold off
