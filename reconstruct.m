function xrcon = reconstruct(t, x_sample, fs)
% calculate the sampling period
Ts = 1/fs;

% calculate the number of samples used for reconstruction
n = floor(length(x_sample)/2);

% initialize the reconstructed signal
xrcon = zeros(size(t));

% loop over the time indices in t
for i = 1:length(t)
    % loop over the sample indices used for reconstruction
    for k = -n:n
        % calculate the index in the x_sample vector
        idx = k + n + 1;
        % calculate the argument of the sinc function
        arg = (t(i)/Ts - k);
        % calculate the reconstructed signal value at time t(i)
        xrcon(i) = xrcon(i) + x_sample(idx)*sinc(arg);
    end
end



