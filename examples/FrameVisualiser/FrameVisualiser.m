T = Transformation.trans(0.1, 0.2, 0.3) * Transformation.rotx(pi/4);

xAxis = T(1:3, 1);
yAxis = T(1:3, 2);
zAxis = T(1:3, 3);

newOrg = T(1:3,4);

origin = [0;0;0];

A = [1, 0, 0, 0;
    0, 1, 0, 0;
    0, 0, 1, 0;
    0, 0, 0, 1];


figure;
grid on;
axis equal;
view(3);

PlotFrame(A);
PlotFrame(T);