%% 
Probe_mean = meancenter(Probe);
Gallery_mean = meancenter(Gallery);
%% 
% calculate covariance

C = (Gallery_mean*Gallery_mean')/size(Gallery_mean,2);
[eigen_vectors , eigen_values ] = eig(C);

%% 
% projection variation 10:100
count1 = zeros(1,10);
for k = 10:10:100;
    projection = eigen_vectors(:,2500-k+1:2500);
    gallery_proj = projection'*Gallery_mean;
    prob_proj = projection'*Probe_mean;
 
    D = pdist2(prob_proj',gallery_proj');
    X = zeros(1,200);
    for i = 1:200
        [small,I] = min(D(i,:));
    X(1,i) = I;
    end
    count =0;
    for i = 1:200
        j =ceil(i/2);
        if X(1,i)==j
            count = count+1;
        end
    
    end
count1(1,k/10) =count;
end
 %% 
 % original values 
D1 = pdist2(Probe_mean',Gallery_mean');
X1 = zeros(1,200);
for i = 1:200
    [small,I] = min(D1(i,:));
    X1(1,i) = I;
end
count2 =0;
for i = 1:200
    j = ceil(i/2);
    if X1(1,i)==j
        count2 = count2+1;
    end
end