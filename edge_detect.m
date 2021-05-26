img = imread('images/coins2.jpg');

img = imresize(img,0.1);
img = rgb2gray(img);

load('coins.mat')
lpf = fspecial('gaussian', [12,12],4);


blur = imfilter(img,lpf);



bwe = edge(blur,'Canny');

radius = 14;



figure(1)
imshow(bwe)

coin = zeros(2,16);


for a = 1:16
    radius = 9 + a;
    toc = 0;

    for i = radius:radius:size(bwe,1)
        for j = radius:radius:size(bwe,2)
            myImage = zeros(size(bwe,1), size(bwe,2),'logical');
            xCenter = j;
            yCenter = i;

            theta = linspace(0, 2*pi, round(4 * pi * radius)); 

            x = radius * cos(theta) + xCenter;
            y = radius * sin(theta) + yCenter;



            for k = 1:length(x)
                row = round(y(1,k));
                col = round(x(1,k));
                if col == 0
                    col = 1;
                end
    
                if row == 0
                    row = 1; 
                end
                myImage(row,col) = 1;
                cmp = zeros(size(bwe,1), size(bwe,2),'logical');
                for l = 1:size(bwe,1)
                    for m = 1:size(bwe,2)
                        cmp(l,m) = bitand(bwe(l,m),myImage(l,m));
                    
                    end
                end
            
                total = nnz(cmp);
                if total >= 15
                    toc = toc + 1;
                end
                
                if toc == 6
                    coin(1,a) = radius;
                    coin(2,a) = toc;
                    return
                end
            
            end
        end
    end
    
    coin(1,a) = radius;
    coin(2,a) = toc;
    
     
end

figure(2)
imshow(myImage);
