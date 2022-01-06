clc; clear all; close all;
%% Mercury
SensitivityTuple('MercuryErrorLog.txt','tentative-Cwin.txt') %i valori di cwin li possiamo anche cambiare
%% Blue-Gene
SensitivityTuple('BGLErrorLog.txt','tentative-Cwin.txt')