




setup_solve_HYPRE =  [51.31 107.21;73.72 152.6;94.34 188.14;124.48 258.27];

pcs = [128,192,256,320];


figure1 = figure;
axes1 = axes('Parent',figure1);
bar(pcs,setup_solve_HYPRE,'stacked');
% hold on
% plot(pcs,linear_asm,'LineWidth',2);
set(axes1,'FontSize',16,'XTick',[128,192,256,320]);
xlabel({'Number of Processes'});
ylabel({'PC Setup + KSP Solve Time (s)'});
legend('PC Setup','KSP Solve');


iter_HYPRE = [8,8,8,9];
iter_coarse = [7,7,8,8];
iter_picard = [6,6,6,6];


figure2 = figure;
axes2 = axes('Parent',figure2);
plot(pcs,iter_HYPRE,'MarkerSize',15,'Marker','v','LineWidth',2)
hold on
plot(pcs,iter_coarse,'MarkerSize',15,'Marker','o','LineWidth',2)
hold on
plot(pcs,iter_picard,'MarkerSize',15,'Marker','square','LineWidth',2)
set(axes2,'FontSize',16,'XTick',[128,192,256,320]);
xlabel({'Number of Processes'});
ylabel({'Time (s)'});
ylim([4 10])
xlim([128 320])
legend('Outer Iteration','Coarse Iteration','Picard Iteration');

