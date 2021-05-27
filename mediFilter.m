function [smooth] = mediFilter(img,fsize)
size = length(img);
begin = round(fsize/2);
init = begin - 1;

for m = begin:size-begin
    for n = begin:size-start
        smooth(m - begin+1, n-begin+1) = median(median(img(m-init:m+init,n-init:n+init)));
    end
end