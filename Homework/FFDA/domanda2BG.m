clc; clear all; close all;

%% Relazione tra reliability del sistema e reliability dei nodi
%% Blue-Gene Sistema Totale confronto con nodo R71
load tupling_BGLErrorLog-150/interarrivals.txt;
load FilterBG-Node/tupling_R71-M0-N4-BGLErrorLog-200/interarrivals_R71.txt;
[empTTF_M,empRel_M,t_M] = Reliability(interarrivals);
[empTTF_M3,empRel_M3,t_M3] = Reliability(interarrivals_R71);
figure;
g = plot(t_M,empRel_M);
hold on;
g1 = plot(t_M3,empRel_M3);
set(g,'LineWidth',2);
set(g1,'LineWidth',2);
xlabel('time[s]');
ylabel('empRel');
legend('empRelTot','empRel-R71-M0-N4')

%% Blue-Gene Sistema Totale confronto con nodo R12

load FilterBG-Node/tupling_R12-M0-N0-BGLErrorLog-180/interarrivals_R12.txt;
[empTTF_M1,empRel_M1,t_M1] = Reliability(interarrivals_R12);
g = plot(t_M,empRel_M);
hold on;
g1 = plot(t_M1,empRel_M1);
set(g,'LineWidth',2);
set(g1,'LineWidth',2);
xlabel('time[s]');
ylabel('empRel');
legend('empRelTot','empRel-R12-M0-N0')
%% Blue-Gene Sistema Totale confronto con nodo R63
load FilterBG-Node/tupling_R63-M0-N2-BGLErrorLog-150/interarrivals_R63.txt;
[empTTF_M2,empRel_M2,t_M2] = Reliability(interarrivals_R63);
figure;
g = plot(t_M,empRel_M);
hold on;
g1 = plot(t_M2,empRel_M2);
set(g,'LineWidth',2);
set(g1,'LineWidth',2);
xlabel('time[s]');
ylabel('empRel');
legend('empRelTot','empRel-R63-M0-N2')


%% Confronto rel
figure;
g1 = plot(t_M3,empRel_M3);
hold on;
g2 = plot(t_M2,empRel_M2);
hold on;
g3 = plot(t_M1,empRel_M1);
set(g1,'LineWidth',2);
set(g2,'LineWidth',2);
set(g3,'LineWidth',2);
xlabel('time[s]');
ylabel('empRel');
legend('empRel-R71-M0-N4','empRel-R12-M0-N0','empRel-R63-M0-N2');



