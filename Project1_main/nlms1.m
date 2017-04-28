function [e,w,k,mse,count]=nlms1(mu,M,u,d,a)
% Normalized LMS
% Call:
% [e,w]=nlms(mu,M,u,d,a);
%
% Input arguments:
% mu = step size, dim 1x1
% M = filter length, dim 1x1
% u = input signal, dim Nx1
% a = constant, dim 1x1
%
% Output arguments:
% e = estimation error, dim Nx1
% w = final filter coefficients, dim Mx1
%intial value 0
w=zeros(M,1);
%input signal length
N=length(u);
k = zeros(M,N-M+1);
count =0 ;

%make sure that u and d are colon vectors
u=u(:);
d=d(:);
%NLMS
for n=M:N
  uvec=u(n:-1:n-M+1);
  e(n)=d(n)-w'*uvec;
  if (0.022<e(n)*e(n)<0.023)
    count ;
  else 
    count = count+1; 
  endif
  w=w+mu/(a+uvec'*uvec)*uvec*e(n);
  k(:,n)=w;
end
k = k';
mse =(e.^2)/N;
e=e';
