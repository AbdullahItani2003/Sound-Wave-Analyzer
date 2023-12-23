%T = 2      [1-(-1)=2]
load('Q1_2.mat');

dt=(t(2)-t(1));
error_plot =zeros(1,length(n_vec));
errorfn = zeros(1,length(t));

for j = 1:length(n_vec)

    xhat = ffs(xt, t, n_vec(j), 2);
    plot(t, xhat);
    for i = 1:length(t)
        errorfn(i) = abs((xt(i) - xhat(i))).^2;
    end
    
    for ii = 1:length(t)
        error_plot(j) = error_plot(j) + errorfn(ii)*dt;
    end
end
    
figure
plot(n_vec, error_plot);
