%Lossless verification for bpsk
num_bits = 1000;
b = randi([0 1], 1, num_bits);
A = sqrt(2); 
x = bpsk_mod(b, A);
b_hat = bpsk_demod(x);
bit_error_rate_bpsk = mean(b ~= b_hat);
fprintf('BPSK Bit Error Rate: %f\n', bit_error_rate_bpsk);

%Lossless verification for qpsk
num_bits = 1000;
b = randi([0 1], 1, num_bits);
A = sqrt(2); 
x = qpsk_mod(b, A);
b_hat = qpsk_demod(x);
bit_error_rate_qpsk = mean(b ~= b_hat);
fprintf('QPSK Bit Error Rate: %f\n', bit_error_rate_qpsk);



%BPSK with noise
numBits = 1000;    % Number of bits to transmit
snrValues = 0:2:20;    % SNR values to test
numTrials = 100;    % Number of trials per SNR value
bitErrors = zeros(length(snrValues), 1);

for snrIndex = 1:length(snrValues)
    snr = snrValues(snrIndex);
    Es = 1;    % Energy per symbol
    A = sqrt(Es);
    SNR = 10^(snr/10);
    En = Es / SNR;    % Noise power
    
    for trial = 1:numTrials
        bits = randi([0, 1], 1, numBits);
        
        % BPSK modulation
        bpx = bpsk_mod(bits, A);
        
        % Add AWGN channel noise
        noise = sqrt(En/2) * (randn(1, numBits) + 1j * randn(1, numBits));
        receivedSymbols = bpx + noise;
        
        % BPSK demodulation
        receivedBits = bpsk_demod(receivedSymbols);
        
        % Count bit errors
        bitErrors(snrIndex) = bitErrors(snrIndex) + sum(receivedBits ~= bits);
    end
    
    % Calculate bit error rate
    bitErrorRate(snrIndex) = bitErrors(snrIndex) / (numBits * numTrials);
end

% Plot bit error rate vs. SNR


bitErrors2 = zeros(length(snrValues), 1);
%QPSK with noise
for snrIndex = 1:length(snrValues)
    snr = snrValues(snrIndex);
    Es = 1;    % Energy per symbol
    A = sqrt(Es);
    SNR = 10^(snr/10);
    En = Es / SNR;    % Noise power
    
    for trial = 1:numTrials
        bits = randi([0, 1], 1, numBits);
        
        % QPSK modulation
        bpx = qpsk_mod(bits, A);
        
        % Add AWGN channel noise
        noise = sqrt(En/2) * (randn(1, numBits) + 1j * randn(1, numBits));
        receivedSymbols = bpx + noise + noise*1i;
        
        % QPSK demodulation
        receivedBits = qpsk_demod(receivedSymbols);
        
        % Count bit errors
        bitErrors2(snrIndex) = bitErrors2(snrIndex) + sum(receivedBits ~= bits);
    end
    
    % Calculate bit error rate
    bitErrorRate2(snrIndex) = bitErrors2(snrIndex) / (numBits * numTrials);
end

% Plot bit error rate vs. SNR
figure;
semilogy(snrValues, bitErrorRate2, 'bo-');
hold on;
semilogy(snrValues, bitErrorRate, 'ro-');
xlabel('SNR (dB)');
ylabel('Bit Error Rate');
title('Modulations');


grid on;
legend('QPSK(blue)','BPSK(red)');
hold off;