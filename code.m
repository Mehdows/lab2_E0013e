function LCRplot;
% -------------------------------------------------------------------------
% Beräknar amplitudförstärkningen för en RLC-krets liknande den i 
% lab 2. 
% OBS! Du behöver modifiera scriptet så att det beräknar amplitud och fas 
% just din krets.
% -------------------------------------------------------------------------

%--- Rensa allt ----
clear all;
close all;

%--- Definiera värden ---
r=100;        % resistans
c=0.047e-06;    % kondensator
L=1e-03;      % spole

%--- Skapa en vektor för vinkelfrekvensen omega (rad/s) ---
w=linspace(100,1e7,10000);

%--- Beräkna ampitud och fas ---

belopp=abs((1i*w*r*c)./(1-(w.^2*L*c)+1i*c*r*w));
fas=atan((1-(w.^2*c*L))./(w*c*r));

%--- Plotta alltihop ---

figure                        % gör en ny figur
subplot(2,1,1)
semilogx(w,belopp);           % plotta med logaritmisk x-axel och linjär y-axel 
axis([100 1e+07 0 1.2])       % skala axlarna till lämpliga värden
xlabel('Frekvens [Rad/sek]'); % namnge x-axeln
ylabel('|{\bf H}(\omega)|')         % namnge y-axeln
hold on
subplot(2,1,2)
semilogx(w,fas);              % plotta med logaritmisk x-axel och linjär y-axel, byt "belopp" mot "fas" om du vill plotta fas. 
axis([100 1e+07 -2 2])        % skala axlarna till lämpliga värden
xlabel('Frekvens [Rad/sek]'); % namnge x-axeln
ylabel('\wp [Rad]')
yline(0,'k');

% --- Här kan du fylla på med mätvärden i samma plot  ---
% --- ta bort %-tecknen längst till vänster om du vill ---
% --- använda kommandona nedan                         ---
%
 x=[1 8 10 17 21 22 23 24 25 32 40 100]*2000*pi;    % fyll på här med mätvärden i x-led, dvs. frekvens i
% rad/sek (obs!)
%
 ExpH =[0.063/1.5 0.386/1.45 0.485/1.42 0.82/1.2 0.9/1.1 0.9/1.1 0.9/1.1 0.9/1.12 0.85/1.11 0.78/1.24 0.62/1.35 0.25/1.5]; % fyll på här med mätvärden i y-led för spänningskvot 
%
 ExpF = [230 25.5*8 17.4*10 5.4*17 1.4*21 0.4*22 0 -1*24 -1.4*25 -3.4*32 -3.8*40 -2.15*100]*2e-3*pi; % fyll på här med mätvärden i y-led för fasskillnad (i radianer))
 
 %
 hold on                 % Säger till att plotten som skapats ovan skall det ritas mer i.
% 
 subplot(2,1,1)
 semilogx(x,ExpH,'-.or'); % Här plottas dina mätvärden upp i samma plot som ovan.
 subplot(2,1,2)           % Tillägget '-.or' säger att linjen skall vara punktstreckad (-.), 
 semilogx(x,ExpF,'-.or'); % ha runda markörer (o) för varje värde och att allt skall vara rött (r).
%
 end
