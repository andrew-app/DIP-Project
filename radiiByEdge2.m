function [r,firstedge, secedge] = radiiByEdge2(imgcoin)

% img coin is the square image ( the detected edges ) of the original coin

edgeA = 0;
edgeB = 0;
edgem = -1;
edgen = -1;

[r,c] = size(imgcoin);

for m = 1:c
    for n = 1:r
        if imgcoin(m,n) == 1
            edgem = m;
            edgen = n;
            break;
        end
    end
    if edgen ~= -1
        break;
    end
end
while imgcoin(edgem, edgen) == 1
    edgem = edgem+1;
end

% edgeA would be the most left inner edge
edgeA = edgem - 1;

edgem = edgem + 5;

for n = (edgem):r
    imgcoin(edgem,n)
    if imgcoin(m,edgen) == 1
% edgeB would be the most right inner edge
       edgeB = m;
       break;
    end
end
r = round((edgeB - edgeA)/2);