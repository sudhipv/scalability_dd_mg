

setup_solve_HYPRE =  [29.395 7.952;9.987 3.816;5.683 2.441; 3.659 1.897;...
    2.749 1.485];

 maxt_H = 37.347;
 linear_hypre = [maxt_H,maxt_H/2,maxt_H/3,maxt_H/4,maxt_H/5];
 
 
% setup_solve_HYPRE = [ ];

pcs = [80,160,240,320,400];

% bar(pcs,setup_solve_hypre,'stacked');
% hold on
% plot(pcs,linear_hypre);



setup_solve_ASM =  [28.43 136.11;10.765 69.54;6.026 40.436;6.473 30.674;...
    2.644 23.119];

maxt_A = 164.54;
linear_asm = [maxt_A,maxt_A/2,maxt_A/3,maxt_A/4,maxt_A/5];

figure1 = figure;
axes1 = axes('Parent',figure1);
bar(pcs,setup_solve_ASM,'stacked');
hold on
plot(pcs,linear_asm,'LineWidth',2);
set(axes1,'FontSize',16,'XTick',[80 160 240 320 400]);

xlabel({'Number of Processes'});
ylabel({'Setup + Solve Time (s)'});
% legend('Two Level RAS','Two Level RAS - V2', 'Two Level RAS - V3');




