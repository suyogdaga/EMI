%load data
load training.mat;
load validate.mat;

%calculate sizes for data , n -> training , nv-> validate
n =size(training,1);
nv = size(validate,1);

% mat created for storing across different stepsize
mat = zeros(28,10);

%iteration starts for 3:30
for m = 3:30
% Y  and V_Y calcualated for training and validate respectively
  Y=training(m+1:n);
  V_Y=validate(m+1:nv);
  
% X and V_ X needs to created for predoction of Y values respectively
  X=zeros(m,n-m);
  V_X = zeros(m,nv-m);
  for i = 1:n-m
    X(:,i) = training(i+m-1:-1:i);  
  endfor
  for i = 1:nv-m
    V_X(:,i) = validate(i+m-1:-1:i);  
  endfor
  
% transpose taken for making 3000*m matrices 
  X_transpose = transpose(X);
  V_X_transpose = transpose(V_X);

% calculation of R for making m*m matrices  
  R = 1/(n-m)*(X*X_transpose);

%  calculation of eigenvalues and stepsizes
  eigenvalues = svd(R);
  stepsize_large = 1/max(eigenvalues);
 
% calculation across a range of stepsizes
  for w=1:10
   step = stepsize_large/w;
   W = zeros(m,1);

    for j = 1:size(X,1)
      y_hat = X_transpose(j,:)*W;
      error = (training(m+j)-y_hat);
      norm_m = X_transpose(j,:)*X_transpose(j,:)';
      for k= 1:m
        W(k) = W(k) + (step*error*X_transpose(j,k))/norm_m;
      endfor
    endfor
   Y_hat_V = V_X_transpose*W;
   Valid_error = 0;
   for i = 1: size(V_X,1)
     Valid_error = Valid_error+((validate(m+i)-Y_hat_V(i))^2);
   endfor
   MSE = Valid_error/size(V_Y,1);
   mat(m-2,w)= MSE;
  endfor
  
endfor

surf(stepsize_large*((1:10).^-1),3:30,mat)
title('Graph of StepSize, Filter Order and Error')
xlabel('stepsize')
ylabel('filter order')
zlabel('Error')