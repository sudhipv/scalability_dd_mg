


time2L_V2 =  [7180.09,3656.62,2279.38,1665.42,1321.43,923.428];
iter2L_V2 = [19,20,20,20,19,19];
% err_V2 = [6.64554e-07,4.5192e-06,3.42828e-06,4.81393e-06,8.93062e-06];



time_HYPRE =  [5391.05,2483.1,1674.6,1323.02,1067.06,711.108];
iter_HYPRE = [7,7,7,7,7,7];
% err_HYPRE = [1.21703e-08,1.36472e-08,1.08959e-08,1.23557e-08,1.32458e-08];


pcs = [80,160,240,320,400,600];


figure1 = figure;
axes1 = axes('Parent',figure1);
% hold(axes1,'on');
plot(pcs,iter2L_V2,'MarkerSize',15,'Marker','pentagram','LineWidth',2)
hold on
plot(pcs,iter_HYPRE,'MarkerSize',15,'Marker','v','LineWidth',2)
set(axes1,'FontSize',16,'XTick',[80 160 240 320 400 600]);
xlabel({'Number of Processes'});
ylabel({'KSP Iteration Count (Mean)'});
xticks([80,160,240,320,400,600]);
legend('Two Level RAS - V2', 'Two Level RAS - V3');





