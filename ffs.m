function [xhat, ck] = ffs(xt, t, n, T)
ck = zeros(1, 2*n+1);
xhat = zeros(1, length(t));
dt=(t(2)-t(1));
for k = -n:n
    for i = 1:length(t)
        ck(k+n+1) = ck(k+n+1) + (1/T)*dt*xt(i)*exp((-2*1i*pi*k*t(i))/T);
    end
end
for i= 1:length(t)
   for k= -n:n
       xhat(i)=xhat(i)+ck(k+n+1)*exp((2*1i*pi*k*t(i))/T);
   end
%xhat(i) = xhat(i)/(2*n+1);
end
end
