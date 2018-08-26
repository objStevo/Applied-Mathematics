n = input('Enter size of matrix: ');
d = input('Enter d: ');
u = input('Enter u: ');
m = max([d,u,1]);

N = zeros(n,n);

for i = 1:(n-1)
    N(i,i+1)=1;
end

T = (d*eye(n)+u*N)/m;
%Part 1:
%A = T + transpose(T);

%Part 2: 
%B = (1/4)*(eye(n)+T+(T*T)+(T*T*T));
%M(1:n,1:n)=(1/n);
%A = B+inv(B)*transpose(B)*B - M;

%Part 3: 
%A = T - transpose(T);

%Below is my test case, the eigen values of the matrix beloware {1,2,3}
A = [-149,-50,-154;537,180,546;-27,-9,-25];
actualLam=eig(A);

loop=true;
while (loop == true)
    s = input('Enter the shift value: ');
    iter = input('Enter the number of iterations you would like performed:');

    for j=1:iter
         [q,r] = qr(A-s*eye(n));
         A = r*q+s*eye(n);
    end

    %disp(A);
    lam = diag(A);
    r = norm(lam - actualLam);
    fprintf('error = %f',r);
    
    response = input('Would you like to make more iterations? Enter 1 for Yes or 0 for No: ');
    if response==0
        loop = false;
    end
    
end
        
    
    








