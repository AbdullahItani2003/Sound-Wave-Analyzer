dt=(t(2)-t(1));
error_plot =zeros(1,length(T_vec));
errorfn = zeros(1,length(t));

for j = 1:length(T_vec)

    xhat = ffs(ut, t, 6, T_vec(j));
    plot(t, xhat);
    for i = 1:length(t)
        errorfn(i) = abs((ut(i) - xhat(i))).^2;
    end
    
    for ii = 1:length(t)
        error_plot(j) = error_plot(j) + errorfn(ii)*dt;
    end
end
    
figure
plot(T_vec, error_plot);