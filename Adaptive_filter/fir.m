% LMS identification of FIR filter
% R. Nowak   11/20/00 (original)
% Jasper Yen 12/15/00 (edited)

clear
close all

N = 50;
x = randn(N,1);
t = [1:N];
order = 10;
h = order*rand(order,1);

y = filter(h,1,x)+.5*randn(size(x));

plot(y)

mu = .1;
L = order-1;
w(L,:) = zeros(1,order);
for i=order:N

        z = x(i-L:i);
        w(i,:) = w(i-1,:)-mu*(w(i-1,:)*z-y(i))*z';

end

%plot(t,w(:,3),'red',t,w(:,2),'blue',t,w(:,1),'green')
plot(t,w(:,10),t,w(:,9),t,w(:,8),t,w(:,7),t,w(:,6),t,w(:,5),t,w(:,4),t,w(:,3),t,w(:,2),t,w(:,1))
legend('b1','b2','b3','b4','b5','b6','b7','b8','b9','b10')
xlabel('time')
ylabel('values of B coefficients')
title('Adapting B coefficients vs. time')
h
