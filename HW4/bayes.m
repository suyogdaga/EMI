%% 
dt = readtable('HW4.txt');

%% 
data = dt{:,{'Species','FrontalLip','RearWidth','Length','Width','Depth','Male','Female'}};

%% 
training_data = data(1:140,:);
training_data1 = data(1:140,2:8);
test_data = data(141:200,:);
test_data1 = data(141:200,2:8);

%%
class_A = training_data(training_data(:,1) == 0,2:8);
class_B = training_data(training_data(:,1) == 1,2:8);

%% 
A = calculateMean(class_A);
B = calculateMean(class_B);

A_cov = calculate_Covariance(class_A);
B_cov = calculate_Covariance(class_B);

p_A = calculate_Probability(class_A,training_data);
p_B = calculate_Probability(class_B,training_data);

g_A = calculate_Discriminant(training_data1,A_cov,p_A,A);
g_B = calculate_Discriminant(training_data1,B_cov,p_B,B);


g_C = calculate_Discriminant(test_data1,A_cov,p_A,A);
g_D = calculate_Discriminant(test_data1,A_cov,p_A,B);

comp = g_A <g_B ;

comp_1 = g_C < g_D ;
accuracy_training = sum(training_data(:,1) == comp )/size(training_data,1);
accuracy_testing = sum(test_data(:,1) == comp_1 )/size(test_data,1);


