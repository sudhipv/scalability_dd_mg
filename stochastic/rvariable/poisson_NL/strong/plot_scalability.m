

setup_solve_HYPRE =  [86.32 171.56;40.39 86.36;26.95 56.41;19.84 44.7;16.68 36.8;];

pcs = [80,160,240,320,400];


figure1 = figure;
axes1 = axes('Parent',figure1);
bar(pcs,setup_solve_HYPRE,'stacked');
% hold on
% plot(pcs,linear_asm,'LineWidth',2);
set(axes1,'FontSize',16,'XTick',[80 160 240 320 400]);
xlabel({'Number of Processes'});
ylabel({'PC Setup + KSP Solve Time (s)'});
legend('PC Setup','KSP Solve');




iter_HYPRE = [8,8,8,8,8];
iter_coarse = [7,7,7,7,7];
iter_picard = [6,6,6,6,6];


figure2 = figure;
axes2 = axes('Parent',figure2);
plot(pcs,iter_HYPRE,'MarkerSize',15,'Marker','v','LineWidth',2)
hold on
plot(pcs,iter_coarse,'MarkerSize',15,'Marker','o','LineWidth',2)
hold on
plot(pcs,iter_picard,'MarkerSize',15,'Marker','o','LineWidth',2)
set(axes2,'FontSize',16,'XTick',[80 160 240 320 400]);
xlabel({'Number of Processes'});
ylabel({'Time (s)'});
ylim([4 10])
xlim([80 400])
legend('Outer Iteration','Coarse Iteration','Picard Iteration');

