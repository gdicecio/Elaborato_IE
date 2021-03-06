clc, clear all, close all;

limit = 2*150;
interarrivi_mercury = load("tupling_MercuryErrorLog-150/interarrivals.txt");
interarrivi_bgl = load("tupling_BGLErrorLog-150/interarrivals.txt");

%% Mercury
j = 1;
hold on;
for i=1:length(interarrivi_mercury)
    if(interarrivi_mercury(i) <= limit)
        tronc_mercury(j) = i;
        plot(i,j, '-*b');
        j = j+1;
    end
end
grid;
xlabel("# di tuple");
ylabel("Numero di troncamenti");

%% BGL
figure;
j=1;
hold on;
for i=1:length(interarrivi_bgl)
    if(interarrivi_bgl(i) <= limit)
        tronc_bgl(j) = i;
        plot(i,j, '-*b');
        j = j+1;
    end 
end
grid;
xlabel("# di tuple");
ylabel("Numero di troncamenti");


