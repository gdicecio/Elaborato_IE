clc; clear all; close all;

%% Blue-Gene Nodes
subplot(3,3,1);
SensitivityTuple('R12-M0-N0-BGLErrorLog.txt','tentative-Cwin.txt') %i valori di cwin li possiamo anche cambiare

subplot(3,3,2);
SensitivityTuple('R63-M0-N2-BGLErrorLog.txt','tentative-Cwin.txt')

subplot(3,3,3);
SensitivityTuple('R71-M0-N4-BGLErrorLog.txt','tentative-Cwin.txt')

