p = @(x) 0;  
 q = @(x) 1/880000;
 r = @(x) ((x^2)/880000)-(x/17600);

 aa = 0; bb = 50; alpha = 0; beta = 0; n=49;      
  
 fprintf('   x           W   \n');
 h = 1;
 a = zeros(1,n+1);
 b = zeros(1,n+1);
 c = zeros(1,n+1);
 d = zeros(1,n+1);
 l = zeros(1,n+1);
 u = zeros(1,n+1);
 z = zeros(1,n+1);
 W = zeros(1,n+1);
 x = aa+h;
 a(1) = 2+h^2*q(x);
 b(1) = -1+0.5*h*p(x);
 d(1) = -h^2*r(x)+(1+0.5*h*p(x))*alpha;
 m = n-1;
 
 for i = 2 : m 
   x = aa+i*h;
   a(i) = 2+h^2*q(x);
   b(i) = -1+0.5*h*p(x);
   c(i) = -1-0.5*h*p(x);
   d(i) = -h^2*r(x);
 end
 
 x = bb-h;
 a(n) = 2+h^2*q(x);
 c(n) = -1-0.5*h*p(x);
 d(n) = -h^2*r(x)+(1-0.5*h*p(x))*beta;
 l(1) = a(1);
 u(1) = b(1)/a(1);
 z(1) = d(1)/l(1);
 
 for i = 2 : m 
   l(i) = a(i)-c(i)*u(i-1);
   u(i) = b(i)/l(i);
   z(i) = (d(i)-c(i)*z(i-1))/l(i);
 end
 
 l(n) = a(n)-c(n)*u(n-1);
 z(n) = (d(n)-c(n)*z(n-1))/l(n);
 W(n) = z(n);

 for j = 1 : m 
   i = n-j;
   W(i) = z(i)-u(i)*w(i+1);
 end
 i = 0;
 fprintf('%5.4f    %11.8f\n', aa, alpha);
 for i = 1 : n 
   x = aa+i*h;
   fprintf('%5.4f    %11.8f\n', x, W(i));
 end
 i = n+1;
 fprintf('%5.4f    %11.8f\n', bb, beta);