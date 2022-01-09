clc; clear all; close all;

%% Relazione tra reliability del sistema e reliability dei nodi

%% Mercury Sistema Totale confronto con nodo tg-c401
load tupling_MercuryErrorLog-150/interarrivals.txt;
load FilterMercury-Node/tupling_tg-c401-MercuryErrorLog-150/interarrivals_tgc401.txt;
[empTTF_M,empRel_M,t_M] = Reliability(interarrivals);
[empTTF_M1,empRel_M1,t_M1] = Reliability(interarrivals_tgc401);
subplot(1,2,1);
plot(t_M,empRel_M,'-*b');
xlabel('time[s]');
ylabel('empRel');
subplot(1,2,2);
plot(t_M1,empRel_M1,'-*r');
xlabel('time[s]');
ylabel('empRel_tg-c401');
%% Mercury Sistema Totale confronto con nodo tg-login3
load FilterMercury-Node/tupling_tg-login3-MercuryErrorLog-150/interarrivals_tglogin3.txt;
[empTTF_M2,empRel_M2,t_M2] = Reliability(interarrivals_tglogin3);
figure;
subplot(1,2,1);
plot(t_M,empRel_M,'-*b');
xlabel('time[s]');
ylabel('empRel');
subplot(1,2,2);
plot(t_M2,empRel_M2,'-*r');
xlabel('time[s]');
ylabel('empRel_tg-login3');

%% Mercury Sistema Totale confronto con nodo tg-master
load FilterMercury-Node/tupling_tg-master-MercuryErrorLog-150/interarrivals_tgmaster.txt;
[empTTF_M3,empRel_M3,t_M3] = Reliability(interarrivals_tgmaster);
figure;
subplot(1,2,1);
plot(t_M,empRel_M,'-*b');
xlabel('time[s]');
ylabel('empRel');
subplot(1,2,2);
plot(t_M3,empRel_M3,'-*r');
xlabel('time[s]');
ylabel('empRel_tg-master');

%% Mercury Sistema Totale confronto con nodo tg-s044
load FilterMercury-Node/tupling_tg-s044-MercuryErrorLog-180/interarrivals_tgs044.txt;
[empTTF_M4,empRel_M4,t_M4] = Reliability(interarrivals_tgs044);
figure;
subplot(1,2,1);
plot(t_M,empRel_M,'-*b');
xlabel('time[s]');
ylabel('empRel');
subplot(1,2,2);
plot(t_M4,empRel_M4,'-*r');
xlabel('time[s]');
ylabel('empRel_tg-s042');



