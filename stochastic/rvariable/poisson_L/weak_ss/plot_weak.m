




setup_solve_HYPRE =  [19 15.79;26.01 20.85;33.94 26.44;43.55 49.27];

pcs = [160,240,320,400];


figure1 = figure;
axes1 = axes('Parent',figure1);
bar(pcs,setup_solve_HYPRE,'stacked');
% hold on
% plot(pcs,linear_asm,'LineWidth',2);
set(axes1,'FontSize',16,'XTick',[160 240 320 400]);
xlabel({'Number of Processes'});
ylabel({'PC Setup + KSP Solve Time (s)'});
legend('PC Setup','KSP Solve');




iter_HYPRE = [8,8,8,9];
iter_coarse = [7,7,7,7];


figure2 = figure;
axes2 = axes('Parent',figure2);
plot(pcs,iter_HYPRE,'MarkerSize',15,'Marker','v','LineWidth',2)
hold on
plot(pcs,iter_coarse,'MarkerSize',15,'Marker','o','LineWidth',2)
% hold on
% plot(pcs,iter_1lhypre,'MarkerSize',15,'Marker','o','LineWidth',2)
set(axes2,'FontSize',16,'XTick',[160 240 320 400]);
xlabel({'Number of Processes'});
ylabel({'Time (s)'});
ylim([4 10])
xlim([80 400])
legend('Outer Iteration','Coarse Iteration');

