function means = calculateMean(A)
n= size(A,2);
means = zeros(1,n);
for i = 1:n
    means(i) = mean(A(:,i));
end
end
