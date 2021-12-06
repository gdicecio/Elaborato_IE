clc;
clear;
close all;

%% Dati
[data, txt] = xlsread('label-cluster 10');
data_filter = data(:, 3:end); 
txt_filter = txt(:, 3:end)';

%% Ricerca centroidi
[r,c] = size(data_filter);
max_list = zeros(1,r);  % Lista dei massimi
max_index = zeros(1,r); % Lista degli indici dei valori massimi 

%Inizializzo vettore degli indici
for i=1:r
    max_index(i) = -1;
end

for i=1:r
    [temp_v, temp_i] =  max(data_filter(i,:));
    while ismember(temp_i,max_index)
        data_filter(i,temp_i) = -1;
        [temp_v, temp_i] =  max(data_filter(i,:));
    end
    max_list(i) = temp_v;
    max_index(i) = temp_i;
end

%% Stampa risultati
sort(txt_filter(max_index))