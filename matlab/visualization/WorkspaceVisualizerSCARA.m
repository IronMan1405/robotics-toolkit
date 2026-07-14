function WorkspaceVisualizerSCARA(DHTable, vars, jointRanges, PlotFrames)
    arguments
        DHTable
        vars cell
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
    d3_range = jointRanges{3};

    for i = 1:numel(theta1_range)
        theta1 = theta1_range(i);
        for j = 1:numel(theta2_range)
            theta2 = theta2_range(j);
            for k = 1:numel(d3_range)
                d3 = d3_range(k);
        
                currentAngles = {theta1, theta2, d3};
    
                DHTable_num = subs(DHTable, vars, currentAngles);
    
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
    title('SCARA Workspace');
end