% Sample x(t) at 0.5fN
fs1 = 1;
[t_sample1, x_sample1] = sample(t, xt, fs1);

% Sample x(t) at 2fN
fs2 = 4;
[t_sample2, x_sample2] = sample(t, xt, fs2);

% Plot original and sampled signals
subplot(3,1,1)
plot(t, xt)
xlabel('Time (s)')
ylabel('Amplitude')
title('Original Signal')

subplot(3,1,2)
stem(t_sample1, x_sample1)
xlabel('Time (s)')
ylabel('Amplitude')
title('Sampled Signal, fs = 0.5fN')

subplot(3,1,3)
stem(t_sample2, x_sample2)
xlabel('Time (s)')
ylabel('Amplitude')
title('Sampled Signal, fs = 2fN')
