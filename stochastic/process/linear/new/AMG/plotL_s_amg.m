
%%%% Setup time = PCSetUp + PCSetUpOnBlocks 
%%%% solve time = KSPSolve - PCSetUpOnBlocks

setup_solve_HYPRE =  [6.40 8.90;4.19 4.85;2.64 2.52;2.36 2.25;2.02 1.54;1.99 1.65];

pcs = [80,160,320,400,640,800];

figure1 = figure;
axes1 = axes('Parent',figure1);
bar(pcs,setup_solve_HYPRE,'stacked');
% hold on
% plot(pcs,linear_asm,'LineWidth',2);
set(axes1,'FontSize',16,'XTick',[80 160 320 400 640 800]);
xlabel({'# of processes'});
ylabel({'PC Setup + KSP Solve Time (s)'});
legend('PC Setup','KSP Solve');




%%%%% speedup plot

ts = 30.01+11.92;
speedup = [ts/(30.01+11.92), ts/(14.73+7.26), ts/(6.94+4.04),ts/(6.16+3.53),ts/(4.35+2.66),...
    ts/(3.66+2.17)];
np = pcs./80;
linearspeedup = ts./np;
efficiency = speedup ./np;


fig2 = figure(2);
axes2 = axes('Parent',fig2);
plot(pcs,speedup,'LineWidth',2);
hold on
plot(pcs,np,'LineWidth',2);
set(axes2,'FontSize',16,'XTick',[80 160 320 400 640 800]);
xlabel({'# of processes'});
ylabel({'Speedup'});
legend('Solver speedup','Linear speedup')
xlim([80 800])

fig3 = figure(3);
axes3 = axes('Parent',fig3);
plot(pcs,efficiency,'LineWidth',2);
set(axes3,'FontSize',16,'XTick',[80 160 320 400 640 800]);
xlabel({'# of processes'});
ylabel({'Efficiency'});
ylim([0 1.5]);





















