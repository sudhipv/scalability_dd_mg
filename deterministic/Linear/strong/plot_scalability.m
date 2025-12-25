


time2L_V2 =  [146.167,81.2532,59.1336,52.3782,45.1309,38.8459];
iter2L_V2 = [47,47,41,48,45,44];
% err_V2 = [6.64554e-07,4.5192e-06,3.42828e-06,4.81393e-06,8.93062e-06];


time_HYPRE =  [61.565,40.5128,34.0853,31.5666,30.4907,28.8936];
iter_HYPRE = [9,9,9,9,9,9];
% err_HYPRE = [1.21703e-08,1.36472e-08,1.08959e-08,1.23557e-08,1.32458e-08];



time_exact = [140.913,123.848,118.028,115.925,113.737,113];
iter_exact = [9,9,9,9,9,9];


% time_1lhypre = [54.4104,29.5468,29.5357,29.6288,29.5818,30.0978];



pcs = [80,160,240,320,400,600];


figure1 = figure;
axes1 = axes('Parent',figure1);
plot(pcs,iter_exact,'MarkerSize',15,'Marker','diamond','LineWidth',2)
hold on
plot(pcs,iter2L_V2,'MarkerSize',15,'Marker','pentagram','LineWidth',2)
hold on
plot(pcs,iter_HYPRE,'MarkerSize',15,'Marker','v','LineWidth',2)
% hold on
% plot(pcs,iter_1lhypre,'MarkerSize',15,'Marker','o','LineWidth',2)
set(axes1,'FontSize',16,'XTick',[80 160 240 320 400 600]);
xlabel({'Number of Processes'});
ylabel({'Time (s)'});
legend('Two Level RAS','Two Level RAS - V2', 'Two Level RAS - V3');

