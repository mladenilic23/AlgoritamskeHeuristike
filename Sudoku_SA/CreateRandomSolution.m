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

function [initialBoard, fixedCells] = CreateRandomSolution(model)

    % n = model.n;
    % 
    % sol = randperm(n);

    initialBoard = model;
    fixedCells = model ~= 0;  % Ćelije koje su već popunjene (fiksirane)
    
    for regionRow = 0:2
        for regionCol = 0:2
            rowStart = regionRow * 3 + 1;
            rowEnd = rowStart + 2;
            colStart = regionCol * 3 + 1;
            colEnd = colStart + 2;
            
            % Pronađi sve prazne ćelije u trenutnom 3x3 regionu
            emptyCells = [];
            usedNumbers = [];  % Brojevi koji su već korišćeni u regionu
            
            for i = rowStart:rowEnd
                for j = colStart:colEnd
                    if model(i, j) == 0
                        emptyCells = [emptyCells; i, j];
                    else
                        usedNumbers = [usedNumbers, model(i, j)];
                    end
                end
            end
            
            % Generiši permutaciju brojeva 1 do 9 koji nisu već korišćeni
            availableNumbers = setdiff(1:9, usedNumbers);
            permutedNumbers = availableNumbers(randperm(length(availableNumbers)));
            
            % Popuni prazne ćelije sa brojevima iz permutacije
            for k = 1:length(emptyCells)
                initialBoard(emptyCells(k, 1), emptyCells(k, 2)) = permutedNumbers(k);
            end
        end
    end

end
