function [limit] = imaginaryUnits(xO,yO)
%I will once again implement Newton's method for this bivariate problem. 
%P_k+1 = P_k - J(P_k)^-1*F(P_k) where J is the jacobian.


%if yO = 0, that is the imaginary element is equal to 0, then the limit diverges. 
%Hence, instead of iterating to the maxIteration stop of every divergent sequences, I preemtively 
%verify the sequence will not diverge. 
if yO==0
    limit = NaN;
else
    
   %Once I have 'complexified' the function, we can represent it as F:
   %R^2->R^2
   %I also manually define the Jacobian for the given function.
    F = @(x) [x(1)^2-x(2)^2+1;2*x(1)*x(2)];
    J = @(x) [2*x(1),-2*x(2);2*x(2),2*x(1)];

    %initial values:
    X = [xO;yO];
    Y = F(X);
    maxIter = 0;

    %Stop criterion...
    %Here I employ an arbitrary stopping criterion that stops at a desired
    %relative error. However, by theorem 3 of pg 115, X and X_0 satisfy the
    %premise including ||J(X_0)^-1*F(X_0)||<=b, and hence ||X-X_0||<= 2b that is they lie on the 2b-sphere and 
    %the iterates converge to some alpha. In this case the sequence
    %converges to i or -i unless the imaginary component of xO is zero, in
    %which case it diverges. With this in mind, I know for what values the
    %limit will converge, hence we can keep iterating until the difference
    %between two points is below the maximum distance that the values will converge.  
    while norm(Y)>1e-6 || (maxIter<100)
        %Here I take the inverse of the Jacobian as required, I do by using
        %the builtin mathlab inverse function. 
        
        %Newton method algorithm
     X = X - inv(J(X))*F(X);
     Y = F(X);
     maxIter = maxIter+1;
     
    end
%Lastly, I worked with real numbers in R^2, hence I add some code to return
%the anwser in complex form. 
    I = [0;1];
    tf = isequal(X,I);

    negI = [0;-1];
    negtf = isequal(X,negI);


    if (tf)
        limit = 1i;
    elseif (negtf)
       limit = -1i;
    else 
      limit = NaN;
    end
    
end
end


