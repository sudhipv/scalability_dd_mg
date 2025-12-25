
%%% To plot weak scalability for Non linear Poisson Problem
%%% 2L - ASM and HYPRE in coarse grid


pcs =   [40,80,160,240, 400];

hypre1 =  [100.515,102.865,108.056,112.34,122.448];
hypre2 =  [134.507,136.796,142.733,148.785,159.719];
hypre3 =  [195.275,197.443,203.118,209.394,220.649];


hypreiter1 =  [12,12,12,12,12];
hypreiter2 =  [16,16,16,16,16];
hypreiter3 =  [25,25,25,25,25];


asm1 =  [125.323,139.778,162.915,183.57,208.803];
asm2 =  [174.144,197.998,240.571,246.91,333.483];
asm3 =  [282.741,338.74,371.628,464.264,538.221];


asmiter1 =  [19,24,30,39,45];
asmiter2 =  [24,30,42,44,69];
asmiter3 =  [34,48,53,76,89];

figure(2)
axes1 = axes('Parent',figure);
plot(pcs,hypreiter1,'MarkerSize',15,'Marker','v','LineWidth',2)
hold on
plot(pcs,hypreiter2,'MarkerSize',15,'Marker','v','LineWidth',2);
hold on
plot(pcs,hypreiter3,'MarkerSize',15,'Marker','v','LineWidth',2)
set(axes1,'FontSize',16,'XTick',[40 80 160 240 300 350 400]);
xlabel({'Number of Processes'});
ylabel({'KSP Iteration Count (Mean)'});
legend('m = 1', 'm = 2', 'm = 3');







