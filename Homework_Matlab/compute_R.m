function R = compute_R(training,m,n)
    X=zeros(m,n-m);
    for i = 1:n-m
      X(:,i) = training(i+m-1:-1:i);  
    endfor
    X_transpose = transpose(X);
    R = (X*X_transpose)/(n-m);
endfunction