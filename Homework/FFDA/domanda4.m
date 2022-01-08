clc; clear all; close all;

%% Due nodi funzionalmente simili esprimono gli stessi parametri di Reliability?

%% Mercury
load FilterMercury-Node/tupling_tg-c401-MercuryErrorLog-150/interarrivals_tgc401.txt;
load FilterMercury-Node/tupling_tg-c894-MercuryErrorLog-200/interarrivals_tgc894.txt;
[empTTF_M,empRel_M,t_M] = Reliability(interarrivals_tgc401);
[empTTF_M1,empRel_M1,t_M1] = Reliability(interarrivals_tgc894);
subplot(1,2,1);
plot(t_M,empRel_M,'-*b');
xlabel('time[s]');
ylabel('empRel_tg-401');
subplot(1,2,2);
plot(t_M1,empRel_M1,'-*r');
xlabel('time[s]');
ylabel('empRel_tg-c894');

%% Blue-Gene
load FilterBG-Node/tupling_R63-M0-N0-BGLErrorLog-200/interarrivals_R63_N0.txt;
load FilterBG-Node/tupling_R63-M0-N2-BGLErrorLog-150/interarrivals_R63.txt;
[empTTF_B,empRel_B,t_B] = Reliability(interarrivals_R63_N0);
[empTTF_B1,empRel_B1,t_B1] = Reliability(interarrivals_R63);
figure;
subplot(1,2,1);
plot(t_B,empRel_B,'-*b');
xlabel('time[s]');
ylabel('empRel_R63M0N0');
subplot(1,2,2);
plot(t_B1,empRel_B1,'-*r');
xlabel('time[s]');
ylabel('empRel_R63M0N2');