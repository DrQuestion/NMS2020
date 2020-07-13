close all
M_mu_eps=F_tot*(Y_tot.')*(inv(Y_tot*(Y_tot.')+D_tot));


%Population 3 rep 2
Xinit = Y_tot(:,41);
pert_matrix = ones(1,11);
time_points = T_tot(41:51);
C_diff = 0.001;

[t,simulatedAbundance] = eglv_simulation(Xinit, M_mu_eps, [0 30], time_points, pert_matrix, C_diff);
 
sgt=sgtitle('Prediction of the microbial composition in the cecum with constant perturbation','fontweight','bold','fontsize',20);
subplot(2,1,2)
h=area(t,simulatedAbundance(:,1:11));

title({'';'Replicate 2 of population #3'})

xlabel('Days')
ylabel('log10 Copies rRNA/cm^3')
cmap = colormap(colorcube(11));
for i=1:11
h(i).FaceColor = cmap(i,:);
end

%Population 2 rep 2
Xinit2 = Y_tot(:,26);
pert_matrix2 = ones(1,11);
time_points2 = T_tot(26:36);
C_diff2 = 0;

[t2,simulatedAbundance2] = eglv_simulation(Xinit2, M_mu_eps, [0 30], time_points2, pert_matrix2, C_diff2);
subplot(2,1,1)
h=area(t2,simulatedAbundance2(:,1:11));
cmap = colormap(colorcube(11));
for i=1:11
h(i).FaceColor = cmap(i,:);
end

title('Replicate 2 of population #2')
legend({'und. genus of Enterobacteriaceae', 'Blautia', 'Barnesiella', 'und. genus of uncl. Mollicutes', 'und. genus of Lachnospiraceae', 'Akkermansia', 'Clostridium difficile', 'uncl. Lachnospiraceae', 'Coprobacillus', 'Enterococcus', 'Other'})

xlabel('Days')
ylabel('log10 Copies rRNA/cm^3')