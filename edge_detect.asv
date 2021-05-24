img = imread('images/coins2.jpg');

img = imresize(img,0.1);
img = rgb2gray(img);

load('coins.mat')
lpf = fspecial('gaussian', [12,12],4);



blur = imfilter(img,lpf);



bw = imbinarize(blur);

bwe = edge(bw,'Canny');


radius = str2double(coins(6,2));

diameter = radius*2;

figure(1)
imshow(bwe)

for i = radius:radius:size(bwe,2)
    for j = radius:radius:size(bwe,1)
        a = [i,j];
        viscircles(a,radius ,'EdgeColor','b');
    end
    
end



T = 0.35; %pixel number threshold

