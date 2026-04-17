% --- MATLAB Code for Fig. 10 ---
figure('Position', [100, 100, 700, 450]);

% Create a seamlessly split layout
t = tiledlayout(1, 2, 'TileSpacing', 'none', 'Padding', 'compact');

% --- Left Side: Battery Cost ---
ax1 = nexttile;
y1 = [0.125, 0.114, 0.102, 0.090, 0.076];
b1 = bar(1:5, y1, 0.7, 'FaceColor', 'flat', 'EdgeColor', 'none');

% Define blue gradient colors
b1.CData(1,:) = [0.05, 0.25, 0.45]; % Dark blue
b1.CData(2,:) = [0.15, 0.45, 0.65];
b1.CData(3,:) = [0.35, 0.65, 0.85];
b1.CData(4,:) = [0.55, 0.75, 0.95];
b1.CData(5,:) = [0.75, 0.85, 0.95]; % Light blue

% Add data labels on top of bars
for i = 1:length(y1)
    text(i, y1(i) + 0.003, sprintf('%.3f', y1(i)), 'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'FontSize', 9);
end

% Formatting Left Axis
set(ax1, 'XTick', 1:5, 'XTickLabel', {'260', '210', '160', '110', '60'});
ylabel(ax1, 'LCOE ($/kWh)', 'FontWeight', 'bold');
xlabel(ax1, 'Cost of battery ($/kWh)', 'FontWeight', 'bold');
ylim(ax1, [0, 0.14]);
box(ax1, 'on');
set(ax1, 'LineWidth', 1.2, 'FontSize', 11);

% --- Right Side: TES Cost ---
ax2 = nexttile;
y2 = [0.107, 0.105, 0.102];
% Using 0.45 width to loosely match the visual proportion of fewer bars
b2 = bar(1:3, y2, 0.45, 'FaceColor', 'flat', 'EdgeColor', 'none'); 

% Define pink/red gradient colors
b2.CData(1,:) = [0.95, 0.65, 0.65]; % Darker pink
b2.CData(2,:) = [0.98, 0.80, 0.80]; % Medium pink
b2.CData(3,:) = [1.00, 0.90, 0.90]; % Lightest pink

% Add data labels on top of bars
for i = 1:length(y2)
    text(i, y2(i) + 0.003, sprintf('%.3f', y2(i)), 'HorizontalAlignment', 'center', 'FontWeight', 'bold', 'FontSize', 9);
end

% Formatting Right Axis
set(ax2, 'XTick', 1:3, 'XTickLabel', {'30', '20', '10'});
xlabel(ax2, 'Cost of TES ($/kWh_{th})', 'FontWeight', 'bold');
ylim(ax2, [0, 0.14]);
% Hide Y-axis tick labels to maintain the seamless layout look
set(ax2, 'YTickLabel', []); 
box(ax2, 'on');
set(ax2, 'LineWidth', 1.2, 'FontSize', 11);