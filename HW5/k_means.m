clear;
load fisheriris
k = 3 ;
rng(4);
data_size = size(meas,1);
ini_centroids = datasample(meas,k,'replace',false);
J = zeros(1,10);

for w = 1:20
    unitary = zeros(data_size,k);
    distance = zeros(data_size,k);
    J_val = 0;
    
    for i = 1:data_size
        for j = 1:k
          distance(i,j) = norm(meas(i,:)-ini_centroids(j,:));
        end
        [M,I] = min(distance(i,:));
        unitary(i,I)=1;
    end

    for i = 1:data_size
        t = sum((unitary(i,:).*distance(i,:)));
        J_val = J_val+t;
    end
    
    count1= 0;count2= 0;count3= 0;
    k1 = zeros(1,4);k2 = zeros(1,4);k3 = zeros(1,4);
    for i = 1:data_size
        [M,I]= max(unitary(i,:));
        if I == 1
            count1 = count1+1;
            k1 = (k1+meas(i,:));
        elseif I == 2
            count2 = count2+1;
            k2 = (k2+meas(i,:));
        else
            count3 = count3+1;
            k3 = (k3+meas(i,:));
        end
    end
    J(1,w)= J_val;
    ini_centroids(1,:)=k1/count1;
    ini_centroids(2,:)=k2/count2;
    ini_centroids(3,:)=k3/count3;
    
end

plot(J);
ylabel('objective function magnitude');
xlabel('iterations');
