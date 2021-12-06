clc, close all, clear all;

%% Data
real = xlsread('HighLevel/Real/pc6_700');
synthetic = xlsread('LowLevel/Syntetic/low_level_700_syn');

%% Normal Distribution check
qqplot(real)