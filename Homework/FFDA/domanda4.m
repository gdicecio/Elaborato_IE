clc; clear all; close all;

%% Due nodi funzionalmente simili esprimono gli stessi parametri di Reliability?

%% Mercury
load FilterMercury-Node/tupling_tg-c401-MercuryErrorLog-150/interarrivals_tgc401.txt;
load FilterMercury-Node/tupling_tg-c238-MercuryErrorLog-150/interarrivals_tgc238.txt;
load FilterMercury-Node/tupling_tg-c242-MercuryErrorLog-200/interarrivals_tgc242.txt;
[empTTF_M,empRel_M,t_M] = Reliability(interarrivals_tgc401);
[empTTF_M1,empRel_M1,t_M1] = Reliability(interarrivals_tgc238);
[empTTF_M2,empRel_M2,t_M2] = Reliability(interarrivals_tgc242);
figure;
g = plot(t_M,empRel_M);
hold on;
g1 = plot(t_M1,empRel_M1);
hold on;
g2 = plot(t_M2,empRel_M2);
set(g,'LineWidth',2);
set(g1,'LineWidth',2);
set(g2,'LineWidth',2);
xlabel('time[s]');
ylabel('empRel');
legend('empRel-tg-c401','empRel-tg-c238','empRel-tg-c242');

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