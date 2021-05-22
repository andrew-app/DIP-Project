% Load test image (coin) 
imgtest = imread('coins.jpg');
imgA = double(imgtest)./255;
img1 = rgb2gray(imgA);
imgBin = imbinarize(img1);
figure(1)
imshow(imgBin);

% Convert objects to white
BinImg = imcomplement(imgBin);
figure(2)
imshow(BinImg);

% Get rid of background
se = strel('square',4);
BinImgA = imopen(BinImg,se);
BinImgB = imclose(BinImgA,se);

figure(3)
imshow(BinImgB);
[labelImg, numOfObj] = bwlabel(BinImgB);
measurement = regionprops(labelImg);

