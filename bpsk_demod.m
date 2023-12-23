function b = bpsk_demod(x)
b = zeros(1, length(x));
for i = 1:length(x)
    if x(i) >= 0
        b(i) = 1;
    else
        b(i) = 0;
    end
end
end
%BPSK demod according to the function in project description