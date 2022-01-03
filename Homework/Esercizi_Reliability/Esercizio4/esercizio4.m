clc; close all; clear all;
t = linspace(0,9000);

MTTF_A = 1000;
MTTF_B = 9000;
MTTF_C = 2000;

lambdaA = 1/MTTF_A;
lambdaB = 1/MTTF_B;
lambdaC = 1/MTTF_C;

R_A = exp(-lambdaA*t);
R_B = exp(-lambdaB*t);
R_C = exp(-lambdaC*t);

%% CONFRONTO 1
R_11 = 1-(1-R_A.*R_B).*(1-R_A.*R_C);
R_12 = R_A.*(1-(1-R_B).*(1-R_C));
figure();
plot(t,R_11);
title('Confronto 1');
hold on;
plot(t,R_12);
xlabel('Mission Time');
ylabel('Reliability');
grid;
%% CONFRONTO 2
R_21 = R_A.*(1-(1-R_A).*(1-R_B));
R_22 = R_A;
figure();
plot(t,R_21);
title('Confronto 2');
hold on;
plot(t,R_22);
xlabel('Mission Time');
ylabel('Reliability');
grid;

%% CONFRONTO 3
R_31 = R_21.*R_B;
R_32 = R_A.*R_B;
figure();
g1 = plot(t,R_31);
title('Confronto 3');
hold on;
g2 = plot(t,R_32);
set(g1,'LineWidth',1.5);
set(g2,'LineWidth',1.5);
xlabel('Mission Time');
ylabel('Reliability');
grid;
%% CONFRONTO 4
R_41 = 1-((1-R_A).*(1-R_A.*R_B));
R_42 = R_A;
figure();
plot(t,R_41);
title('Confronto 4');
hold on;
plot(t,R_42);
xlabel('Mission Time');
ylabel('Reliability');
grid;




