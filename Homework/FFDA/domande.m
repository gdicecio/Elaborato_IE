clc, close all, clear all;

%% Prima domanda
%% Blue-Gene Nodes
subplot(2,3,1);
SensitivityTuple('R12-M0-N0-BGLErrorLog.txt','tentative-Cwin.txt') %i valori di cwin li possiamo anche cambiare

subplot(2,3,2);
SensitivityTuple('R63-M0-N2-BGLErrorLog.txt','tentative-Cwin.txt')

subplot(2,3,3);
SensitivityTuple('R71-M0-N4-BGLErrorLog.txt','tentative-Cwin.txt')

%% Mercury Nodes
subplot(2,3,4);
SensitivityTuple('tg-c401-MercuryErrorLog.txt','tentative-Cwin.txt') %i valori di cwin li possiamo anche cambiare

subplot(2,3,5);
SensitivityTuple('tg-login3-MercuryErrorLog.txt','tentative-Cwin.txt')

subplot(2,3,6);
SensitivityTuple('tg-master-MercuryErrorLog.txt','tentative-Cwin.txt')

%% Mercury Categories
figure;
subplot(1,3,1);
SensitivityTuple('DEV-MercuryErrorLog.txt','tentative-Cwin.txt') %i valori di cwin li possiamo anche cambiare

subplot(1,3,2);
SensitivityTuple('MEM-MercuryErrorLog.txt','tentative-Cwin.txt')

subplot(1,3,3);
SensitivityTuple('NET-MercuryErrorLog.txt','tentative-Cwin.txt')




