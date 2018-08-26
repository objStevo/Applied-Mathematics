

function [ylast] = RungeKutta(t0,y0,tlast,N,a)
  f= @(t,y) a*y^2*(1-y);

  h = (tlast - t0) / N;
  t = [t0:h:tlast]';
  y = y0;
  for i = 1:N
    k1 = f(t(i), y(i));
    k2 = f(t(i) + h/2, y(i) + h*k1/2);
    k3 = f(t(i) + h/2, y(i) + h*k2/2);
    k4 = f(t(i + 1), y(i) + h*k3);
    y(i + 1) = y(i) + h*(k1 + 2*k2 + 2*k3 + k4) / 6;
  end
  ylast = y(:);

end

