clc, close all, clear all;

%% Data
real = xlsread('real');
synthetic = xlsread('syntetic');

N = size(real,2); %numero di colonne lo stesso per i due set di dati
real = real(:, 1:N-1); % rimuovo la colonna associata ai cluster
synthetic = synthetic(:, 1:N-1); % lo stesso

%verifica Normal Distribution kstest
[h_ks_real, p_ks_real] = kstest(real);
[h_ks_syn, p_ks_syn] = kstest(synthetic);

%verifica Normal Distribution visual test
figure();
subplot(2,1,1);
qqplot(real);
subplot(2,1,2);
qqplot(synthetic);

%se almeno una delle due distribuzioni non è normale
%applico il test non parametrico
if ((h_ks_real | h_ks_syn) == 1)   
    [p_wilc,h_wilc] = NoParametric(real,synthetic,N);
else
    %distribuzioni normali (risultato di quell if è 0)
    %check sulle varianze
    [h_var, p_var] = vartest2(synthetic, real);
    
    %se le due distribuzioni hanno stessa varianza
    if (h_var == 0)
        %applico il two sample t-test
        [h_ttest, p_ttest] = ttest2(syntetic, real);
    else
    %se le due distribuzioni non hanno stessa varianza
        [h_ttest_novar, p_ttest_novar] = ttest2(syntetic, real, 'Vartype', 'unequal');
    end
    
end