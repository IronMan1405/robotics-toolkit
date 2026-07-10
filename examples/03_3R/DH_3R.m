syms theta1 theta2 theta3 L1 L2 L3 real

T_01 = DH(0, L1, 0, theta1);
T_12 = DH(0, L2, 0, theta2);
T_23 = DH(0, L3, 0, theta3);

T_03 = simplify(T_01 * T_12 * T_23)

% or by using the FK() function

DHTable = [0, L1, 0, theta1;
    0, L2, 0, theta2;
    0, L3, 0, theta3];

[T, Frames] = FK(DHTable);

simplify(T)