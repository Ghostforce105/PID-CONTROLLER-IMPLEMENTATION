% --- MATLAB Code for Fig. 11 ---
figure('Position', [150, 150, 800, 400]);

% --- Subplot (a): Effect of battery cost ---
subplot(1, 2, 1);
y_a = [0.168, 0.156, 0.143, 0.131, 0.118];
b_a = bar(1:5, y_a, 0.6, 'FaceColor', 'flat', 'EdgeColor', 'none');

% Define green gradient colors
b_a.CData(1,:) = [0.15, 0.40, 0.15]; % Dark green
b_a.CData(2,:) = [0.35, 0.55, 0.25];
b_a.CData(3,:) = [0.55, 0.85, 0.55];
b_a.CData(4,:) = [0.70, 0.90, 0.70];
b_a.CData(5,:) = [0.85, 0.95, 0.85]; % Light green

% Add data labels
for i = 1:length(y_a)
    text(i, y_a(i) + 0.004, sprintf('%.3f', y_a(i)), 'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'FontSize', 9);
end

% Formatting
set(gca, 'XTick', 1:5, 'XTickLabel', {'260', '210', '160', '110', '60'});
ylabel('LCOE ($/kWh)', 'FontWeight', 'bold');
xlabel('Cost of battery ($/kWh)', 'FontWeight', 'bold');
title('(a) Effect of battery cost on LCOE', 'FontWeight', 'normal', 'Position', [3, -0.03, 0]);
ylim([0, 0.18]);
box on;
set(gca, 'LineWidth', 1.2, 'FontSize', 11);

% --- Subplot (b): Effect of TES cost ---
subplot(1, 2, 2);
y_b = [0.168, 0.165, 0.162];
% Using 0.45 width to roughly match the visual proportion of the bars in the image
b_b = bar(1:3, y_b, 0.45, 'FaceColor', 'flat', 'EdgeColor', 'none'); 

% Define green gradient colors (matching the lighter shades from subplot a)
b_b.CData(1,:) = [0.55, 0.85, 0.55]; % Medium-light green
b_b.CData(2,:) = [0.70, 0.90, 0.70]; % Lighter green
b_b.CData(3,:) = [0.85, 0.95, 0.85]; % Lightest green

% Add data labels
for i = 1:length(y_b)
    text(i, y_b(i) + 0.004, sprintf('%.3f', y_b(i)), 'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'FontSize', 9);
end

% Formatting
set(gca, 'XTick', 1:3, 'XTickLabel', {'30', '20', '10'});
ylabel('LCOE ($/kWh)', 'FontWeight', 'bold');
% Use TeX formatting for the subscript 'th'
xlabel('Cost of TES ($/kWh_{th})', 'FontWeight', 'bold'); 
title('(b) Effect of TES cost on LCOE', 'FontWeight', 'normal', 'Position', [2, -0.03, 0]);
ylim([0, 0.18]);
box on;
set(gca, 'LineWidth', 1.2, 'FontSize', 11);