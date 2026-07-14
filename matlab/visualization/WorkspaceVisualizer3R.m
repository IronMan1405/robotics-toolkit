function WorkspaceVisualizer3R(DHTable, thetas, jointRanges, PlotFrames)
    arguments
        DHTable
        thetas cell
        jointRanges cell
        PlotFrames (1,1) logical = false
    end

    X = [];
    Y = [];
    Z = [];

    figure
    hold on;
    grid on;
    axis equal;
    view(3);

    PlotFrame(eye(4));
    
    theta1_range = jointRanges{1};
    theta2_range = jointRanges{2};
    theta3_range = jointRanges{3};

    for i = 1:numel(theta1_range)
        theta1 = theta1_range(i);
        for j = 1:numel(theta2_range)
            theta2 = theta2_range(j);
            for k = 1:numel(theta3_range)
                theta3 = theta3_range(k);
            
                currentAngles = {theta1, theta2, theta3};
    
                DHTable_num = double(subs(DHTable, thetas, currentAngles));
    
                [T, ~] = FK(DHTable_num);
    
                P = double(T(1:3,4));
                
                X(end+1) = P(1);
                Y(end+1) = P(2);
                Z(end+1) = P(3);
    
                if PlotFrames
                    PlotFrame(T);
                end
            end
        end
    end

    scatter3(X, Y, Z, '.');
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    title('3R Workspace');
end