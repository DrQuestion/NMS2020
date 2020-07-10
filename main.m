M_mu_eps=F_tot*(Y_tot.')*(inv(Y_tot*(Y_tot.')+D_tot));

%Population 1 rep 2
%Xinit = Y_tot(:,37);
%pert_matrix = Y_tot(end,37:40);
%time_points = T_tot(37:40);
%C_diff = 0.001;

%Population 2 rep 2
%Xinit = Y_tot(:,26);
%pert_matrix = Y_tot(end,26:36);
%time_points = T_tot(26:36);
%C_diff = 0;

%Population 3 rep 2
Xinit = Y_tot(:,41);
pert_matrix = Y_tot(end,41:51);
time_points = T_tot(41:51);
C_diff = 0.001;

[t,simulatedAbundance] = glv_simulation(Xinit, M_mu_eps, [0 30], time_points, pert_matrix, C_diff);

h = area(t,simulatedAbundance(:,1:11));
cmap = colormap(colorcube(11));
for i=1:11
h(i).FaceColor = cmap(i,:);
end
legend({'undefined_genus_of_Enterobacteriaceae', 'Blautia', 'Barnesiella', 'undefined_genus_of_unclassified_Mollicutes', 'undefined_genus_of_Lachnospiraceae', 'Akkermansia', 'Clostridium_difficile', 'unclassified_Lachnospiraceae', 'Coprobacillus', 'Enterococcus', 'Other'})
%plot(T_tot(26:36), Y_tot(1:11,26:36).'*scale_factor, 'o', 'LineWidth', 1.5)