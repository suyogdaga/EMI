load training.mat;
load validate.mat;

len_training = length(training)
len_validate = length(validate)
E=1000;

for M = 2:30
    c_filter_error = 0
    Y = training(M+1:len_training);
    X = zeros(M,len_training-M);
    for i = 1:len_training-M
      X(:,i) = training(i+M-1:-1:i);
    endfor
    X = transpose(X);
    R = transpose(X)*X/(len_training-M);
    eigenvalues = eig(R);
    stepsize = 1/(max(eigenvalues)+min(eigenvalues));
    
    W = zeros(M,1)
    
    for j = 1:size(X,1)
      y_hat = X(j,:)*W;
      error = Y(M+j) - y_hat;
      c_filter_error = error + c_filter_error;
      
      for k = 1:M
        W(k) = W(k) + stepsize*error*X(j,k);
      endfor
        %if(c_filter_error < E)
         % E = c_filter_error;
          %bw = W;
          %bst = stepsize;s
        %endif
     endfor   
endfor




