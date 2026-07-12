function [theta1,theta2,theta3] = IK3R(x,y,phi,l1,l2,l3)
    h = x - l3 * cos(phi);
    k = y - l3 * sin(phi);

    [theta1, theta2] = IK2R(h,k,l1,l2);

    theta3 = phi - theta1 - theta2;
end