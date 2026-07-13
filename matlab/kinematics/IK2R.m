function Q = IK2R(x,y, l1, l2)
    r = hypot(x,y);
    
    if r > l1 + l2 || r < abs(l1-l2)
        error('Position is unreachable');
    end

    cTheta2 = (r^2-l1^2-l2^2)/(2*l1*l2);
    cTheta2 = max(min(cTheta2, 1), -1);
    
    sTheta2_up = +sqrt(1-cTheta2^2);
    sTheta2_down = -sqrt(1-cTheta2^2);
    
    theta2_up = atan2(sTheta2_up, cTheta2);
    theta2_down = atan2(sTheta2_down, cTheta2);

    k1 = l1 + l2 * cos(theta2_up);
    k2_up = l2 * sin(theta2_up);
    k2_down = l2 * sin(theta2_down);

    alpha = atan2(y,x);

    theta1_up = alpha - atan2(k2_up, k1);
    theta1_down = alpha - atan2(k2_down, k1);

    Q = [theta1_up, theta2_up;
        theta1_down, theta2_down];
end