%load data
load training.mat;
load validate.mat;

%initialize
n =size(training,1);
%Error = 1000;
%filter =0
%lambda = [0.001,0.002,0.005,0.007,0.009,0.1];
%mat = zeros(28,5);
%p=1;


%prepare as per filter order
for m = 2:30

  Y=training(m+1:n);
  X=zeros(m,n-m);
  for i = 1:n-m
    X(:,i) = training(i+m-1:-1:i);  %m * (n-m)
  endfor
  X_transpose = transpose(X);
  R = X*X_transpose/(n-m);
  eigenvalues = eig(R);
  stepsize = 1/(max(eigenvalues)+min(eigenvalues));
%endfor

  W = zeros(m,1); %% M=2

  for j = 1:size(X,1)
    y_hat = X_transpose(j,:)*W;
    error = Y(m+j) - y_hat;
  
  for k= 1:m
    W(k) = W(k) + stepsize*error*X_transpose(j,k);
  endfor
  endfor
endfor
