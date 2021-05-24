% ================================= 
% By default of coin detection
% =================================

% Load test image (coin) 
imgtest = imread('coins2.jpg');
%imgA = double(imgtest)./255;
img1 = rgb2gray(imgtest);
% Binarize the image
imgBin = imbinarize(img1);
figure(1)
imshow(imgBin);

% Fill the holes and regions of the image
BinImgF = imfill(imgBin,'holes');

% Get rid of background
se = strel('square',2);
BinImgA = imopen(BinImgF,se);
BinImgB = imclose(BinImgA,se);

% Detecting total number of objects in image
figure(3)
imshow(BinImgB);
[labelImg, numOfObj] = bwlabel(double(BinImgB));

% Get the properties of measurement of image region 
measurement = regionprops(labelImg, 'Area', 'Centroid');

% Sum of coins
soc = 0;

% ===============
% Method 1 Test 
% ===============

imshow(imgtest);
hold on;

% Count total sum of coind based on area 
for s = 1:size(measurement,1)
    % toc is type of cents
    toc = measurement(s).Centroid;
    A = toc(1);
    B = toc(2);
    % Shows the denomination of each coin by area
    if measurement(s).Area <= 60105 && measurement(s).Area < 68741
        text(A-90,B, '$0.05','FontSize',20)
        soc = soc + 0.05;
    elseif measurement(s).Area <= 68741 && measurement(s).Area < 91793
        text(A-50,B, '$2','FontSize',20)
        soc = soc + 2;
    elseif measurement(s).Area <= 91793 && measurement(s).Area < 102114
        text(A-85,B, '$0.10','FontSize',20)
        soc = soc + 0.10;
    elseif measurement(s).Area <= 102114 && measurement(s).Area < 133135
        text(A-80,B, '$1.00','FontSize',20)
        soc = soc + 1;
    elseif measurement(s).Area <= 133135 && measurement(s).Area < 172389
        text(A-80,B, '$0.20','FontSize',20)
        soc = soc + 0.20;
    else
        text(A-70,B, '$0.50','FontSize',20)
        soc = soc + 0.50;
    end
end
hold on;
% title shows the total sum of the coins
title(['Total sum of coins = ',num2str(soc), ' cents'])
    
% ========================
% Method 2
% ========================
    


