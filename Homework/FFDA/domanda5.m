clc; clear all; close all;
%% Esiste una relazione tra tipologia di errore e Nodo (solo per mercury)

%% Nodi computation
device_list_tgc894 = search("FilterMercury-Node/tg-c894-MercuryErrorLog.txt");
device_list_tgc401 = search("FilterMercury-Node/tg-c401-MercuryErrorLog.txt");
device_list_tgc117 = search("FilterMercury-Node/tg-c117-MercuryErrorLog.txt");
device_list_tgc572 = search("FilterMercury-Node/tg-c572-MercuryErrorLog.txt");

%% Nodi login
device_list_login1 = search("FilterMercury-Node/tg-login1-MercuryErrorLog.txt");
device_list_login2 = search("FilterMercury-Node/tg-login2-MercuryErrorLog.txt");
device_list_login3 = search("FilterMercury-Node/tg-login3-MercuryErrorLog.txt");
device_list_login4 = search("FilterMercury-Node/tg-login4-MercuryErrorLog.txt");

%% Nodo master
device_list_master = search("FilterMercury-Node/tg-master-MercuryErrorLog.txt");

