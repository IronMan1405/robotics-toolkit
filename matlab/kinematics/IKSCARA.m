function Q = IKSCARA(x, y, z, phi, l1, l2, d1, d4)
    Q2R = IK2R(x, y, l1, l2);

    Q = zeros(size(Q2R,1), 4);

    for i = 1:size(Q2R,1)
        theta4 = phi - Q2R(i,1) - Q2R(i,2);
        d3 = z-d1-d4;
        Q(i, :) = [Q2R(i,1), Q2R(i,2), theta4, d3];
    end
end