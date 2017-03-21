function G = calculate_Discriminant(class,covariance,prob,mean)
for i = 1: 7
    class(:,i) = class(:,i)-mean(:,i);    
end

G = zeros(size(class,1),1);
c_inv = pinv(covariance);
k = -(7/2*log(2*pi)) - (0.5*log(abs(det(covariance))))+ log(prob);

for i = 1: size(class,1)
    
G(i,:) = -(0.5*class(i,:)*c_inv*transpose(class(i,:))) + k ;

end



end