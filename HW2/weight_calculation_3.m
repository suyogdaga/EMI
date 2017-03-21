%load data
train = importdata('training.mat');
test = importdata('test.mat');
testnoisy = importdata('testnoisy.mat');
validate = importdata('validate.mat');

%initialize
Y=test;
X=testnoisy;
n =size(X,1);
Error = 1000;
filter = 0;
lambda = 0.001;


%prepare as per filter order
for m = 30
Xprev =zeros(n,1);
for i = 1:m-1
    k = zeros(n,1);
    Xprev = cat(2,Xprev,k)   ;
end
for j = 1:m
    for i = 1:n-j 
        Xprev(i+j,j) = X(i);
    end
end

%X3=Xprev  %%%calculate X1, X2,X3
%calculate

% Xt = transpose(Xprev);
% R = Xt*Xprev;
% Identity = eye(m,'like',R);
% for s = 1:length(lambda)
%     Rinv = inv(R +(lambda(s)*Identity));
%     P = Xt*Y;
%    % W = Rinv*P;
%    % y_hat= Xprev*W;
%    % W3=W %substitute w1,w2,w3
        
%ERROR

y_hat1 = X1*W1
y_hat2 = X2*W2
y_hat3 = X3*W3
Err1 =0;
Err2 =0;
Err3 =0;
for i=1:1000
Err1=Err1+(Y(i)-y_hat1(i))^2/1000;
Err2=Err2+(Y(i)-y_hat2(i))^2/1000;
Err3=Err3+(Y(i)-y_hat3(i))^2/1000;
end


        
end
%end






