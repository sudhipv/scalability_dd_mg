


setup_solve_HYPRE = [13.2 20.46;29.87 51.16;62.82 101.07;115.36 167.47];

pcs = [142,300,514,784];

sumt = setup_solve_HYPRE(:,1) + setup_solve_HYPRE(:,2);

efficiency = sumt(1) ./ sumt;

ssize = [5.73,12.03,20.63,31.52];


func_scalability_yy(pcs,efficiency,ssize);
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
























