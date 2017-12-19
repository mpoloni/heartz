% Procesa el *.csv del reporte de emoncms y devuelve la lista de equipos
% con sus consumos

clear all
close all

% Constantes
intervalo = 10; % segundos
consumo_calefon = 1500; % W

% Proceso el *.csv
M = csvread('43.csv');

Watts = abs(M(:,2));
% figure
% plot(time, Watts);

D = diff(Watts);
% figure
% plot(D)

otros = zeros(length(Watts),1);
calefon = zeros(length(Watts),1);
calefon_ON = false;

otros(1) = Watts(1);
calefon(1) = 0;
for i = 2:length(Watts)
    
    cambio = D(i-1);
    
    if cambio == 0 %  Si nada cambia
            calefon(i) = calefon(i-1);
            otros(i) = otros (i-1);
            
    elseif cambio > 0 % Si algo prende
        if calefon_ON
            calefon(i) = calefon(i-1);
            otros(i) = otros(i-1) + cambio;
        elseif ( 0.8*consumo_calefon < cambio ) && ( cambio < 1.2*consumo_calefon)
            calefon(i) = cambio;
            calefon_ON = true;
            otros(i) = otros(i-1);
        else
            calefon(i) = calefon(i-1);
            otros(i) = otros(i-1) + cambio;
        end
        
    else % Si algo se apaga
        if calefon_ON && ( 0.8*consumo_calefon < abs(cambio) ) && ( abs(cambio) < 1.2*consumo_calefon)
            calefon(i) = 0;
            calefon_ON = false;
            otros(i) = otros(i-1) + cambio;
        else
            otros(i) = otros(i-1) + cambio;
        end
    end
        
end

kWh_calefon = sum(calefon.*intervalo)/(1000*3600);
kWh_otros = sum(otros.*intervalo)/(1000*3600);
kWh = sum(Watts.*intervalo)/(1000*3600);

