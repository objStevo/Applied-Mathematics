

function [ylast] = Euler(t0,y0,tlast,N,a)

f= @(t,y) a*y^2*(1-y);

ts = zeros(N+1,1);       
ylast = zeros(N+1,length(y0));

h = (tlast - t0)/N;
ts(1) = t0;                
ylast(1,:) = y0.';             

for i=1:N
  s = feval(f,t0,y0);       
  y0 = y0 + h*s;
  t0 = t0 + h;
  
  ts(i+1,:) = t0;          
  ylast(i+1,:) = y0.';    


end

