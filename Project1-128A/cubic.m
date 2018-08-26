function largestRoot = cubic(a,b,c,d)

f= @(x) (((a*x^3 + b)*x^2 + c)*x + d);%%defining our function
df =@(x) ((3*a*x^2 + 2*b)*x + c);%%along with its derivative
%In order to reduce floating point error we reprioritize the arithmetic.
x = 100;%%initial guess
y = f(x);
maxIter = 100;
relativeError = 1e-6;
while norm(y)>relativeError||(maxIter>0)%%stopping criterion includes a desired relative error along with a max iteration stopper.

x = x - f(x)/df(x);%We are employing Newton's method
y = f(x);
maxIter = maxIter-1;
end
largestRoot = x;
end

%
