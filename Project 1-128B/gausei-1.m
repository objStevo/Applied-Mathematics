%--------------------------------------------------------------------------------
%This function tries to obtain an approximation to the solution % of Ax=b by means of the Gauss-Seidel algorithm. %Inputs:
% n = size
% A is an n x n matrix
% b is a vector of size n
% x0 is a first guess for the answer, so is a vector of size n
% maxit is the maximum number of iterations that should be done.
% rtol is the the tolerance for the residual, i.e. your iteration
% should stop once the size of the residual is smaller than rtol. %Output:
% x is the approximate solution produced by the algorithm
% r is the residual for the approximate solution x
%---------------------------------------------------------------------------------


function [x, r, k] = gausei(n, A, b, x0, maxit, rtol)

%First we must A in the form A = D + L + U
D = diag (diag(A));
U = tril(A) - D;
L = triu(A) - D;
%---------------------------------------------------------------------------------
%Then we must iniatiate a counter to loop through the array elements
%We must make the tolerance an array so that we can compare the array with a residual array we form by subtracting the 2 seqential iterations of Xf which come in the form of an array.
%---------------------------------------------------------------------------------

cg = (D+L)\b;
Tg = (D+L)\U;


i = 1;
%tol = rtol*ones(n,1);% creates a column array of the tolerance so we may compare with error
Xf(: ,1)= x0;
Yf(:,1)=x0;
%B = transpose(b);
%The residual here is converted to an array to make the proper comparisons
%res = 1000000000%*ones(n,1);%random starting value to compare residual with tolerance
%---------------------------------------------------------------------------------
% The while loop has the requested parameters. We compare the boolean array with a zero array. Once the residual is less than the required difference for every array, this loop will exit. Or if the counter reaches the max iteration.
%---------------------------------------------------------------------------------

    %while ((abs(res)>=tol)~=zeros(n,1)) & i<=maxit
    while i<=maxit    
        %Xf( : ,i+1) = -inv(D+L)*(U)*Xf( : ,i) + inv(D+L)*b;
        %res = Xf( : ,i+1) - Xf( : ,i);
        %res = norm(Xf( : ,i+1) - Xf( : ,i));
        %fprintf('%i res = %f',i,res);
        
        %if (res<rtol)
        %    break;
        %end
        Yf(:,i+1)= cg - Tg*Yf(:,i);
        r = b - A*Yf(:,i);
        if norm(r) < rtol
             break;
        end
       
        i=i+1;

    end
    
k = i-1;
x = Yf(:,end);
r = norm(r);

disp ('Y = ');
disp(x);
disp(r);
fprintf('m = %i',k);

end


