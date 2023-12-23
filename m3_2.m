% Load the Q3.mat file
load('Q3.mat');

% Quan function
function imgq = quan(img, thr, lvl)

    % Initialize the quantized image matrix
    imgq = zeros(size(img), 'uint8');
    
    % loop over pixels
    for i = 1:numel(img)
        pxl = img(i);
        % Apply quantization to pixel
        if pxl <= thr(1)
            imgq(i) = lvl(1);
        elseif pxl > thr(end)
            imgq(i) = lvl(end);
        else
            for j = 2:numel(thr)
                if pxl <= thr(j)
                    imgq(i) = lvl(j-1);
                    break;
                end
            end
        end
    end
end

% percentiles
percentiles = (12.5:12.5:87.5);
thr = [0, prctile(img(:), percentiles), 256];

lvl = zeros(1, numel(thr)-1); % compute lvl values
for i = 2:numel(thr)
    lvl(i-1) = uint8(thr(i-1)/2 + thr(i)/2 - 1 / 2); % center of each interval
end

thr = uint8(thr(2:end-1)); % Exclude endpoints

% display values for thr and lvl
disp("thr: ");
disp(thr);
disp("lvl: ");
disp(lvl);

% quantize image using non-uniform quantization rule
imgq2 = quan(img, thr, lvl);

% plot quantized image
figure;
imshow(imgq2);
title("Selectively Quantized Image");

% calculate MSE
n = numel(img);
mse2 = sum((double(img(:)) - double(imgq2(:))).^2) / n;
fprintf('MSE: %f\n', mse2);