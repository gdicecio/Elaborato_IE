clc; clear all; close all;
%% Esiste una relazione tra tipologia di errore e Nodo (solo per mercury)

%% Nodi computation
[device_list_tgc894,device_tgc894] = search("FilterMercury-Node/tg-c894-MercuryErrorLog.txt");
[device_list_tgc401, device_tgc401] = search("FilterMercury-Node/tg-c401-MercuryErrorLog.txt");
[device_list_tgc117, device_tgc117] = search("FilterMercury-Node/tg-c117-MercuryErrorLog.txt");
[device_list_tgc572, device_tgc572] = search("FilterMercury-Node/tg-c572-MercuryErrorLog.txt");

figure;
subplot(2,2,1);
istogramma(device_list_tgc894, device_tgc894);
title('tg-c894');
subplot(2,2,2);
istogramma(device_list_tgc401, device_tgc401);
title('tg-c401');
subplot(2,2,3);
istogramma(device_list_tgc117, device_tgc117);
title('tg-c117');
subplot(2,2,4);
istogramma(device_list_tgc572, device_tgc572);
title('tg-c572');
%% Nodi login
[device_list_login1, device_login1] = search("FilterMercury-Node/tg-login1-MercuryErrorLog.txt");
[device_list_login2, device_login2] = search("FilterMercury-Node/tg-login2-MercuryErrorLog.txt");
[device_list_login3, device_login3] = search("FilterMercury-Node/tg-login3-MercuryErrorLog.txt");
[device_list_login4, device_login4] = search("FilterMercury-Node/tg-login4-MercuryErrorLog.txt");

figure;
subplot(2,2,1);
istogramma(device_list_login1, device_login1);
title('tg-login1');
subplot(2,2,2);
istogramma(device_list_login2, device_login2);
title('tg-login2');
subplot(2,2,3);
istogramma(device_list_login3, device_login3);
title('tg-login3');
subplot(2,2,4);
istogramma(device_list_login4, device_login4);
title('tg-login4');
%% Nodo master
device_list_master = search("FilterMercury-Node/tg-master-MercuryErrorLog.txt");

