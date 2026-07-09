function T = DH(alpha, a, d, theta)
    Rx = Transformation.rotx(alpha);
    Tx = Transformation.transx(a);
    Tz = Transformation.transz(d);
    Rz = Transformation.rotz(theta);

    T = Rz * Tz * Tx * Rx;
end