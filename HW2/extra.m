train = importdata('training.mat')
test = importdata('test.mat')
testnoisy = importdata('testnoisy.mat')
validate = importdata('validate.mat')

Y= train
X = train
Xd = zeros(3000,1)
Xd2= zeros(3000,1)
Xd3 = zeros(3000,1)

for i = 1:2999 %calculation of xn-1
    Xd(i+1) = X(i);
end
for i = 1:2998 %calculation of xn-2
    Xd2(i+2) = X(i);
end
for i = 1:2997 %calculation of xn-2
    Xd3(i+3) = X(i);
end
Xprev = cat(2,Xd3,Xd2)
Xprev= cat(2,Xprev,Xd)
Xt = transpose(Xprev)
K = Xt*Xprev
I = eye(3,'like',K)
prompt = 'What is the  value for regularization? '
x = input(prompt)

Rinv = inv(K +(x*I));
P = Xt*Y
W = Rinv*P

y_hat= Xprev*W
Error = ((Y-y_hat))
total_error = immse(Y,y_hat)

%plotting
figure
subplot(2,2,1)
plot(Y)
title('Original Signal')
subplot(2,2,2)
plot(y_hat)
title('Approximated signal')
subplot(2,2,3)
plot(Error)
title('Error')
