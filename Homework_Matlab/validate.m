%load data
load training.mat;
load validate.mat;

n =size(training,1);
nv = size(validate,1);
mat = zeros(28,10);
p = 1

for m = 3:30
  Y=training(m+1:n);
  V_Y=validate(m+1:nv);
  X=zeros(m,n-m);
  V_X = zeros(m,nv-m);
  
  for i = 1:n-m
    X(:,i) = training(i+m-1:-1:i);  
  endfor
  for i = 1:nv-m
    V_X(:,i) = validate(i+m-1:-1:i);  
  endfor
  
  X_transpose = transpose(X);
  V_X_transpose = transpose(V_X);
  
  R = 1/(n-m)*(X*X_transpose);
  
  eigenvalues = svd(R);
  
  stepsize_large = 1/max(eigenvalues);
 
  
  for w=1:10
   step = stepsize_large/w;
   W = zeros(m,1);

    for j = 1:size(X_transpose,1)
      y_hat = X_transpose(j,:)*W;
      error = (training(m+j)-y_hat);
      %norm_m = X_transpose(j,:)*X_transpose(j,:)'
      for k= 1:m
        W(k) = W(k) + step*error*X_transpose(j,k)
      endfor
    endfor
   Y_hat_V = V_X_transpose*W;
   Valid_error = 0;
   for i = 1: size(V_X,1)
     Valid_error = Valid_error+((V_Y(m+i)-Y_hat_V(i))^2);
   endfor
   MSE = Valid_error/size(V_X,1);
   mat(m-2,w)= MSE;
  endfor
  
endfor

surf(stepsize_large*((1:10).^-1),3:30,mat)
