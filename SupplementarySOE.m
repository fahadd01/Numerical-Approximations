clear;
clc;
format long

N = 8;
xold = ones(N,1);

A = zeros(N,N);
A = [-1 0 0 sqrt(2)/2 1 0 0 0; 0 -1 0 sqrt(2)/2 0 0 0 0; 0 0 -1 0 0 0 0.5 0; 0 0 0 -sqrt(2)/2 0 -1 -0.5 0; 0 0 0 0 -1 0 0 1; 0 0 0 0 0 1 0 0; 0 0 0 -sqrt(2)/2 0 0 sqrt(3)/2 0; 0 0 0 0 0 0 -sqrt(3)/2 -1]

b = zeros(N,1);
b = [0; 0; 0; 0; 0; 10000; 0; 0]

Rp = 1;
TOL = 1e-3;

D = zeros(N,N);
DWL_inv = zeros(N,N);

W = 1.25;

    for i = 1:N
        D(i,i) = A(i,i);  
       
    end

L = zeros(N,N);

    for i = 1:N
        for j = 1:i
            if(i==j)
                L(i,j) = 0;
            else
                L(i,j) = -A(i,j);
            end
        end
    end

U = zeros(N,N);

    for i = 1:N
        for j = i:N
            if i==j
                U(i,j) = 0;
            else
                U(i,j) = -A(i,j);
            end
        end
    end
    
DWL_inv = inv(D-(W*L));
L;
U; 
    
k = 0;
    while(Rp > TOL)
       
       xnew = DWL_inv*(((1-W)*D)-(W*U))*xold + W*DWL_inv*b;
       Rp = norm((xnew - xold), inf)/norm((xnew), inf) ;
       
       xold = xnew ;
       k = k+1; 
    end
 xold;
 k;
 
fprintf('Solution of the system is :\n\n F1 = %3.3f\n F2 = %3.3f\n F3 = %3.3f\n f1 = %3.3f\n f2 = %3.3f\n f3 = %3.3f\n f4 = %3.3f\n f5 = %3.3f\n  in %d iterations\n\n', xold, k);
