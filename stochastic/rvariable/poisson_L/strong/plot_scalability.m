

setup_solve_HYPRE =  [50.6 42;18.87 15.05;12.51 10.57;8.64 7.91;6.95 6.13;];

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


figure2 = figure;
axes2 = axes('Parent',figure2);
plot(pcs,iter_HYPRE,'MarkerSize',15,'Marker','v','LineWidth',2)
hold on
plot(pcs,iter_coarse,'MarkerSize',15,'Marker','o','LineWidth',2)
% hold on
% plot(pcs,iter_1lhypre,'MarkerSize',15,'Marker','o','LineWidth',2)
set(axes2,'FontSize',16,'XTick',[80 160 240 320 400]);
xlabel({'Number of Processes'});
ylabel({'Time (s)'});
ylim([4 10])
xlim([80 400])
legend('Outer Iteration','Coarse Iteration');

