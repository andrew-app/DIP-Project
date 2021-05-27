% To find and mark as centre
function [mark] = central(X,m,n,radii)

% The input arguments:
% X is the image's edges
% m,n is the location of test
% radii to locate for which type of coin

value = 0;
size = length(X);
r1 = 1;
r2 = 1;

% check position UP
if ((m > radii + r1) && (max(X(m-radii-r1:m-radii+r2,n) == 1)==1))
    value = value + 1;
end
% check position DOWN
if ((m <= size-radii-r2) && (max(X(m+radii-r1:m+radii+r2,n) == 1)==1))
    value = value + 1;
end
% check position LEFT
if ((n > radii + r1) && (max(X(m,n-radii-r1:n-radii+r2) == 1)==1))
    value = value + 1;
end
% check position RIGHT
if ((n <= size-radii-r2) && (max(X(m,n+radii-r1:n+radii+r2) == 1)==1))
    value = value + 1;
end

% When there is no mark yet, then abort
if (value ~= 0)
    diagonal = round(radii/sqrt(2));
    
    % Check direction of NORTHEAST
    if((m>diagonal+r1) && (n<=size-diagonal-r1) && (max(X(m-diagonal-r1:m-diagonal+r1,n+diagonal+r1:-1:n+diagonal-r1)==1)==1))
        value = value + 1;
    end
    % Check direction of SOUTHEAST
    if((m<=size-diagonal-r1) && (n<=size-diagonal-r1) && (max(X(m+diagonal-r1:m+diagonal+r1,n+diagonal-r1:n+diagonal+r1)==1)==1))
        value = value + 1;
    end
    % Check direction of NORTHWEST
    if((m>diagonal+r1) && (n>diagonal+r1) && (max(X(m-diagonal-r1:m-diagonal+r1,n-diagonal-r1:n-diagonal+r1)==1)==1))
        value = value + 1;
    end
    % Check direction of SOUTHWEST
    if((m<=size-diagonal-r1) && (n>diagonal+r1) && (max(X(m+diagonal-r1:m+diagonal+r1,n-diagonal+r1:-1:n-diagonal-r1)==1)==1))
        value = value + 1;
    end
end

  mark = value;