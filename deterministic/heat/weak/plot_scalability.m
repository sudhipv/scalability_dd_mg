


time2L_V2 =  [31.1606,33.5256,42.0207,50.1778,70.8404];
iter2L_V2 = [8,8,10,12,15];


time_HYPRE =  [20.9316,23.3135,27.5492,31.7719,39.9074];
iter_HYPRE = [7,7,7,7,7];


dof = [2.253,4.507,9.006,13.52,22.53]; %418609


pcs = [40, 80,160,240,400];

% func_scalability_yy(pcs,time2L_V2,dof);
% 
% yyaxis left

figure1 = figure;
axes1 = axes('Parent',figure1);
plot(pcs,iter2L_V2,'MarkerSize',15,'Marker','pentagram','LineWidth',2)
hold on
plot(pcs,iter_HYPRE,'MarkerSize',15,'Marker','v','LineWidth',2)
set(axes1,'FontSize',16,'XTick',[40 80 160 240 400]);
xlabel({'Number of Processes'});
ylabel({'Time (s)'});
xticks([80,160,240,320,400,600]);
legend('Two Level RAS - V2', 'Two Level RAS - V3');





