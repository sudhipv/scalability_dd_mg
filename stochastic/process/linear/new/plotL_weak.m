


setup_solve_HYPRE =  [6.57 3.03;13.1 7.31;26.2 14.32;53.05 20.94];

% old [30.01 11.92;33.62 15.82;38.53 21.22;37.47 20.21;37.15 18.85;37.36 20.6];
% 320 
% new 320 : 30.99 13.87
pcs = [142,300,514,784];

sumt = setup_solve_HYPRE(:,1) + setup_solve_HYPRE(:,2);

efficiency = sumt(1) ./ sumt;

ssize = [10.02,21.04,36.07,55.11];


funcL_scalability_yy(pcs,efficiency,ssize);
% figure1 = figure;
% axes1 = axes('Parent',figure1);
% hold on
% plot(pcs,efficiency,'LineWidth',2);
% set(axes1,'FontSize',16,'XTick',[80,160,320,400,640]);
% xlabel({'# of processes'});
% ylabel({'Efficiency'});
% yaxis([0 1])
% legend('PC Setup','KSP Solve');



figure2 = figure;
axes2 = axes('Parent',figure2);
bar(pcs,setup_solve_HYPRE,'stacked');
% hold on
% plot(pcs,linear_asm,'LineWidth',2);
set(axes2,'FontSize',16,'XTick',[142,300,514,784]);
xlabel({'# of processes'});
ylabel({'PC Setup + KSP Solve Time (s)'});
legend('PC Setup','KSP Solve');
























