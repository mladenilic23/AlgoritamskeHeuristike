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

function [newBoard] = CreateNeighbor(model, fixedCells)

    newBoard = model;
    
    % Pronađi sve ne-fiksirane ćelije
    [rows, cols] = find(~fixedCells);
    
    % Pseudo-slučajno izaberi prvu ne-fiksiranu ćeliju
    idx1 = randi(length(rows));
    row1 = rows(idx1);
    col1 = cols(idx1);
    
    % Pronađi 3x3 region kojem pripada prva ćelija
    regionRow = floor((row1 - 1) / 3);
    regionCol = floor((col1 - 1) / 3);
    
    % Pronađi sve ne-fiksirane ćelije u istom 3x3 regionu
    regionRows = regionRow * 3 + 1 : regionRow * 3 + 3;
    regionCols = regionCol * 3 + 1 : regionCol * 3 + 3;
    
    nonFixedCellsInRegion = [];
    for i = regionRows
        for j = regionCols
            if ~fixedCells(i, j)
                nonFixedCellsInRegion = [nonFixedCellsInRegion; i, j];
            end
        end
    end
    
    % Ukloni prvu ćeliju iz liste kako bi se osiguralo da se druga ćelija razlikuje
    nonFixedCellsInRegion(ismember(nonFixedCellsInRegion, [row1, col1], 'rows'), :) = [];
    
    % Pseudo-slučajno izaberi drugu ne-fiksiranu ćeliju u istom regionu
    idx2 = randi(size(nonFixedCellsInRegion, 1));
    row2 = nonFixedCellsInRegion(idx2, 1);
    col2 = nonFixedCellsInRegion(idx2, 2);
    
    % Zameni vrednosti dveju ćelija
    temp = newBoard(row1, col1);
    newBoard(row1, col1) = newBoard(row2, col2);
    newBoard(row2, col2) = temp;
end
