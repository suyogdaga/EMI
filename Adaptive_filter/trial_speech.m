%load data
load project1.mat

primary = transpose(primary);
reference = transpose(reference);
%calculate sizes for data , n -> training , nv-> validate
n =size(primary,1);
nv = size(reference,1);

% mat created for storing across different stepsize
mat = zeros(1,10);

%iteration starts for 3:30
  m = 50
% Y  and V_Y calcualated for training and validate respectively
  Y=primary(m+1:n);
  V_Y=reference(m+1:nv);
  
% X and V_ X needs to created for prediction of Y values respectively
  X=zeros(n-m,m);
  V_X = zeros(nv-m,m);
  for i = 1:n-m
    X(i,:) = primary(i+m-1:-1:i);  
  endfor
  for i = 1:nv-m
   V_X(i,:) = reference(i+m-1:-1:i);  
  endfor
  
% transpose taken for making 3000*m matrices 
  X_transpose = transpose(X);
  V_X_transpose = transpose(V_X);

% calculation of R for making m*m matrices  
  R = 1/(n-m)*(X_transpose*X);

%  calculation of eigenvalues and stepsizes
  eigenvalues = svd(R);
  stepsize_large = 2/max(eigenvalues);
 
% calculation across a range of stepsizes
  w=1
  step = stepsize_large;
  W = zeros(m,1);

    for j = 1:size(X,1)
      y_hat = X(j,:)*W;
      error = (primary(m+j)-y_hat);
      norm_m = X(j,:)*X(j,:)';
      for k= 1:m
        W(k) = W(k) + (step*error*X(j,k))/norm_m;
      endfor
    endfor
   Y_hat_V = V_X*W;
   Valid_error = 0;
   for i = 1: size(V_X,1)
     Valid_error = Valid_error+((reference(m+i)-Y_hat_V(i))^2);
     valid(i) = primary(m+i)- Y_hat_V(i);
   endfor
   MSE = Valid_error/size(V_Y,1);
   mat(m-2,w)= MSE;
  endfor
  
subplot(4,1,1)
plot(primary);
title('primary signal - voice+noise');
subplot(4,1,2)
plot(reference)
title('Reference signal')
subplot(4,1,3)
plot(m+1:n,valid)
title('Voice')

%sound(primary);
%sound(reference);
sound(valid);

