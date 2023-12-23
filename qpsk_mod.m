function x = qpsk_mod(b, A)
x = zeros(1, length(b));
for j = 1:2:length(b)
    if b(j) == 1
        if b(j+1) == 1
            x(j) = (A/sqrt(2))*(1+1i);            
        elseif b(j+1) == 0
            x(j) = (A/sqrt(2))*(-1+1i);
        end        
    elseif b(j)==0
        if b(j+1) == 0
            x(j) = (A/sqrt(2))*(-1-1i);
        elseif b(j+1) == 1
            x(j) = (A/sqrt(2))*(1-1i);         
        end 
    end
end
end
%QPSK mod according to the function in project description
%this works because we are checking two bits of the array j and j+1
%while looping every 2 indexes so j+1 stays 0 and is effectively stored in
%j, and we also loop every 2 indexes in the demod meaning that the 0's in
%between every j do not affect the modulation and demodulation