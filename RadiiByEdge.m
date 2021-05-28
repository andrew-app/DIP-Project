% =================
% by (Wen Xuan Lee)
% =================
function [r,firstedge, secedge] = RadiiByEdge(imgcoin)

% img coin is the square image ( the detected edges ) of the original coin

edgeA = 0;
edgeB = 0;
edgem = -1;
edgen = -1;

[r,c] = size(imgcoin);

for n = 1:c
    for m = 1:r
        if imgcoin(m,n) == 1
            edgem = m;
            edgen = n;
            break;
        end
    end
    if edgem ~= -1
        break;
    end
end
while imgcoin(edgem, edgen) == 1
    edgen = edgen+1;
end

% edgeA would be the most left inner edge
edgeA = edgen - 1;

for n = (edgen):c
    imgcoin(edgem,n)
    if imgcoin(edgem,n) == 1
% edgeB would be the most right inner edge
       edgeB = n;
       break;
    end
end
r = round((edgeB - edgeA)/2);