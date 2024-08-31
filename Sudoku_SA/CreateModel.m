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

function model = CreateModel(filename)

    % Open the file
    fileID = fopen(filename, 'r');
    
    % Initialize a 9x9 matrix with zeros
    model = zeros(9, 9);
    
    % Read the file line by line
    for row = 1:9
        % Get the current line as a string
        currentLine = fgetl(fileID);
        
        % Convert the string to numbers and store in the matrix
        for col = 1:9
            model(row, col) = str2double(currentLine(col));
        end
    end
    
    % Close the file
    fclose(fileID);
    
end

