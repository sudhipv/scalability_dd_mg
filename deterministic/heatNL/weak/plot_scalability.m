
%%% To plot weak scalability for Non linear Heat Equation 
%%% 2L - ASM and HYPRE in coarse grid

time_ASM =  [746.624,763.522,829.631,855.53,923.338];
pcs =   [40,80,160,240, 400];
KSP_ASM = [8,9,11,13,16];
Picard_ASM = [6,6,6,6,6];

dof = [2.253,4.507,9.006,13.52,22.53]; %418609

time_hypre =  [684.633,699.238,703.921,719.222,727.413];
KSP_hypre = [7,7,7,7,7];
Picard_hypre = [6,6,6,6,6];

%%% Only for right yy axis plot
% func_scalability_yy(pcs,time_ASM,dof);

% hold on
% yyaxis left
figure(2)
axes1 = axes('Parent',figure);
set(axes1,'FontSize',16);
plot(pcs,KSP_ASM,'MarkerSize',15,'Marker','pentagram','LineWidth',2);
hold on
plot(pcs,KSP_hypre,'MarkerSize',15,'Marker','v','LineWidth',2)
xlabel({'Number of Processes'});
ylabel({'KSP Iteration'});
legend('Two Level RAS - V2','Two Level RAS - V3');








