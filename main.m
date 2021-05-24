% ================================= 
% By default of coin detection
% =================================

% Load test image (coin) 
imgtest = imread('coins2.jpg');
imgA = double(imgtest)./255;
img1 = rgb2gray(imgA);
imgBin = imbinarize(img1);
figure(1)
imshow(imgBin);

% Get rid of background
BinImgF = imfill(imgBin,'holes');
se = strel('square',2);
BinImgA = imopen(BinImgF,se);
BinImgB = imclose(BinImgA,se);

figure(3)
imshow(BinImgF);

% ==========================================
% Detecting total number of objects in image
% ===========================================
figure(4)
imshow(BinImgB);
[labelImg, numOfObj] = bwlabel(BinImgB);
measurement = regionprops(labelImg);

