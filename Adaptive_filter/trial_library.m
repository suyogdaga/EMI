clear
clc

load project1.mat;

Y=transpose(primary); %noise + signal
X=transpose(reference); %noise

n_d = size(Y,1); % size of desired signal
n_t=size(X,1); %size of noise


m = 10; %filter order

desired=Y(m+1:n_d); %  desired signal m+1 : n
reference=zeros(n_t-m,m); % training signal initialized to zero

for i = 1:n_t-m
   reference(i,:) = X(i+m-1:-1:i);  % training initialized to values
end

w=zeros(m,1); % weights are initialized to order m
mu=0.004; % stepsize intialized
for i=1:n_t-m 
    exp_X = reference(i,:)*w;  % calculation of expected value
    error(i)= desired(i)-exp_X; % error = desired - calculated value
    k = reference(i,:)';
    w = w +(mu*error(i)*k); % updating w
end

subplot(4,1,1);
plot(desired);
title('primary = voice + noise   (input1)');
subplot(4,1,2);
plot(reference);
title('reference  (noisy noise)   (input2)');
subplot(4,1,3);
plot(error);
title('Adaptive output  (hopefully it''s close to "voice")')

sound(error);

    