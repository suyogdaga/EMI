%load data
train = importdata('training.mat');
test = importdata('test.mat');
testnoisy = importdata('testnoisy.mat');
validate = importdata('validate.mat');


%initialize
Y=test;
X=test;
n =size(X,1);
Error = 1000;
filter = 0;
lambda = 0.001;
mat = zeros(3,2);
p=1;
Err=zeros(1000,1);


%prepare as per filter order
for m = 4
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

%calculate

Xt = transpose(Xprev);
R = Xt*Xprev;
Identity = eye(m,'like',R);
for s = 1:length(lambda)
    Rinv = inv(R +(lambda(s)*Identity));
    P = Xt*Y;
    W = Rinv*P;
    y_hat= Xprev*W;
    
%ERROR
        for i =1:n
        Err(i,1)=(Y(i)-y_hat(i));
        end

        
end
plot(0:999,test,0:999,Err)
end



