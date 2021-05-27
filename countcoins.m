% =============================================================
% Countcoins implements edge detection on medianfiltered image
% Then count the coins in image.
% =============================================================

function [counter, a, b, c, d, e, f, a1, b2, c3, d4, e5 ,f6] = countcoins(original, smoothd)

% edge detection through gradient process
X = edge(smoothd,'canny');
figure(1); colormap(gray(256)); imagesc(X);
title('Matlab''s canny edge detection')

% matrices of square
cs = 0; % accumulation sum
size = length(X);
threshold = 10; % once threshold reaches 8 then approve as a coin

% Initialize raddi for the variety of coins
radii_a = 13.66; % radius of 5 cents
radii_b = 14.82; % radius of 2 dollars
radii_c = 17.15; % radius of 10 cents
radii_d = 17.91; % radius of a dollar
radii_e = 20.57; % radius of 20 cents
radii_f = 23.42; % radius of 50 cents

a = 0;
b = 0;
c = 0;
d = 0;
e = 0;
f = 0;
a1 = [];
b2 = [];
c3 = [];
d4 = [];
e5 = [];
f6 = [];

for m = 1:size
    for n = 1:size
        % =========================================
        % Check if pixel belong to 5 cent's centre
        % =========================================
        mark_a = mark_central(X,m,n,radii_a);
        a1(m,n) = mark_a;
        if (mark_a >= 6)
            mark_a = mark_a + scanmore(X,m,n,radii_a);
            a1(m,n) = mark_a;
        end
        % =========================================
        % Check if pixel belong to 2 dollar centre
        % =========================================
        mark_b = mark_central(X,m,n,radii_b);
        b2(m,n) = mark_b;
        if (mark_b >= 6)
            mark_b = mark_b + scanmore(X,m,n,radii_b);
            b2(m,n) = mark_b;
        end
        % =========================================
        % Check if pixel belong to 10 cents centre
        % =========================================
        mark_c = mark_central(X,m,n,radii_c);
        c3(m,n) = mark_c;
        if (mark_c >= 6)
            mark_c = mark_c + scanmore(X,m,n,radii_c);
            c3(m,n) = mark_c;
        end
        % =========================================
        % Check if pixel belong to 1 dollar centre
        % =========================================
        mark_d = mark_central(X,m,n,radii_d);
        d4(m,n) = mark_d;
        if (mark_d >= 6)
            mark_d = mark_d + scanmore(X,m,n,radii_d);
            d4(m,n) = mark_d;
        end
        % =========================================
        % Check if pixel belong to 20 cents centre
        % =========================================
        mark_e = mark_central(X,m,n,radii_e);
        e5(m,n) = mark_e;
        if (mark_e >= 6)
            mark_e = mark_e + scanmore(X,m,n,radii_e);
            e5(m,n) = mark_e;
        end
        % =========================================
        % Check if pixel belong to 50 cents centre
        % =========================================
        mark_f = mark_central(X,m,n,radii_f);
        f6(m,n) = mark_f;
        if (mark_f >= 6)
            mark_f = mark_f + scanmore(X,m,n,radii_f);
            f6(m,n) = mark_f;
        end
    end
end

for m = 1:size
    for n = 1:size
        if (a1(m,n) >= threshold & scanaround(a1,m,n,threshold)==1)
            cs = cs + 0.05;
            a = a + 1;
        end
        if (b2(m,n) >= threshold & scanaround(b2,m,n,threshold)==1)
            cs = cs + 2;
            b = b + 1;
        end
        if (c3(m,n) >= threshold & scanaround(c3,m,n,threshold)==1)
            cs = cs + 0.10;
            c = c + 1;
        end
        if (d4(m,n) >= threshold & scanaround(d4,m,n,threshold)==1)
            cs = cs + 1.00;
            d = d + 1;
        end
        if (e5(m,n) >= threshold & scanaround(e5,m,n,threshold)==1)
            cs = cs + 0.20;
            e = e + 1;
        end
        if (f6(m,n) >= threshold & scanaround(f6,m,n,threshold)==1)
            cs = cs + 0.50;
            f = f + 1;
        end
    end
end
            
        