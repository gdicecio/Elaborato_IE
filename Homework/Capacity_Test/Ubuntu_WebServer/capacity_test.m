clc, close all, clear all;

%% Data
workloads = [100 500 800 1000 2000 3000 4000 5000 6000 7000 8000 9000];
througputs = zeros(1, length(workloads));
resp_times = zeros(1, length(workloads));
k = 1; %Indice di riferimento per i due vettori

%% Elaborazione
for i = workloads
    mean_resp_t = zeros(1,3);
    thr = zeros(1,3);
    for j = 1:3
        path = strcat(num2str(i, '%d'),'\dati',num2str(j,'%d'),'.csv');

        %Data from Jmeter output file (csv format)
        simple_data = readmatrix(path);
        
        %Calculating the number of requests
        [N, M] = size(simple_data);
        num_req = N; %Number of requests

        %Throughput = number_of_requests_completed / time_window_of_the_experiment
        t_wind_mills = simple_data(num_req,1) - simple_data(1,1); %Time window (milliseconds)
        t_wind_sec = t_wind_mills/1000; %Time window (seconds)
        thr(j) = num_req/t_wind_sec; %Throughput

        %Average response time
        elap_times = simple_data(:,2);
        mean_resp_t(j) = mean(elap_times);
    end
    
    througputs(k) = mean(thr);
    resp_times(k) = mean(mean_resp_t);
    
%     check deviazione_std    
%     dev_std_1(k) = std(thr);
%     dev_std_2(k) = std(mean_resp_t);
%     
%     if dev_std_1(k) > 0.5     
%         througputs(k) = median(thr);
%     end
%     
%     if dev_std_2(k) > 0.5
%         resp_times(k) = median(mean_resp_t);
%     end
    k = k+1; 
end
power = througputs./(resp_times/1000);
power_max = max(power);
KNEE_CAPACITY = througputs(find(power == power_max));

%% Plot dei risultati
figure;
scatter(workloads, througputs);
grid;
xlabel("Load [richieste/min]");
ylabel("Througputs [richieste\_soddisfatte/s]");


figure;
scatter(workloads, resp_times);
grid;
xlabel("Load [richieste/min]");
ylabel("Response Time [ms]");


figure;
power = througputs./(resp_times/1000);
scatter(workloads, power);
xlabel("Load [richieste/min]");
ylabel("Power [richieste\_soddisfatte/s^2]");
grid;


power_max = max(power);
KNEE_CAPACITY = througputs(find(power == power_max));
throughput1(1:9) = througputs(1:9);
USABLE_CAPACITY = max(throughput1);