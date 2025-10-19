clc; clear; close all;

%% Step 1: Read Image
img = imread('glioma_tumor.png'); % Replace with your image
greenChannel = img(:,:,2);   % Green channel for retinal images
figure, imshow(greenChannel), title('Original Green Channel');

%% Step 2: Parameters
tileSize = [8 8];   % Number of tiles (rows x cols)
clipLimit = 0.01;   % Clip limit (fraction of total pixels per tile)
L = 256;            % Number of gray levels

[rows, cols] = size(greenChannel);
tileRows = floor(rows / tileSize(1));
tileCols = floor(cols / tileSize(2));

clahe_img = zeros(rows, cols, 'uint8'); % Output image

%% Step 3: Process Each Tile
for i = 1:tileSize(1)
    for j = 1:tileSize(2)
        
        % Define tile boundaries
        r1 = (i-1)*tileRows + 1;
        r2 = i*tileRows;
        c1 = (j-1)*tileCols + 1;
        c2 = j*tileCols;
        
        tile = greenChannel(r1:r2, c1:c2);
        tilePixels = numel(tile);
        
        % Step 3a: Compute Histogram
        histTile = zeros(L,1);
        for k = 0:L-1
            histTile(k+1) = sum(tile(:) == k);
        end
        
        % Step 3b: Clip Histogram
        clipVal = clipLimit * tilePixels;
        excess = sum(max(histTile - clipVal, 0));
        histTile = min(histTile, clipVal);
        histTile = histTile + excess / L; % Redistribute excess
        
        % Step 3c: Compute CDF
        cdf = cumsum(histTile) / sum(histTile);
        
        % Step 3d: Map pixels
        tile_enhanced = uint8(round(cdf(double(tile)+1) * (L-1)));
        
        % Assign back to output image
        clahe_img(r1:r2, c1:c2) = tile_enhanced;
    end
end

%% Step 4: Display Result
figure, imshow(clahe_img), title('CLAHE Enhanced Image (Manual)');

%% Step 5: Plot Histograms
% Original vs Enhanced histograms
figure;
subplot(2,1,1);
imhist(greenChannel);
title('Histogram - Original Green Channel');
xlabel('Pixel Intensity');
ylabel('Frequency');
grid on;

subplot(2,1,2);
imhist(clahe_img);
title('Histogram - CLAHE Enhanced Image');
xlabel('Pixel Intensity');
ylabel('Frequency');
grid on;

%% Optional: Reconstruct RGB Image
enhanced_img = img;
enhanced_img(:,:,2) = clahe_img;
figure,
subplot(1,2,1), imshow(img), title('Original RGB Image');
subplot(1,2,2), imshow(enhanced_img), title('Enhanced RGB Image');
