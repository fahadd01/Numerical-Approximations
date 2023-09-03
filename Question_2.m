clear;
clc;
format long

%Enter N = order of matrix 
N = 4;

xold = zeros(N,1);

A = zeros(N,N);
%Enter A = coefficient matrix
A = [4 1 -1 1; 1 4 -1 1; -1 -1 5 1; 1 -1 1 3]

b = zeros(N,1);
%Enter b = right hand side
b = [-2; -1; 0; 1]

Rp = 1;
TOL = 1e-6;

D = zeros(N,N);
DDM = true;
for i = 1:N
    Dnot = 0;
    D = 0;
        for j = 1:N
            if i~=j
                Dnot = Dnot + abs(A(i,j));
            end
            if i==j
                D = D + abs(A(i,j));
            end
        end
        if Dnot>D
                fprintf('Coefficient matrix(A) is not diagonally dominant');
                DDM = false;
        end
end

if DDM
    
fprintf('Coefficient matrix(A) is diagonally Dominant\n');
D_inv = zeros(N,N);

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
    
D_inv = inv(D);
L;
U; 

k = 0;
    while(Rp > TOL)
       
       xnew = D_inv*(L+U)*xold + D_inv*b;
       Rp = norm((xnew - xold), inf)/norm((xnew), inf) ;
       
       xold = xnew ;
       k = k+1; 
    end
 xold;
 k;
 
fprintf('Solution of the system is:\n\n x1 = %3.3f\n x2 = %3.3f\n x3 = %3.3f\n x4 = %3.3f\n   in %d iterations\n\n', xold, k);
end