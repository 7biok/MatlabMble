load electricity.mat
revenue = price.*usage;
[X, Y] = meshgrid(yr, mth);
figure(1), surf(yr, mth, revenue)
figure(2), surf(X, Y, revenue)
figure(3), contour(X, Y, revenue, 6)