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

clc;
clear;
close all;

%% Problem Definition

model = CreateModel('L2.txt');    % Create Problem Model
CostFunction =  SudokuCost(model);    % Cost Function

PlotSudokuGrid(model);

%% SA Parameters

MaxIt = 350;      % Maximum Number of Iterations

MaxSubIt = 20;    % Maximum Number of Sub-iterations

T0 = 0.04;       % Initial Temp. default T0 = 0.025

alpha = 0.99;     % Temp. Reduction Rate

%% Initialization

% Create and Evaluate Initial Solution
[sol.model, sol.fixedCells] = CreateRandomSolution(model);
sol.Cost = SudokuCost(sol.model);

% Initialize Best Solution Ever Found
BestSol = sol;

% Array to Hold Best Cost Values
BestCost = zeros(MaxIt, 1);

% Intialize Temp.
T = T0;

%% SA Main Loop

for it = 1:MaxIt
    
    for subit = 1:MaxSubIt
        
        % Create and Evaluate New Solution
        newsol.model = CreateNeighbor(sol.model, sol.fixedCells);
        newsol.Cost = SudokuCost(newsol.model);

        newsol.fixedCells = sol.fixedCells;

        if newsol.Cost <= sol.Cost % If NEWSOL is better than SOL
            sol = newsol;
            
        else % If NEWSOL is NOT better than SOL
            
            DELTA = (newsol.Cost-sol.Cost)/sol.Cost;
            
            P = exp(-DELTA/T); % verovatnoca prihvatanja losijeg resenja
            if rand <= P       %prihvatanje losijeg resenja sa odredjenom verovatnocom
                sol = newsol;
            end
            
        end
        
        % Update Best Solution Ever Found
        if sol.Cost <= BestSol.Cost
            BestSol = sol;
        end
    
    end
    
    % Store Best Cost Ever Found
    BestCost(it) = BestSol.Cost;
    
    % Display Iteration Information
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
    
    % Update Temp.
    T = alpha*T; %smanjivanje
    
    if BestCost(it) == 0
        PlotSudokuGrid(BestSol.model);
        break;
    end
    
end
