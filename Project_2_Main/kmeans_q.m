%% 
 
Total_data = cat(2, Gallery,Probe);
Total_data_mean = meancenter(Total_data);
%% 

C = (Total_data_mean*Total_data_mean')/size(Total_data_mean,2);
[eigen_vectors , eigen_values ] = eig(C);
%% 
k = 10;
Projection = eigen_vectors(:,2500-k+1:2500);
Total_data_proj = Projection'*Total_data_mean;
[Indices,Centroid] = kmeans(Total_data_proj',2);

%import datavalues from excel
W = zeros(200,2);

for i = 1:199
    j =ceil(i/2);
    W(i,:)=datavalues(j,:);
    W(i+1,:)=datavalues(j,:);   
end

males_female=cat(1,datavalues,W);

%calculating accuracy
count = 0;
for i = 1:100
    if(males_female(i,2)==Indices(i)&& males_female(i+100,2)==Indices(i) && males_female(i+101,2)==Indices(i))
        count = count+1;
    end
end
        
        
        