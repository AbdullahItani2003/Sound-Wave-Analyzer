function [t_sample, x_sample] = sample(t, xt, fs)
% t: row vector representing time indices
% xt: row vector representing signal x(t)
% fs: scalar representing sampling rate

Ts = 1/fs; % Sampling period
t_sample = t(1):Ts:t(end); % Time indices for sampled signal
x_sample = interp1(t, xt, t_sample); % Interpolate signal at sampled time indices
end
