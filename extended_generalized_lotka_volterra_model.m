% egLV model
function dXdt = extended_generalized_lotka_volterra_model(t, X, M_mu_eps)

n_taxa = size(M_mu_eps,1);
dXdt = zeros(size(X,1),1);
n_pert = size(M_mu_eps,2) - n_taxa - 1;

for i=1:n_taxa
    dXdt(i) = M_mu_eps(i,n_taxa+1) * X(i);
    for j=1:n_taxa
        dXdt(i) = dXdt(i) + X(i) * M_mu_eps(i,j) * X(j);
    end
    for p=n_taxa+2:n_taxa+1+n_pert
        dXdt(i) = dXdt(i) + X(i) * M_mu_eps(i,p) * X(p);
    end
end

end