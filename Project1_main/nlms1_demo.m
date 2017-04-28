clear
clc
load project1.mat

[error,weight,weight_values,MSE,count] = nlms1(0.1,14,primary,reference,0.01);

k = reference;
k = sum(k.^2);
er = sum(error.^2);
snr = 10 * log(k/er);

figure(1)

plot(reference);
title("reference signal");
xlabel("signal");
ylabel("amplitude");

figure(2)
plot(primary);
title("primary signal ");
xlabel("signal");
ylabel("amplitude");

figure(3)
plot(error);
title("desired signal");
xlabel("signal");
ylabel("amplitude");

%sound(error,fs);

%performance surface plot
%MS = zeros(39,10);
%for i = 2:40
%  for j = 1:10
%    k=j;
%    j = 0.01*j;
%  [error,weight,weight_values,MSE,count] = nlms1(j,i,primary,reference,0.01);
%    MS(i-1,k)=sum(error.^2)/length(reference);
%  end
%end

%save perf_surf2_40.mat MS

%surf(((1:10).*0.01),2:40,MS)
%title(" Performance surface plot against filter order and stepsize");
%xlabel("Step-size");
%ylabel("Filter-Order");
%zlabel(" MSE");

% optimal plot

%[error,weight,weight_values,MSE] = nlms1(0.1,18,reference,primary,0.01);

%learning curve 3 types

%[error1,weigt,weight_values,MSE1,count1] = nlms1(0.001,18,primary,reference,0.01);
%[error2,weight,weight_values,MSE2,count2] = nlms1(0.01,18,primary,reference,0.01);
%[error3,weight,weight_values,MSE3,count3] = nlms1(0.1,18,primary,reference,0.01);

%title(" Learning curves for different step-sizes for filter order 18");
%plot(MSE1,'r*');
%hold  on
%plot(MSE2,'g*');
%hold  on
%plot(MSE3,'b*');
%legend("step-size 0.001","step-size 0.01","step-size 0.1");
%xlabel(" Iterations ");
%ylabel(" MSE ");












