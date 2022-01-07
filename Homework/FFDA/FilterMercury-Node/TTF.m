clc; clear all; close all;

load interarrivals.txt;         %verrà creato con la generazione delle tuple

[y,t] = cdfcalc(interarrivals); %ne calcolo la CDF = unreliability
empTTF = y(2:size(y,1));        %scarto la prima riga (?)

empRel = 1 - empTTF;            %Reliability

plot(t,empTTF,'-*b');
hold on;
plot(t,empRel,'-+r');
xlabel('time[s]');
ylabel('p');
legend('empTTF','empRel');