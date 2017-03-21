%load data
train = importdata('training.mat');
test = importdata('test.mat');
testnoisy = importdata('testnoisy.mat');
validate = importdata('validate.mat');


%initialize
Y=validate;
X=validate;
n =size(X,1);
Error = 1000;
filter = 0;
lambda = [0.001,0.002,0.005,0.007,0.009,0.1];
mat = zeros(28,5);
p=1;


%prepare as per filter order
for m = 3:30
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
    E=0;
%ERROR
        for i =1:n
        E = E + (Y(i)-y_hat(i))^2;
        end
        E =E/n;
        mat(p,s)=E;

%max error
    if(E< Error)
        Error = E;
        disp(Error)
        filter = m;
        L = lambda(s);
    end
end
 p = p +1;
end
plot= surf(lambda,3:30,mat);





