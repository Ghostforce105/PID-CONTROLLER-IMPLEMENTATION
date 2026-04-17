% --- MATLAB Code to recreate Figure 7 ---
figure('Position', [100, 100, 800, 500]);

% 1. Simulated Data 
% Generating data points between 1 and 49 to match the markers in the image
Capacity_TES = 1:2:49; 

% Mathematical approximations of the specific curves in Fig 7
LCOE = 0.16 * exp(-0.18 * Capacity_TES) + 0.122 + 0.0008 * Capacity_TES; 
LPSP = 0.62 * exp(-0.10 * Capacity_TES) + 0.08; 

% 2. Plotting Left Axis (LCOE)
yyaxis left
plot(Capacity_TES, LCOE, '-s', 'Color', 'r', 'MarkerFaceColor', 'r', ...
    'MarkerSize', 5, 'LineWidth', 1.2);
ylabel('LCOE ($/kWh)', 'FontWeight', 'bold', 'Color', 'k');
ylim([0.12, 0.30]); 
yticks(0.12:0.02:0.30);
set(gca, 'YColor', 'k'); 

% 3. Plotting Right Axis (LPSP)
yyaxis right
% MarkerFaceColor changed to 'b' to match the blue triangles in your image
plot(Capacity_TES, LPSP, '-^', 'Color', 'b', 'MarkerFaceColor', 'b', ...
    'MarkerSize', 5, 'LineWidth', 1.2); 
ylabel('LPSP', 'FontWeight', 'bold', 'Color', 'k');
ylim([0, 0.7]); 
yticks(0:0.1:0.7);
set(gca, 'YColor', 'k'); 

% 4. General Formatting
xlabel('Capacity of TES (h)', 'FontWeight', 'bold');
xlim([0, 50]);
set(gca, 'XTick', 0:10:50);
set(gca, 'LineWidth', 1.1, 'FontSize', 10, 'TickDir', 'in');
box on;

% 5. Legend
lgd = legend('LCOE', 'LPSP', 'Location', 'northeast');
set(lgd, 'FontSize', 9);

% Ensuring the layout is clean
grid on;