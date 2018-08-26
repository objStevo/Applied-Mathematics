n = input('Enter size of matrix: ');
xc = ones(n,1);

x0 = ones (n,1);
for i = 1:n
    x0(i,1) = (-1)^(i);
end

N = zeros(n,n);

for i = 1:(n-1)
    N(i,i+1)=1;
end
%disp(N);

rtol = 0.1e-08;
maxit = 1000;

d = input('Enter d: ');
u = input('Enter u: ');
m = max([d,u,1]);

T = (d*eye(n)+u*N)/m;

% Part 1 n=6, d=9, record results for u=1 and u=12
A = T+transpose(T);
%A = T*transpose(T);

%Part 2 d=0,u=1, try different values of n (small and large) record for 
%values of n=6 and n=20
B= (1/4)*(eye(n)+T+(T*T)+(T*T*T));
%A=B;
%A= B+transpose(B);
%A= transpose(B)*B;

%Part 3 record results for n=6
P = N;
P(n,1)=1;
C = (B+P*B+(P*P)*transpose(B))/3;   
%A=C;
%A=transpose(C)*C;


b = A*xc;
[xf, r, m] = gausei(n, A, b, x0, maxit, rtol);



