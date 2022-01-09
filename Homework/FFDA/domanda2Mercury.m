clc; clear all; close all;

%% Relazione tra reliability del sistema e reliability dei nodi

%% Mercury Sistema Totale confronto con nodo tg-master
load tupling_MercuryErrorLog-150/interarrivals.txt;
load FilterMercury-Node/tupling_tg-master-MercuryErrorLog-150/interarrivals_tgmaster.txt;
[empTTF_M,empRel_M,t_M] = Reliability(interarrivals);
[empTTF_M3,empRel_M3,t_M3] = Reliability(interarrivals_tgmaster);
figure;
g = plot(t_M,empRel_M);
hold on;
g1= plot(t_M3,empRel_M3);
set(g,'LineWidth',2);
set(g1,'LineWidth',2);
xlabel('time[s]');
ylabel('empRel');
legend('empRelTot','empReltgmaster')

%% Mercury Sistema Totale confronto con nodo tg-login3
load FilterMercury-Node/tupling_tg-login3-MercuryErrorLog-150/interarrivals_tglogin3.txt;
[empTTF_M2,empRel_M2,t_M2] = Reliability(interarrivals_tglogin3);
figure;
g = plot(t_M,empRel_M);
hold on;
g1 = plot(t_M2,empRel_M2);
set(g,'LineWidth',2);
set(g1,'LineWidth',2);
xlabel('time[s]');
ylabel('empRel');
legend('empRelTot','empReltglogin3')

%% Mercury Sistema Totale confronto con nodo tg-c401
load FilterMercury-Node/tupling_tg-c401-MercuryErrorLog-150/interarrivals_tgc401.txt;
[empTTF_M1,empRel_M1,t_M1] = Reliability(interarrivals_tgc401);
g = plot(t_M,empRel_M);
hold on;
g1 = plot(t_M1,empRel_M1);
set(g,'LineWidth',2);
set(g1,'LineWidth',2);
xlabel('time[s]');
ylabel('empRel');
legend('empRelTot','empReltgc401')
%% Mercury Sistema Totale confronto con nodo tg-s044
load FilterMercury-Node/tupling_tg-s044-MercuryErrorLog-180/interarrivals_tgs044.txt;
[empTTF_M4,empRel_M4,t_M4] = Reliability(interarrivals_tgs044);
figure;
g = plot(t_M,empRel_M);
hold on;
g1 = plot(t_M4,empRel_M4);
set(g,'LineWidth',2);
set(g1,'LineWidth',2);
xlabel('time[s]');
ylabel('empRel');
legend('empRelTot','empReltgs044')


%% Confronto rel
figure;
g1 = plot(t_M3,empRel_M3);
hold on;
g2 = plot(t_M2,empRel_M2);
hold on;
g3 = plot(t_M1,empRel_M1);
hold on;
g4 = plot(t_M4,empRel_M4);
set(g1,'LineWidth',2);
set(g2,'LineWidth',2);
set(g3,'LineWidth',2);
set(g4,'LineWidth',2);
xlabel('time[s]');
ylabel('empRel');
legend('empReltgmaster','empReltglogin3','empReltgc401','empReltgs044');

