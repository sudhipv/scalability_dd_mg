
%%%% Setup time = PCSetUp + PCSetUpOnBlocks 
%%%% solve time = KSPSolve - PCSetUpOnBlocks

setup_solve_HYPRE =  [129 141.03;56.17 78.33;28.33 46.35;24.87 43.78;18.08 32.37;15.78 26.68];

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

ts = 129+141.03;
speedup = [ts/(129+141.03), ts/(56.17+78.33), ts/(28.33+46.35),ts/(24.87+43.78),ts/(18.08+32.37),...
    ts/(15.78+26.68)];
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





















