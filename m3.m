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

% Call the quan function with the input image and the given quantization thresholds and levels
imgq = quan(img, [127], [0, 255]);

% Display the original and quantized images
figure;
subplot(1,2,1); imshow(img); title('Original Image');
subplot(1,2,2); imshow(imgq); title('Quantized Image');