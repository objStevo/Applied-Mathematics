

t0=0; tlast=20; y0=0.6;a=1;

f = @(t,y) ln(y)-(1/y)-ln(1-y)-t; 

N=10;
h = (tlast - t0) / N;
t = [t0:h:tlast]';

[yEu] = Euler(t0,y0,tlast,N,a);
[yRK] = RungeKutta(t0,y0,tlast,N,a);

hold on;

fimplicit(f,'b-+');
plot(t,yEu,'g-*');
plot(t,yRK,'r-d');
title('Solutions with N=10');
xlabel('X');
ylabel('Y');
legend('Analytical Solution','Euler','Runge Kutta 4',-1);
grid

figure;
N=100;
h = (tlast - t0) / N;
t = [t0:h:tlast]';


[yEu] = Euler(t0,y0,tlast,N,a);
[yRK] = RungeKutta(t0,y0,tlast,N,a);

hold on;

fimplicit(f,'b-+');
plot(t,yEu,'g-*');
plot(t,yRK,'r-d');
title('Solutions with N=100');
xlabel('X');
ylabel('Y');
legend('Analytical Solution','Euler','Runge Kutta 4',-1);
grid


figure;
N=1000;
h = (tlast - t0) / N;
t = [t0:h:tlast]';


[yEu] = Euler(t0,y0,tlast,N,a);
[yRK] = RungeKutta(t0,y0,tlast,N,a);

hold on;

fimplicit(f,'b-+');
plot(t,yEu,'g-*');
plot(t,yRK,'r-d');
title('Solutions with N=1000');
xlabel('X');
ylabel('Y');
legend('Analytical Solution','Euler','Runge Kutta 4',-1);
grid

figure;
N=10000;
h = (tlast - t0) / N;
t = [t0:h:tlast]';


[yEu] = Euler(t0,y0,tlast,N,a);
[yRK] = RungeKutta(t0,y0,tlast,N,a);

hold on;

fimplicit(f,'b-+');
plot(t,yEu,'g-*');
plot(t,yRK,'r-d');
title('Solutions with N=10000');
xlabel('X');
ylabel('Y');
legend('Analytical Solution','Euler','Runge Kutta 4',-1);
grid




