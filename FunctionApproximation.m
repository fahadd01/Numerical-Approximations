nn = 10;
lgth = 2.0;
he = 0.1;
x = (1:he:lgth);
AC = 0.0001;
U = zeros(nn + 1,1);
U(1) = 2.0; U(nn+1) = 5/2;
c = 1.0;

    while(c>0)
        [U1] = equation(U, nn, he);
        c = 0.0;
        for i = 1:nn+1
            if(abs(U(i) - U1(i))>AC)
                c = c + 1;
                break
            end
        end
        U = U1;
    end

    
        U2(1:nn+1) = U;
        x = (1:he:lgth);
        
        figure  (1)
        plot(x, U2, 'o')
        hold on
fprintf('   x           y   \n');        
for i = 1 : 10 
   x = 1 + i*0.1
   fprintf('%5.4f    %11.8f\n', x, U2(i));
end
 
    
function [U1] = equation(U,nn,he)
    for i = 1:nn-1
        U1(i+1) = ((U(i)+U(i+2))/2) + i*(he/2)((U(i+1) - U(i))^2) - he(he/2)U(i)-i(he/2)*he*he*exp(2*i*he);
    end
    U1(1) = U(1);
    U1(nn+1) = U(nn+1);
    
end
