function [theta1, theta2, theta4, d3] = IKSCARA(x, y, z, phi, l1, l2, d1, d4)
    [theta1, theta2] = IK2R(x, y, l1, l2);
    theta4 = phi - theta1 - theta2;
    d3 = z-d1-d4;
end