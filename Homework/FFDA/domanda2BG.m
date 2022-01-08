clc; clear all; close all;

%% Relazione tra reliability del sistema e reliability dei nodi

%% Blue-Gene Sistema Totale confronto con nodo R12
load tupling_BGLErrorLog-150/interarrivals.txt;
load FilterBG-Node/tupling_R12-M0-N0-BGLErrorLog-180/interarrivals_R12.txt;
[empTTF_M,empRel_M,t_M] = Reliability(interarrivals);
[empTTF_M1,empRel_M1,t_M1] = Reliability(interarrivals_R12);
subplot(1,2,1);
plot(t_M,empRel_M,'-*b');
xlabel('time[s]');
ylabel('empRel');
subplot(1,2,2);
plot(t_M1,empRel_M1,'-*r');
xlabel('time[s]');
ylabel('empRel_R12');
%% Blue-Gene Sistema Totale confronto con nodo R63
load FilterBG-Node/tupling_R63-M0-N2-BGLErrorLog-150/interarrivals_R63.txt;
[empTTF_M2,empRel_M2,t_M2] = Reliability(interarrivals_R63);
figure;
subplot(1,2,1);
plot(t_M,empRel_M,'-*b');
xlabel('time[s]');
ylabel('empRel');
subplot(1,2,2);
plot(t_M2,empRel_M2,'-*r');
xlabel('time[s]');
ylabel('empRel_R63');

%% Blue-Gene Sistema Totale confronto con nodo R71
load FilterBG-Node/tupling_R71-M0-N4-BGErrorLog-200/interarrivals_R71.txt;
[empTTF_M3,empRel_M3,t_M3] = Reliability(interarrivals_R71);
figure;
subplot(1,2,1);
plot(t_M,empRel_M,'-*b');
xlabel('time[s]');
ylabel('empRel');
subplot(1,2,2);
plot(t_M3,empRel_M3,'-*r');
xlabel('time[s]');
ylabel('empRel_R71');



