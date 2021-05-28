set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex');  
set(groot, 'defaultLegendInterpreter','latex');
set(0,'defaultaxesfontsize',16,'defaultaxeslinewidth',1.5,...
    'defaultlinelinewidth',1.5,'defaultpatchlinewidth',1.5)
clear

radii=50:5:100; % radii to sample
k=1; % stickiness

radii=cat(2,radii,radii); % sample each radius twice for robustness
% radii=cat(2,radii,radii); % sample 4 times
mass=zeros(size(radii));

for j=1:length(radii)
    [mass(j),A]=dla2D(radii(j),k);
end

logr=log(radii);
logm=log(mass);
re=polyfit(logr,logm,1); % do regression on log data

hold on;
scatter(logr,logm,'filled')
plot(logr, polyval(re,logr))
title(sprintf('$k$=%g, $d\\approx $ %g',k, re(1)));
ylabel('log($N$)')
xlabel('log($r$)')
hold off;