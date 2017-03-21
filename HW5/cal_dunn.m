clear
load fisheriris
rng(2);
data = meas;
distM=squareform(pdist(data));
a = zeros(1,9);

for t =2:10
    [ids]=kmeans(data,t); 
    a(:,t-1)=dunns(t,distM,ids);
end

[w,i] = max(a);

