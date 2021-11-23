clc;
clear;


%% Read the data
data = xlsread('Filtering/Dati_Filtrati');
pca_data = xlsread('PCA_&_Clustering/5_Comp/PCA_5_Comp');
cluster_data = xlsread('PCA_&_Clustering/5_Comp/Clustering/10_Cluster/Cluster_Vector10');
N_cluster = max (cluster_data); 

%% Calcolo centroidi
centroid_index = zeros(N_cluster,1);
for i = 1: N_cluster
    index = find(cluster_data==i); %Indici delle righe di uno stesso cluster
    n_size = length(index);
    cluster_elements = pca_data(index,:);
    temp = centroid(cluster_elements);
    centroid_index(i) = find(pca_data == cluster_elements(temp,:),1);    %L'indice mappato nel dataset
    
end

%% Function

function [D,n] = distance_matrix(C)
    % C è una matrice che per per ogni riga un punto e per ogni colonna
    % una coordinata su un asse
    % Il numero di colonne identifica la dimensionalità dello spazio
    % Il numero di righe identifica il numero di punti
    dim = size(C);
    n = dim(1);
    D = zeros(n,n);
    for i = 1:n
        for j = 1:n
            D(i,j) = sqrt(sum((C(i,:)-C(j,:)).^2));
        end
    end
end

function index = centroid(C)
    if size(C) == 1
        index = 1;
    else
        [D,n_size] = distance_matrix(C);
        distance_sum = zeros(1,n_size);
        for k=1:n_size
            distance_sum(k) = sum(D(k,:));  %Fisso la riga e sommo le colonne
        end
        index = find(distance_sum == min(distance_sum));
    end
end