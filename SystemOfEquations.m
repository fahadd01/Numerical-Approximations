clear;
clc;
format long

%Enter N = order of matrix 
%N = n;

xold = zeros(N,1);

A = zeros(N,N);
%Enter A = coefficient matrix
%A = [a]

b = zeros(N,1);
%Enter b = right hand side
%b = [b]

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
                fprintf('Coefficient matrix(A)is not diagonally dominant');
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
       
       xnew = D_inv*U*xold + D_inv*b;
       Rp = norm((xnew - xold), inf)/norm((xnew), inf) ;
       
       xold = xnew ;
       k = k+1; 
    end
 xold;
 k;
 
 xExact=A\b
end
