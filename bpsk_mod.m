function x = bpsk_mod(b, A)
x = zeros(1, length(b));
for i = 1:length(b)
    if b(i) == 1
        x(i) = A;
    elseif b(i)==0
        x(i) = -A;
    end
end
end
%BPSK mod according to the function in project description