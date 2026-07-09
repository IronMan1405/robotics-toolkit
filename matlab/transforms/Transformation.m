classdef Transformation
    methods (Static)
        function T = rotx(theta)
            T = [1, 0, 0, 0; 
                0, cos(theta), -sin(theta), 0; 
                0, sin(theta), cos(theta), 0;
                0, 0, 0, 1];
        end

        function T = roty(theta)
            T = [cos(theta), 0, sin(theta), 0;
                0, 1, 0, 0;
                -sin(theta), 0, cos(theta), 0;
                0, 0, 0, 1];
        end

        function T = rotz(theta)
            T = [cos(theta), -sin(theta), 0, 0; 
                sin(theta), cos(theta), 0, 0; 
                0, 0, 1, 0;
                0, 0, 0, 1];
        end

        function T = transx(d)
            T = [1, 0, 0, d;
                0, 1, 0, 0;
                0, 0, 1, 0;
                0, 0, 0, 1];
        end

        function T = transy(d)
            T = [1, 0, 0, 0;
                0, 1, 0, d;
                0, 0, 1, 0;
                0, 0, 0, 1];
        end

        function T = transz(d)
            T = [1, 0, 0, 0;
                0, 1, 0, 0;
                0, 0, 1, d;
                0, 0, 0, 1];
        end

        function T = trans(qx, qy, qz)
            T = [1, 0, 0, qx;
                0, 1, 0, qy;
                0, 0, 1, qz;
                0, 0, 0, 1];
        end

        function T = eye()
            T = eye(4);
        end
    end
end