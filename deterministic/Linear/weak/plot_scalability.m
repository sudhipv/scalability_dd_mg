

time_2Lexact =  [11.1316,17.0471,32.1194,47.5023,78.5204];
pcs =   [40,80,160,240, 400];
iter_2Lexact = [9,9,9,9,9];
err_exact = [1.82882e-08,1.34246e-08,1.27392e-08,1.57545e-08,1.4409e-08];

dof = [2.253,4.507,9.006,13.52,22.53]; %418609

time2L_V2 =  [8.59339,10.6335,15.6032,19.8016,29.6606];
iter2L_V2 = [16,20,26,30,39];
err_V2 = [1.89928e-07,4.26944e-07,6.64554e-07,1.97367e-06,4.89846e-06];

% func_scalability_yy(pcs,time_2Lexact,dof);
% figure(2)
% axes1 = axes('Parent',figure);
% set(axes1,'FontSize',14,'FontWeight','bold');
% plot(pcs,err_exact,'MarkerSize',10,'Marker','diamond','LineWidth',2);
% hold on
% plot(pcs,err_V2,'MarkerSize',10,'Marker','pentagram','LineWidth',2)



time_HYPRE =  [6.46618,7.94271,11.0379,14.8465,22.6489];
iter_HYPRE = [9,9,9,9,9];
err_HYPRE = [1.89094e-08,1.31975e-08,1.21703e-08,1.50096e-08,1.34319e-08];


% plot(pcs,err_HYPRE,'MarkerSize',15,'Marker','diamond','LineWidth',2)



hypre1L_time = [8.86466,15.5945,29.8368,44.4393,73.2286];
hypre1L_iter = [7,7,7,7,7];
hypre1L_error = [5.6785e-07,4.52311e-07,1.62518e-06,2.74812e-06,2.7317e-06];
pcs_1l = [40,80,160,240,320];
plot(pcs_1l,hypre1L_error,'MarkerSize',15,'Marker','o','LineWidth',2)


