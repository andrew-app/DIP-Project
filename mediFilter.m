% ===========================================================
% Attempt to perform median filter function by (Wen Xuan Lee)
% ===========================================================
function [smooths] = mediFilter(img,fsize)
size = length(img);
begin = round(fsize/2);
init = begin - 1;

for m = begin:size-begin
    for n = begin:size-begin
        smooths(m-begin+1, n-begin+1) = median(median(img(m-init:m+init,n-init:n+init)));
    end
end