
%%% To plot weak scalability for Non linear Poisson Problem
%%% 2L - ASM and HYPRE in coarse grid

time_ASM =  [125.323,139.778,162.915,183.57,208.803];
pcs =   [40,80,160,240, 400];
KSP_ASM = [19,24,30,39,45];
Picard_ASM = [8,8,8,8,8];
err_ASM = [1.11253e-07,1.08167e-07,2.88369e-07,4.54406e-06,2.31542e-06];

dof = [2.253,4.507,9.006,13.52,22.53]; %418609

time_hypre =  [100.515,102.865,108.056,112.34,122.448];
KSP_hypre = [12,12,12,12,12];
Picard_hypre = [8,8,8,8,8];
err_hypre = [8.24954e-09,4.24036e-09,2.22545e-09,1.37834e-09,1.21471e-09];

%%% Only for right yy axis plot
% func_scalability_yy(pcs,time_ASM,dof);


figure(2)
axes1 = axes('Parent',figure);
set(axes1,'FontSize',16);
plot(pcs,err_ASM,'MarkerSize',15,'Marker','pentagram','LineWidth',2);
hold on
plot(pcs,err_hypre,'MarkerSize',15,'Marker','v','LineWidth',2)
xlabel({'Number of Processes'});
ylabel({'L2 Norm of Relative Error'});








