syms theta1 theta2 L1 L2 real

T_01 = DH(0, L1, 0, theta1);
T_12 = DH(0, L2, 0, theta2);

T_02 = simplify(T_01 * T_12)

% or by using the FK() function

DHTable = [0, L1, 0, theta1;
    0, L2, 0, theta2];

[T, Frames] = FK(DHTable);

simplify(T)

% and plot each frame
%dont forget to assign values to the syms using subs or just directly
%assign values

values = {theta1, theta2, L1, L2};
nums   = {pi/4, pi/6, 0.1, 0.15};

figure;
hold on;
grid on;
axis equal;
view(3);

PlotFrame(eye(4));

for i = 1:numel(Frames)
    PlotFrame(double(subs(Frames{i}, values, nums)));
end