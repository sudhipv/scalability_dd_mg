
%%% Nonlinear Case


setup_solve_hypre =  [133.9 93.2;47.6 45.9; 27.1 4.4; 17.0 5.98; 14.0 5.3];

 linear_hypre = [227.1, 227.1/2, 227.1/3, 227.1/4, 227.1/5];
 
 
% setup_solve_HYPRE = [ ];

pcs = [80,160,240,320,400];


% bar(pcs,setup_solve_hypre,'stacked');
% hold on
% plot(pcs,linear_hypre);


setup_solve_ASM =  [138.3 1121.7;46.9 459.1; 26.2 316.9;16.9 266.1;...
    12.4 173];

linear_asm = [1260,1260/2,1260/3,1260/4,1260/5];

figure1 = figure;
axes1 = axes('Parent',figure1);
bar(pcs,setup_solve_hypre,'stacked');
hold on
plot(pcs,linear_hypre);
set(axes1,'FontSize',16,'XTick',[80 160 240 320 400]);
xlabel({'Number of Processes'});
ylabel({'Setup + Solve Time (s)'});
% legend('Two Level RAS','Two Level RAS - V2', 'Two Level RAS - V3');







