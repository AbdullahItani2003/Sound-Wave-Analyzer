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

% Quantization thresholds and levels
thr = linspace(0, 256, 9); % Divide into 8 intervals
lvl = uint8((double(thr(1:end-1)) + double(thr(2:end)) - 1) / 2); % Center of each interval
thr = uint8(thr(2:end-1)); % Exclude endpoints

% display values for thr and lvl
disp("thr: ");
disp(thr);
disp("lvl: ");
disp(lvl);

% Apply the uniform quantization rule to the input image
imgq1 = quan(img, thr, lvl);

% Display the quantized image
figure;
imshow(imgq1);
title('Uniformly Quantized Image');

% Calculate the mean squared error (MSE) of the quantization
n = numel(img);
mse = sum((double(img(:)) - double(imgq1(:))).^2) / n;
fprintf('MSE of quantization: %f\n', mse);