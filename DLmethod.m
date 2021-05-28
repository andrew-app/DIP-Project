
myFolder = '/home/andrewapp/Documents/dataset/';
filePattern = fullfile(myFolder, '*.jpg'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
    disp(k)
    baseFileName = theFiles(k).name;
    fullFileName = fullfile(theFiles(k).folder, baseFileName);
    img = imread(fullFileName);
    
    img = imresize(img,0.10);
    
    imwrite(img,fullFileName);
    

    imshow(img);  % Display image.
    drawnow; % Force display to update immediately.
end



