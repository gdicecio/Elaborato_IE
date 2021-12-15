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

%% Analysis
a = length(page_type);
b = length(intensity);
r = N;
%Parametri del modello
mu = 0;             %Media totale
alpha = zeros(1, a);%Effetto di PAGE TYPE
beta = zeros(1, b); %Effetto di INTENSITY
gamma = zeros(b, a);%Effetto dell'interazione
e = zeros(b, a, r); %Errore

%Calcoli
mu = 1/(a*b*r) * sum(resp_time,'all');
for j=1:a
    alpha(j) = sum(resp_time(:,j,:), 'all')/(r*b) - mu;
end
for i=1:b
    beta(i) = sum(resp_time(i,:,:), 'all')/(r*a) - mu;
end
for i=1:b
    for j=1:a
     gamma(i,j) = sum(resp_time(i,j,:),'all')/r - mu - alpha(j) - beta(i);
    end
end
for i=1:b
    for j=1:a
        for k=1:r
            e(i,j,k) = resp_time(i,j,k) - sum(resp_time(i,j,:),'all')/r;
        end
    end
end

%% Parametri caratteristici
SSY = sum(resp_time(:,:,:).^2, 'all');
SS0 = a*b*r*mu*mu;
SSA = b*r*sum(alpha.^2);
SSB = a*r*sum(beta.^2);
SSAB = r*sum(gamma.^2, 'all');
SSE = sum(e.^2, 'all');
SST = SSY - SS0;
IMPORTANZA_PAGE_TYPE = SSA/SST;
IMPORTANZA_INTENSITY = SSB/SST;
IMPORTANZA_INTERACTION = SSAB/SST;
IMPORTANZA_ERRORE = SSE/SST;

MSA = SSA/(a-1);
MSB = SSB/(b-1);
MSAB = SSAB/((a-1)*(b-1));
MSE = SSE/(a*b*(r-1));