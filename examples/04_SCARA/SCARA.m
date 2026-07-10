syms L1 L2 d1 d3 d4 theta1 theta2 theta4 real

T01 = DH(0,L1,d1,theta1);
T12 = DH(0,L2,0,theta2);
T23 = DH(0,0,d3,0);
T34 = DH(0,0,d4,theta4);

T04 = simplify(T01 * T12 * T23 * T34)