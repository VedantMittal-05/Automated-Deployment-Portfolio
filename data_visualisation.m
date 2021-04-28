%-------------------------------------------------------------------------%
% THESIS B, GROUP 3
% AUTOMATED DEPLOYEMENT PORTFOLIO
% AURTHOR : VEDANT MITTAL
% ZID : Z5247199
%-------------------------------------------------------------------------%

% load .CSV files into variables
carp_population = csvread('carp_population.csv');
Priority = csvread('Priority.csv');
cost = csvread('cost.csv');
time = csvread('time.csv');
migration_prob = csvread('migration.csv');
tur = csvread('turbidity.csv');
s = size(carp_population);

%==========================================================================
% Plot figures
%==========================================================================

figure(1); clf;
y = [carp_population*100, cost];
yyaxis left;
b = bar(y, 0.3,'grouped');
ylabel('Carp Population & Cost');
b(1).FaceAlpha = 0.2;
b(2).FaceAlpha = 0.8;
b(1).LineStyle = 'none';
b(2).LineStyle = 'none';

yyaxis right
x = bar(time, 0.1);
ylabel('Time (Years)');
hAx=gca;
hAx.YAxis(1).Exponent=0;
hAx.YAxis(1).TickLabelFormat = '%,.0f';
x.FaceAlpha = 0.6;
hold on;
str={'Dataset 1'; 'Dataset 2';'Dataset 3';'Dataset 4';'Dataset 5'};
legend('Carp Population (Kg/100ha)','Cost ($)','Time (Years)');
xlabel('Sample Datasets');
x.LineStyle = 'none';
grid off;
hold on;
title('Estimated Cost and Time')

%==========================================================================

figure(2); clf;
y = [carp_population/400,tur/50,migration_prob*10,Priority];
b = bar(y, 0.3,'grouped');
b(1).FaceColor = [.8 .8 .3];
b(2).FaceColor = [0.5 0.5 0.5];
b(3).FaceColor = [0.5 0.5 0];
b(4).FaceColor = [1 0.2 0.2];
hold on;

ylim([0 10.2])
str={'Dataset 1'; 'Dataset 2';'Dataset 3';'Dataset 4';'Dataset 5'};
hAx=gca;            % get a variable for the current axes handle
legend('Carp Population','Turbidity','Migration Probability','Priority');
ylabel('Parameters (Normalised to a Scale of 0 - 10)'); xlabel('Sample Datasets');
b(1).FaceAlpha = 0.5;
b(2).FaceAlpha = 0.3;
b(3).FaceAlpha = 0.8;
b(4).FaceAlpha = 0.8;
for j = 1:length(b)
    b(j).LineStyle = 'none';
    
end
grid off;
hold on;

%==========================================================================

figure(3); clf;

subplot(2,2,1);
scatter3(carp_population,tur,migration_prob,30, Priority, 'filled');
ylabel('Turbidity (NTU)'); xlabel('Carp Population(Kg/ha)'); zlabel('Migration Probability (x100%)');
h = colorbar('Location', 'EastOutside', 'YTickLabel',...
{'P=0','P = 1', 'P = 2', 'P = 3', 'P = 4', 'P = 5', 'P = 6', 'P = 7','P = 8','P = 9','P = 10'});
ylabel(h, 'Priority')
caxis([0 10])

subplot(2,2,2);
scatter3(carp_population,tur,migration_prob,30, Priority, 'filled');
ylabel('Turbidity (NTU)'); xlabel('Carp Population(Kg/ha)'); zlabel('Migration Probability (x100%)');
view(0,90)
h = colorbar('Location', 'EastOutside', 'YTickLabel',...
{'P=0','P = 1', 'P = 2', 'P = 3', 'P = 4', 'P = 5', 'P = 6', 'P = 7','P = 8','P = 9','P = 10'});
ylabel(h, 'Priority')
caxis([0 10])

subplot(2,2,3);
scatter3(carp_population,tur,migration_prob,30, Priority, 'filled');
ylabel('Turbidity (NTU)'); xlabel('Carp Population(Kg/ha)'); zlabel('Migration Probability (x100%)');
view(90,0)
h = colorbar('Location', 'EastOutside', 'YTickLabel',...
{'P=0','P = 1', 'P = 2', 'P = 3', 'P = 4', 'P = 5', 'P = 6', 'P = 7','P = 8','P = 9','P = 10'});
ylabel(h, 'Priority')
caxis([0 10])

subplot(2,2,4);
scatter3(carp_population,tur,migration_prob,30, Priority, 'filled');
ylabel('Turbidity (NTU)'); xlabel('Carp Population(Kg/ha)'); zlabel('Migration Probability (x100%)');
view(180,0)
h = colorbar('Location', 'EastOutside', 'YTickLabel',...
{'P=0','P = 1', 'P = 2', 'P = 3', 'P = 4', 'P = 5', 'P = 6', 'P = 7','P = 8','P = 9','P = 10'});
ylabel(h, 'Priority')
caxis([0 10])

%==========================================================================
% end of program
%==========================================================================



