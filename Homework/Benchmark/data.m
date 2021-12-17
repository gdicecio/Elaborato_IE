clc, close all, clear all;

%% Read 
N = [10 100 500 1000 5000 10000 50000 100000 500000 1000000];
sys1 = zeros(1, length(N));
sys2 = zeros(1, length(N));
index = 1;

for i=N
    path1 = strcat('Emma/data',num2str(i, '%d'),'.csv');
    path2 = strcat('Peppe/data',num2str(i, '%d'),'.csv');
    samples = readtable(path1);
    samples = table2array(samples(:,2));
    sys1(index) = mean(samples);
    samples = readtable(path2);
    samples = table2array(samples(:,2));
    sys2(index) = mean(samples);
    index = index +1;
end

%% Grafico
figure;
loglog(N,sys1./1000,'LineWidth', 2);
hold on;
loglog(N,sys2./1000,'LineWidth', 2);
grid;
legend('SYS 1', 'SYS 2');
title('Grafico in scala normale');
xlabel('Dimensione dei dati');
ylabel('Tempo di esecuzione [ms]');

figure;
semilogx(N,sys1,'LineWidth', 2);
hold on;
semilogx(N,sys2,'LineWidth', 2);
grid;
legend('SYS 1', 'SYS 2');
title('Grafico in scala logaritmica');
xlabel('Dimensione dei dati');
ylabel('Tempo di esecuzione [ms]');