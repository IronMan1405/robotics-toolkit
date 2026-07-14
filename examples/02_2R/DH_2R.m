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

% analytical IK
x = 0.1;
y = 0.1;
l1 = 0.3;
l2 = 0.2;

Q = IK2R(x,y,l1,l2);

for i = 1:size(Q,1)
    theta1_sol = Q(i,1)
    theta2_sol = Q(i,2)

    DHTable_num = [
        0, l1, 0, theta1_sol;
        0, l2, 0, theta2_sol;
    ];

    % verification using generic FK
    [T_verify, ~] = FK(DHTable_num);
    disp(T_verify(1:3,4))

    % verification using symbolic substitution
    T_num = subs(T_02, {theta1, theta2, L1, L2}, {theta1_sol, theta2_sol, l1, l2});
    T_num = double(T_num)

    P_fk = T_verify(1:3,4)
    P_sym = T_num(1:3,4)
    
    disp(norm(P_fk - P_sym))
end

% Visualize workspace by scattering end effector points across every
% combination of joint angles across their limits

thetas = {theta1, theta2};
jointRanges = {linspace(-pi/2, pi/2, 100), linspace(-pi, pi, 100)};

DHTable_num = subs(DHTable, {L1, L2}, {l1, l2});

WorkspaceVisualizer2R(DHTable_num, thetas, jointRanges);
