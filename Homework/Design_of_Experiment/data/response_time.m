clc, close all, clear all;

%% Read Data
intensity = [1500 4500]; 
page_type = ["S", "SM", "ML", "L"];
N = 5;

resp_time = zeros(length(intensity),length(page_type), N);
factor_intensity = 1;
factor_page = 1;

for i=intensity
    for p=page_type
        for r=1:N
            path = strcat(num2str(i, '%d'),'-',p,'-',num2str(r, '%d'),'.csv');
            data = readtable(path);
            resp_time(factor_intensity,factor_page,r) = mean(table2array(data(:,2)));
        end
        factor_page = factor_page +1;
    end
    factor_intensity = factor_intensity +1;
    factor_page = 1;
end

