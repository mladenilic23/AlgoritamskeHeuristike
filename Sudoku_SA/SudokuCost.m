%
% Copyright (c) 2015, Mostapha Kalami Heris & Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "LICENSE" file for license terms.
%
% Project Code: YPEA105
% Project Title: Simulated Annealing for Traveling Salesman Problem
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Cite as:
% Mostapha Kalami Heris, Simulated Annealing in MATLAB (URL: https://yarpiz.com/223/ypea105-simulated-annealing), Yarpiz, 2015.
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

function cost = SudokuCost(model)

    % n = numel(tour);
    % 
    % tour = [tour tour(1)];
    % 
    % L = 0;
    % 
    % for k = 1:n
    % 
    %     i = tour(k);
    %     j = tour(k+1);
    % 
    %     L = L+model.d(i, j);
    % 
    % end

    cost = 0;
    
    % Check rows
    for i = 1:9
        row = model(i, :);
        missingInRow = 9 - numel(unique(row(row > 0)));
        cost = cost + missingInRow;
    end
    
    % Check columns
    for j = 1:9
        col = model(:, j);
        missingInCol = 9 - numel(unique(col(col > 0)));
        cost = cost + missingInCol;
    end

end

