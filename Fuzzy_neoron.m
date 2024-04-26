clc;
clear all;
close all;


fis  = readfis('D_1')

Data = zeros(1000,4);
Data(:,1)=0+(0.7-0).*rand(1000,1) %mf 0-0.7
Data(:,2)=rand(1000,1); %mf 0-1
Data(:,3)=rand(1000,1); %mf 0-1
fuzzy_logic=evalfis(fis,[Data(:,1),Data(:,2),Data(:,3)]); %Output fuzzy logic
Data(:,4) = fuzzy_logic;

split80 = 0.8*size(Data,1); %split
split20 = 0.2*size(Data,1); %split
Train = Data(randperm(split80),:) %Define training
Test = Data(randperm(split20),:); %Define Testing


neuron = readfis('info')
Fuzzy_neural=evalfis(neuron,[Data(:,1),Data(:,2),Data(:,3)]); %Output fuzzy logic

error = Fuzzy_neural - fuzzy_logic
MEAN_Fuzzy_logic= mean(fuzzy_logic)
MEAN_Neural_fuzzy= mean(Fuzzy_neural)
MSE= mean(sqrt(error.^2))
Standar_div = std(error)
RMSE = rmse(Fuzzy_neural,fuzzy_logic)


%%
clc;
clear all;
close all;


fis  = readfis('D_1')
Data = zeros(1000,4);
Data(:,1)=0+(1-0).*rand(1000,1) %mf 0-0.7
Data(:,2)=0+(1.2-0).*rand(1000,1); %mf 0-1
Data(:,3)=0+(1.2-0).*rand(1000,1); %mf 0-1
fuzzy_logic=evalfis(fis,[Data(:,1),Data(:,2),Data(:,3)]); %Output fuzzy logic
Data(:,4) = fuzzy_logic;

split80 = 0.8*size(Data,1); %split
split20 = 0.2*size(Data,1); %split
Train = Data(randperm(split80),:) %Define training
Test = Data(randperm(split20),:); %Define Testing

%%
neuron = readfis('P_8');
Fuzzy_neural=evalfis(neuron,[Data(:,1),Data(:,2),Data(:,3)]); %Output fuzzy logic

error = Fuzzy_neural - fuzzy_logic
MEAN_Fuzzy_logic= mean(fuzzy_logic)
MEAN_Neural_fuzzy= mean(Fuzzy_neural)
MSE= mean(sqrt(error.^2))
Standar_div = std(error)
RMSE = rmse(Fuzzy_neural,fuzzy_logic)
