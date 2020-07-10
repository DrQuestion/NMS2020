function [tResult, xResult] = glv_simulation(Xinit, M_mu_eps, time, time_points, pert_matrix, C_diff)
tResult = [];
xResult = [];
if time(2) > time_points(end)
    time_points = [time_points, time(2)];
    if numel(time_points) > size(pert_matrix, 2)
        pert_matrix = [pert_matrix pert_matrix(:,end)];
    end
end
if C_diff
    Xinit(7)=C_diff;
end
n_perts = size(pert_matrix, 1);
for index = 2:numel(time_points)
    t = time_points(index-1:index);
    pert_state = pert_matrix(:,index-1);
    Xinit(end-n_perts+1:end)=pert_state;
    [t,simulatedAbundance]  = ode15s(@(t,X) generalized_lotka_volterra_model(t,X,M_mu_eps), t, Xinit, M_mu_eps);
    tResult = cat(1, tResult, t);
    xResult = cat(1, xResult, simulatedAbundance);
    % Final value of x is initial value for next step:
    Xinit = simulatedAbundance(end, :);
end