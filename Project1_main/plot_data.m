clear
clc
load project1.mat

[error,weight,weight_values,MSE,count] = nlms1(0.1,2,primary,reference,0.01);

x = weight_values(:,1);
y = weight_values(:,2);
z = error.^2;

%[XI YI ZI] = griddata(x,y,z,linspace(0,1),linspace(0,1)');
[X1,Y1] = meshgrid(linspace(min(x),max(x),100), linspace(min(y),max(y),100));

figure(1)
trisurf(delaunay(x,y),x,y,z);
title("Plot of MSE vs weights for two filters");
xlabel("<--- W1 --->");
ylabel("<--- W2 -->");
zlabel("<--- MSE ERROR --->              *10^-6");

figure(2)
contour(X1,Y1,griddata(x,y,z,X1,Y1));
title(" Contour Plot of weights for two filters");
xlabel("<--- W1 --->");
ylabel("<---- W2 --->");

plot(MSE,'r*');
title(" Learning curve for filter order 2 and stepsize 0.1");
xlabel("Iterations");
ylabel("MSE");

