function [T, Frames] = FK(DHTable)
    T = Transformation.eye();
    Frames = cell(size(DHTable,1),1);

    for i = 1:size(DHTable, 1)
        % A = DHTable(i,1:4);
        alpha = DHTable(i,1);
        a     = DHTable(i,2);
        d     = DHTable(i,3);
        theta = DHTable(i,4);

        T = T * DH(alpha, a, d, theta);
        
        Frames{i} = T;
    end
end