clc;
clear;


%% Read the data
cluster_coulumn = 7;
data = xlsread('Filtering_&_PCA/Dati_Filtrati');
pca_data = xlsread('Filtering_&_PCA/PCA');
cluster_data = xlsread('Clustering/12_Cluster/12_Cluster');
cluster_data = cluster_data(:,cluster_coulumn);
N_cluster = max (cluster_data); 

%% Calcolo centroidi
centroid_index = zeros(N_cluster,1);
for i = 1: N_cluster
    index = find(cluster_data==i); %Indici delle righe di uno stesso cluster
    n_size = length(index);
    cluster_elements = pca_data(index,:);
    if (size(index) == 1) 
        centroid = index;       %Riga del centroide
        centroid_index(i) = index;
    else
        dist = zeros(n_size, n_size);
       %Matrice delle distanze
       for k = 1: n_size
            for j = 1:n_size
                dist(k,j) = sqrt(sum(cluster_elements(k) - cluster_elements(j)).^2);
            end
       end
       max_list = zeros(n_size, 1);
       for k=1:n_size
            max_list(k) = max(dist(:,k));   %Massimo per ogni colonna
       end
       temp = find(max_list == min(max_list),1);  %L'indice a cui corrisponde il minimo tra le massime distanze
       
       centroid_index(i) = find(pca_data == cluster_elements(temp,:),1);    %L'indice mappato nel dataset
    end
end