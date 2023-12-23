function b = qpsk_demod(x)
b = zeros(1, length(x));
for i = 1:2:length(x) 
    if real(x(i)) >= 0 && imag(x(i)) >= 0
        b(i) = 1;
        b(i+1) = 1;
    elseif real(x(i)) < 0 && imag(x(i)) < 0
        b(i) = 0;
        b(i+1) = 0;
    elseif real(x(i)) >= 0 && imag(x(i)) < 0
        b(i) = 0;
        b(i+1) = 1;
    elseif real(x(i)) < 0 && imag(x(i)) >= 0
        b(i) = 1;
        b(i+1) = 0;
    end
end
end
%QPSK demod according to the function in project description