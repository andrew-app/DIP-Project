img = imread('coins2.jpg');

img = imresize(img,0.1);
img = rgb2gray(img);

[centers, radii, metric] = imfindcircles(img,[10 30]);

radius = round(radii,2);

radius = sort(radius);
 

coins = ["5c";"2d";"10c";"1d";"20c";"50c"];

coins = [coins radius];

figure(1)
imshow(img)
for i = 1:6
    viscircles(centers(i,:), radii(i),'EdgeColor','b');
end