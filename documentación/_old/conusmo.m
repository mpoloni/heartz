clear all
close all

M = csvread('Consumo Jul-Ago-2016.csv');
[f,c] = size(M);
Watts = zeros(f,1);

for i = 1:f
    if M(i,2) < 10
        Watts(i) = M(i,2)*1000 + M(i,3);
    else
        Watts(i)=M(i,2);
    end
        
end

int_seg = M(2,1) - M(1,1);
tempo_seg = M(f,1) - M(1,1);

max_W = max(Watts);
min_W = min(Watts);

kWh = sum(Watts.*int_seg)/(1000*3600);

D = diff(Watts);

% Consumo Equipos

Heladera_W = 250;
AA_W = 2000;
Calefon_W = 1500;