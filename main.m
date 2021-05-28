load('coins.mat')
% Load test image (coin) 
img = imread('images/coins_t4.jpg');

img = imresize(img,0.2);

lpf = fspecial('gaussian', [12,12],4);

img1 = imfilter(img,lpf);

img_gr = rgb2gray(img1);

% Binarize the image
imgBin = imbinarize(img_gr);


% Fill the holes and regions of the image
BinImgF = imfill(imgBin,'holes');


% Detecting total number of objects in image

[labelImg, numOfObj] = bwlabel(BinImgF);

% Get the properties of measurement of image region 
measurement = regionprops(labelImg, 'Area', 'Centroid');

% Sum of coins
soc = 0;


figure(1)
imshow(img);
hold on;

% Count total sum of coin based on area 
for s = 1:size(measurement,1)
    % toc is type of cents
    toc = measurement(s).Centroid;
    A = round(toc(1));
    B = round(toc(2));
    
    % Determine coin by area and pixel intensity of center of coin for
    % silver or gold
    if measurement(s).Area <= coins(1) && img_gr(B,A) >= 150 
        text(A-90,B, '$0.05','FontSize',20)
        soc = soc + 0.05;
    elseif measurement(s).Area <= coins(2) && img_gr(B,A) < 150
        text(A-50,B, '$2','FontSize',20)
        soc = soc + 2;
    elseif measurement(s).Area > coins(2) && measurement(s).Area <= coins(4) && img_gr(B,A) >= 150
        text(A-85,B, '$0.10','FontSize',20)
        soc = soc + 0.10;
    elseif measurement(s).Area > coins(2) && measurement(s).Area <= coins(5) && img_gr(B,A) < 150
        text(A-80,B, '$1.00','FontSize',20)
        soc = soc + 1;
    elseif measurement(s).Area > coins(4) && measurement(s).Area <= coins(5) && img_gr(B,A) >= 150
        text(A-80,B, '$0.20','FontSize',20)
        soc = soc + 0.20;
    elseif measurement(s).Area > coins(5)
        text(A-70,B, '$0.50','FontSize',20)
        soc = soc + 0.50;
    end
end
hold on;
% title shows the total sum of the coins
title(['Total sum of coins = ',num2str(soc), ' cents'])
    
disp('Total Sum:')
disp(soc)



