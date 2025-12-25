


setup_solve_HYPRE =  [28.66 65.65;30.34 97.47;38.79 170.24;38.14 199.72;hacbabh;bhjbacba];

% old [30.01 11.92;33.62 15.82;38.53 21.22;37.47 20.21;37.15 18.85;37.36 20.6];
% 320 
% new 320 : 30.99 13.87
pcs = [80,160,320,400,640,800];

sumt = setup_solve_HYPRE(:,1) + setup_solve_HYPRE(:,2);

efficiency = sumt(1) ./ sumt;

ssize = [12.83,25.67,51.39,64.15,102.78,128.52];


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
set(axes2,'FontSize',16,'XTick',[80,160,320,400,640,800]);
xlabel({'# of processes'});
ylabel({'PC Setup + KSP Solve Time (s)'});
legend('PC Setup','KSP Solve');
























