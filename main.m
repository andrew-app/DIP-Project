img = imread('images/pills1.png');

imb = imbinarize(img);

se = strel('disk', 12,0);

imbe = imerode(imb,se);


stats = regionprops('table',imbe,'Centroid',...
    'MajorAxisLength','MinorAxisLength');

centers = stats.Centroid;
diameters = mean([stats.MajorAxisLength stats.MinorAxisLength],2);
radii = diameters/2;

figure(1)
imshow(imbe)
hold on
viscircles(centers,radii);
hold off

num_circles = size(stats,1);
