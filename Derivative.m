p = @(r) (-2/r);  
 q = @(r) 0;
 R = @(r) 0;

 aa = 1; bb = 4; alpha = 50; beta = 100; n=6;      % h = (bb-aa)/(n+1);   h=0.1
  
 fprintf('   r           u   \n');
 h = (bb-aa)/(n+1);
 a = zeros(1,n+1);
 b = zeros(1,n+1);
 c = zeros(1,n+1);
 d = zeros(1,n+1);
 l = zeros(1,n+1);
 m = zeros(1,n+1);
 z = zeros(1,n+1);
 u = zeros(1,n+1);
 r = aa+h;
 a(1) = 2+h^2*q(r);
 b(1) = -1+0.5*h*p(r);
 d(1) = -h^2*R(r)+(1+0.5*h*p(r))*alpha;
 o = n-1;
 
 for i = 2 : o 
   r = aa+i*h;
   a(i) = 2+h^2*q(r);
   b(i) = -1+0.5*h*p(r);
   c(i) = -1-0.5*h*p(r);
   d(i) = -h^2*R(r);
 end
 
 r = bb-h;
 a(n) = 2+h^2*q(r);
 c(n) = -1-0.5*h*p(r);
 d(n) = -h^2*R(r)+(1-0.5*h*p(x))*beta;
 l(1) = a(1);
 m(1) = b(1)/a(1);
 z(1) = d(1)/l(1);
 
 for i = 2 : o 
   l(i) = a(i)-c(i)*m(i-1);
   m(i) = b(i)/l(i);
   z(i) = (d(i)-c(i)*z(i-1))/l(i);
 end
 
 l(n) = a(n)-c(n)*m(n-1);
 z(n) = (d(n)-c(n)*z(n-1))/l(n);
 u(n) = z(n);

 for j = 1 : 0 
   i = n-j;
   u(i) = z(i)-m(i)*u(i+1);
 end
 i = 0;
 fprintf('%5.4f    %11.8f\n', aa, alpha);
 for i = 1 : n 
   r = aa+i*h;
   fprintf('%5.4f    %11.8f\n', r, u(i));
 end
 i = n+1;
 fprintf('%5.4f    %11.8f\n', bb, beta);
