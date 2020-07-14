close all
M_mu_eps=F_tot*(Y_tot.')*(inv(Y_tot*(Y_tot.')+D_tot));

%Population 3 rep 2
Xinit = Y_tot(:,41);
pert_matrix = Y_tot(end,41:51);
time_points = T_tot(41:51);
C_diff = 0.001;


[t,simulatedAbundance] = eglv_simulation(Xinit, M_mu_eps, [0 30], time_points, pert_matrix, C_diff);
 
sgt=sgtitle('Prediction of the microbial composition in the cecum with pulse perturbation','fontweight','bold','fontsize',20);
subplot(3,1,3)
h3=area(t,simulatedAbundance(:,1:11));

title({'';'Replicate 2 of population #3'})
xlabel('Days')
ylabel('log10 Copies rRNA/cm^3')
cmap = colormap(colorcube(11));
for i=1:11
h3(i).FaceColor = cmap(i,:);
end


%Population 1 rep 2
Xinit1 = Y_tot(:,37);
pert_matrix1 = Y_tot(end,37:40);
time_points1 = T_tot(37:40);
C_diff = 0.001;

[t1,simulatedAbundance1] = eglv_simulation(Xinit1, M_mu_eps, [0 30], time_points1, pert_matrix1, C_diff);
subplot(3,1,1)
h1=area(t1,simulatedAbundance1(:,1:11));
title({'';'Replicate 2 of population #1'})

xlabel('Days')
ylabel('log10 Copies rRNA/cm^3')
cmap = colormap(colorcube(11));
for i=1:11
h1(i).FaceColor = cmap(i,:);
end


%Population 2 rep 2
Xinit2 = Y_tot(:,26);
pert_matrix2 = Y_tot(end,26:36);
time_points2 = T_tot(26:36);
C_diff = 0;

[t2,simulatedAbundance2] = eglv_simulation(Xinit2, M_mu_eps, [0 30], time_points2, pert_matrix2, C_diff);
subplot(3,1,2)
h2=area(t2,simulatedAbundance2(:,1:11));
cmap = colormap(colorcube(11));
for i=1:11
h2(i).FaceColor = cmap(i,:);
end

title('Replicate 2 of population #2')
xlabel('Days')
ylabel('log10 Copies rRNA/cm^3')
legend({'und. genus of Enterobacteriaceae', 'Blautia', 'Barnesiella', 'und. genus of uncl. Mollicutes', 'und. genus of Lachnospiraceae', 'Akkermansia', 'Clostridium difficile', 'uncl. Lachnospiraceae', 'Coprobacillus', 'Enterococcus', 'Other'});
