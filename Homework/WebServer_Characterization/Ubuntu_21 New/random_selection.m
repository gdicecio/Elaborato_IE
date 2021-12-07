function [new_workload] = random_selection(workload)

N_cluster = max(workload(:,end));
[r,c] = size(workload);

cluster_data = workload(:,end);

new_workload = zeros(N_cluster,c);

for i = 1:N_cluster
     index = find(cluster_data==i); % find the index of cluster i
     if length(index) > 1
          new_workload(i,:) = workload(randsample(index,1),:); %tutte le colonne associate alla riga random
     else
         new_workload(i,:) = workload(index,:);
     end
end
end

