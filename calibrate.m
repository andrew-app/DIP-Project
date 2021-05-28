

c = containers.Map;
c('five') = imread('cal_images/5c.jpg');
c('ten') = imread('cal_images/10c.jpg');
c('twenty') = imread('cal_images/20c.jpg');
c('fifty') = imread('cal_images/50c.jpg');
c('one') = imread('cal_images/1d.jpg');
c('two') = imread('cal_images/2d.jpg');

imgs = values(c);

coins = zeros(1,6);

for i = 1:6
    img = imgs{i};
    
    img = imresize(img,0.2);
    
    lp = fspecial('gaussian', [12,12],4);

    img = imfilter(img,lp);
    
    img = rgb2gray(img);
    
    imgBin = imbinarize(img);


    [labelImg, numOfObj] = bwlabel(imgBin);

    % Get the properties of measurement of image region 
    measurement = regionprops(labelImg, 'Area', 'Centroid');
    
    coins(i) = measurement.Area;
    

end

coins = sort(coins);

save('coins.mat','coins')





