load training.mat
load validate.mat

n = size(training,1);

for m = 2:30
  Y=training(m+1:n);
  R = compute_R(training,m,n); 
  
endfor
