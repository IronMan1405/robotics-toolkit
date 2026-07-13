function Q = IK3R(x,y,phi,l1,l2,l3)
    h = x - l3 * cos(phi);
    k = y - l3 * sin(phi);

    Q2R = IK2R(h,k,l1,l2);

    Q = zeros(size(Q2R,1), 3);

    for i = 1:size(Q2R,1)
        theta3 = phi - Q2R(i,1) - Q2R(i,2); 
        Q(i, :) = [Q2R(i,1), Q2R(i,2), theta3];
    end
end