function [bool] = scanaround(X,m,n,thrs)
if ((max(max(X(m-4:m-1,n-4:n+4) >= thrs)) == 1) || (max(X(m, n-4:n-1) >= thrs) == 1))
    bool = 0;
else
    bool = 1;
end