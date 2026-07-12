syms L1 L2 d1 d3 d4 theta1 theta2 theta4 real

T01 = DH(0,L1,d1,theta1);
T12 = DH(0,L2,0,theta2);
T23 = DH(0,0,d3,0);
T34 = DH(0,0,d4,theta4);

T04 = simplify(T01 * T12 * T23 * T34)

% or by using the FK() function

DHTable = [0, L1, d1, theta1;
    0, L2, 0, theta2;
    0, 0, d3, 0;
    0, 0, d4, theta4];

[T, Frames] = FK(DHTable);

simplify(T)

% and plot each frame

values = {theta1, theta2, theta4, d1, d3, d4, L1, L2};
nums   = {pi/4, pi/6, pi/3, 0.1, 0.05, 0.07,  0.1, 0.1};

figure;
hold on;
grid on;
axis equal;
view(3);

PlotFrame(eye(4));

for i = 1:numel(Frames)
    PlotFrame(double(subs(Frames{i}, values, nums)));
end

% analytical IK
l1 = 0.30;
l2 = 0.20;

d1_val = 0.40;
d4_val = 0.05;

x   = 0.35;
y   = 0.25;
z   = 0.30;
phi = pi/6;

[theta1_sol, theta2_sol, theta4_sol, d3_sol] = IKSCARA(x, y, z, phi, l1, l2, d1_val, d4_val)

params = {theta1, theta2, theta4, d3};
sols = {theta1_sol, theta2_sol, theta4_sol, d3_sol};

DHTable_num = [0, l1, d1_val, theta1_sol;
    0, l2, 0, theta2_sol;
    0, 0, d3_sol, 0;
    0, 0, d4_val, theta4_sol];

% verification using generic FK

[T_verify, ~] = FK(DHTable_num);

disp(T_verify(1:3,4))

% verification using symbolic substitution

T_num = subs(T04, {theta1, theta2, theta4, L1, L2, d1, d3, d4}, {theta1_sol, theta2_sol, theta4_sol, l1, l2, d1_val, d3_sol, d4_val});

T_num = double(T_num)