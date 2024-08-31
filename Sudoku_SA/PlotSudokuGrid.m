function PlotSudokuGrid(model)

    figure;
    axis off;
    axis equal;
    hold on;

    for i = 0:9
        if mod(i, 3) == 0
            lineWidth = 4; % debele linije
        else
            lineWidth = 2; % tanke linije
        end
        % Draw horizontal lines
        line([0, 9], [i, i], 'Color', 'b', 'LineWidth', lineWidth);
        % Draw vertical lines
        line([i, i], [0, 9], 'Color', 'b', 'LineWidth', lineWidth);
    end

    % Popunjavanje brojeva
    for row = 1:9
        for col = 1:9
            if model(row, col) ~= 0
                text(col - 0.5, 9.5 - row, num2str(model(row, col)), ...
                    'HorizontalAlignment', 'center', ...
                    'VerticalAlignment', 'middle', ...
                    'FontSize', 12);
            end
        end
    end

    xlim([0, 9]);
    ylim([0, 9]);

    hold off;
end
