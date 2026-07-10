syms theta1 theta2 L1 L2 real

T_01 = DH(0, L1, 0, theta1);
T_12 = DH(0, L2, 0, theta2);

T_02 = simplify(T_01 * T_12)

% or by using the FK() function

DHTable = [0, L1, 0, theta1;
    0, L2, 0, theta2];

[T, Frames] = FK(DHTable);

simplify(T)