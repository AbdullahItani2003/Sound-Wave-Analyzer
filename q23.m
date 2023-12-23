% Reconstruct sampled signals
xrcon1 = reconstruct(t, x_sample1, fs1);
xrcon2 = reconstruct(t, x_sample2, fs2);

% Plot reconstructed signals
figure
subplot(4,1,1)
plot(t, xt)
xlabel('Time (s)')
ylabel('Amplitude')
title('Original Signal')

subplot(4,1,2)
plot(t, xrcon1)
xlabel('Time (s)')
ylabel('Amplitude')
title('Reconstructed Signal, fs = 0.5fs')

subplot(4,1,3)
plot(t, xrcon2)
xlabel('Time (s)')
ylabel('Amplitude')
title('Reconstructed Signal, fs = 2fs')

subplot(4,1,4)
plot(t, xrcon1,'g')
hold on
plot(t, xrcon2,'r')
hold off
xlabel('Time (s)')
ylabel('Amplitude')
title('Overlapping Both Reconstructed Signals')