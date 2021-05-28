% ==============================================
% By default of coin detection by (Wen Xuan Lee)
% ==============================================
load('coins.mat');
% Load test image (coin) 
imgtest = imread('coins22.jpg');
%imgA = double(imgtest)./255;
img1 = rgb2gray(imgtest);
% Binarize the image
imgBin = imbinarize(img1);
figure(1)
imshow(imgBin);

figure(10)
imagesc(img1); colormap(gray(256)); title('Original test image')

% Fill the holes and regions of the image
BinImgF = imfill(imgBin,'holes');

% Get rid of background
se = strel('square',3);
BinImgA = imopen(BinImgF,se);
BinImgB = imclose(BinImgA,se);


% Detecting total number of objects in image
figure(2)
imshow(BinImgB);
[labelImg, numOfObj] = bwlabel(double(BinImgB));

% Get the properties of measurement of image region 
measurement = regionprops(labelImg, 'Area', 'Centroid');

% Sum of coins
soc = 0;

% ================================
% Method 1 Test by (Wen Xuan Lee) 
% ================================

figure(3)
imshow(imgtest);
hold on;

% Count total sum of coind based on area 
for s = 1:size(measurement,1)
    % toc is type of cents
    toc = measurement(s).Centroid;
    A = toc(1);
    B = toc(2);
    % Shows the denomination of each coin by area
    if measurement(s).Area <= 14791 && measurement(s).Area < 15971
        text(A-60,B, '$0.05','FontSize',20)
        soc = soc + 0.05;
    elseif measurement(s).Area <= 15971 && measurement(s).Area < 21231
        text(A-30,B, '$2','FontSize',20)
        soc = soc + 2;
    elseif measurement(s).Area <= 21231 && measurement(s).Area < 23057
        text(A-60,B, '$0.10','FontSize',20)
        soc = soc + 0.10;
    elseif measurement(s).Area <= 23057 && measurement(s).Area < 30378
        text(A-60,B, '$1.00','FontSize',20)
        soc = soc + 1;
    elseif measurement(s).Area <= 30378 && measurement(s).Area < 37544
        text(A-50,B, '$0.20','FontSize',20)
        soc = soc + 0.20;
    else
        text(A-70,B, '$0.50','FontSize',20)
        soc = soc + 0.50;
    end
end
hold on;
% title shows the total sum of the coins
title(['Total sum of coins = ',num2str(soc), ' cents'])
    
% =========================
% Method 2 by (Wen Xuan Lee)
% =========================

%smoothen the image 
lpf = fspecial('gaussian',[25 25],30);
imgAA = imfilter(img1,lpf);
imgAB = imopen(imgAA,se);
imgAC = imclose(imgAB,se);
imgAD = imbinarize(imgAC);
figure(4)
imshow(imgAB); title('Gaussian blur filtered image')

imgr = imresize(img1, 0.5);
imgs = imresize(imgAD, 0.5);
% counter/totalizer coins
cc = countcoins(img1,imgAD);
figure(5)
imshow(cc);

% =============================================================
% Method 3 attempt on coin detection by radii by (Wen Xuan Lee)
% =============================================================
% fiftycent = 0;
% fivecent = 0;
% twentycent = 0;
% tencent = 0;
% adollar = 0;
% twodollar = 0;
% lvl = 0.55;
% edges = edge(img1,'canny');
% figure(11)
% imshow(edges); title('Coin edges')
% [centralA, radius1, met1] = imfindcircles(edges, [7 21]);
% [centralB, radius2, met2] = imfindcircles(edges, [22 66]);
% radiiA = [radius1; radius2];
% 
% maxradius = max(radiiA);
% rradius = radiiA/max(radiiA);
% a = 1;
% while a < length(rradius)+1
%     if rradius(a) <= 13.66
%         fivecent = fivecent+1;
%     elseif rradius(a) <= 14.82
%         twodollar = twodollar+1;
%     elseif rradius(a) <= 17.15
%         tencent = tencent + 1;
%     elseif rradius(a) <= 17.91
%             adollar = adollar + 1;
%     elseif rradius(a) <= 20.57
%         twentycent = twentycent + 1;
%     elseif rradius(a) <= 23.42
%         fiftycent = fiftycent + 1;
%     end
%     a = a + 1;
% end
% 
% sum_of_coins = fiftycent + fivecent + twentycent + tencent + adollar + twodollar;
% total_money = (fivecent*5 + twentycent*20 + tencent*10 + adollar*100 + twodollar*200 +fiftycent*50)/100;

figure(10)
subplot(2,1,1)
imagesc(img1); colormap(gray(256)); axis on; title('Grayscale coin image (dark surface)')
subplot(2,1,2)
imagesc(edges); colormap(gray(256)); axis on; title('Grayscale coin edges')

figure(12)
subplot(2,1,1)
imshow(imgBin); title('coins without imfill function');
subplot(2,1,2)
imshow(BinImgB); title('coins after imfill function');
