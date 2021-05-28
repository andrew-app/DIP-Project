% ==================
% by (Wen Xuan Lee)
% ==================
function [mark] = scanmore(X,m,n,radii)

% The input arguments:
% X is the image's edges
% m,n is the location of test
% radii to locate for which type of coin

value = 0;
size = length(X);
r1 = 1;

% look at 30 Degree
x1 = round(radii/2);
y1 = round(radii*sqrt(3)/2);

% Check direction of NORTHEAST
if ((m>y1+r1) & (n<=size-x1-r1) & (max(X(m-y1-r1:m-y1+r1,n+x1+r1:-1:n+x1-r1)==1)==1))
    value = value + 1;
end
% Check direction of SOUTHEAST
if ((m<=size-y1-r1) & (n<=size-x1-r1) & (max(X(m+y1-r1:m+y1+r1,n+x1-r1:n+x1+r1)==1)==1))
    value = value + 1;
end
% Check direction of NORTHWEST
if ((m>y1+r1) & (n>x1+r1) & (max(X(m-y1-r1:m-y1+r1,n-x1-r1:n-x1+r1)==1)==1))
    value = value + 1;
end
% Check direction of SOUTHWEST
if ((m<=size-y1-r1) & (n>x1+r1) & (max(X(m+y1-r1:m+y1+r1,n-x1+r1:-1:n-x1-r1)==1)==1))
    value = value + 1;
end

% look at 60 Degree
x1 = round(radii/2);
y1 = round(radii*sqrt(3)/2);

% Check direction of NORTHEAST
if ((m>y1+r1) & (n<=size-x1-r1) & (max(X(m-y1-r1:m-y1+r1,n+x1+r1:-1:n+x1-r1)==1)==1))
    value = value + 1;
end
% Check direction of SOUTHEAST
if ((m<=size-y1-r1) & (n<=size-x1-r1) & (max(X(m+y1-r1:m+y1+r1,n+x1-r1:n+x1+r1)==1)==1))
    value = value + 1;
end
% Check direction of NORTHWEST
if ((m>y1+r1) & (n>x1+r1) & (max(X(m-y1-r1:m-y1+r1,n-x1-r1:n-x1+r1)==1)==1))
    value = value + 1;
end
% Check direction of SOUTHWEST
if ((m<=size-y1-r1) & (n>x1+r1) & (max(X(m+y1-r1:m+y1+r1,n-x1+r1:-1:n-x1-r1)==1)==1))
    value = value + 1;
end

mark = value;