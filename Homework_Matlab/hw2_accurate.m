load training.mat;
load validate.mat;

len_training = length(training)
len_validate = length(validate)
Error = 1000;
lambda = [0,0.01,0.02,0.05,0.09,0.1,0.2,0.3,0.4,0.5];
mat = zeros(29,10)
p= 1

for M = 2:30;
    Y = training(M+1:len_training);
    X = zeros(M,len_training-M);
    for i = 1:len_training-M
      X(:,i) = training(i+M-1:-1:i);
     endfor
    R = X*transpose(X)/(len_training-M);
    for s = 1: length(lambda)
      R = R+(lambda(s)*eye(M));
      P = X*Y/(len_training-M);
      W = inv(R)*P;
      Y_hat = transpose(X)*W;
      E = 0
      for i = 1:length(Y)
        E = E+ (Y(i)-Y_hat(i))^2;
      endfor
        E = E/length(Y);
        mat(p,s)=E
      if (E < Error)
         Error =E;
          disp(Error)
          filter = M;
          L = lambda;
      end
      endfor
      p = p+1
endfor
plot= surf(lambda,2:30,mat);




