function [theta1, theta2] = IK2R(x,y, l1, l2)
    r = sqrt(x^2 + y^2);
    
    if r > l1 + l2 || r < abs(l1-l2)
        error('Position is unreachable');
    end

    cTheta2 = (r^2-l1^2-l2^2)/(2*l1*l2);
    cTheta2 = max(min(cTheta2, 1), -1);
    sTheta2 = sqrt(1-cTheta2^2);
    theta2 = atan2(sTheta2, cTheta2);

    k1 = l1 + l2 * cos(theta2);
    k2 = l2 * sin(theta2);
    theta1 = atan2(y, x) - atan2(k2, k1);
end