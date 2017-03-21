%% 
dt = readtable('HW4.txt');

%% 
data = dt{:,{'Species','FrontalLip','RearWidth','Length','Width','Depth','Male','Female'}};

%% 
training_data = data(1:140,:);
training_data1 = data(1:140,2:8);
training_data2 = data(1:140,1);
test_data = data(141:200,:);
test_data1 = data(141:200,2:8);
test_data2 = data(141:200,1);

%%
class_A = training_data(training_data(:,1) == 0,2:8);
class_B = training_data(training_data(:,1) == 1,2:8);

%% 
A = calculateMean(class_A);
B = calculateMean(class_B);

A = A';
B = B';

A_cov = calculate_Covariance(class_A);
B_cov = calculate_Covariance(class_B);

p_A = calculate_Probability(class_A,training_data);
p_B = calculate_Probability(class_B,training_data);
    
    
T = -10;

k = 0.5*(((transpose(A)*pinv(A_cov)*A)-(transpose(B)*pinv(B_cov)*B)+T)); 
co = pinv((A_cov + B_cov)/2)*(B-A);

G_A = zeros(140,1);
for i = 1:size(training_data1)

    G_A(i,:) = training_data1(i,:)*co > k;
    
end

accuracy_training = sum(G_A == training_data2)/size(training_data2,1);

G_B = zeros(60,1);

for i = 1:size(test_data1)

    G_B(i,:) = test_data1(i,:)*co > k;
    
end

accuracy_testing = sum(G_B == test_data2)/size(test_data2,1);


