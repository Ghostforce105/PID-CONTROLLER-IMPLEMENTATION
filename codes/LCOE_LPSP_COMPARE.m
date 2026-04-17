% --- MATLAB Code to recreate Figure 5 ---
figure('Position', [100, 100, 700, 500]); % Slightly wider for better scaling

% 1. Simulated Data 
Capacity_SM = linspace(1.0, 3.5, 25); 

% Mathematical approximations of the curves in the image
LCOE = 0.136 + 0.012 * (Capacity_SM - 2.05).^2; 
LPSP = 0.10 + 0.35 * exp(-1.2 * (Capacity_SM - 1)); 

% 2. Plotting Left Axis (LCOE)
yyaxis left
plot(Capacity_SM, LCOE, '-s', 'Color', 'r', 'MarkerFaceColor', 'r', ...
    'MarkerSize', 4, 'LineWidth', 1.2);
ylabel('LCOE ($/kWh)', 'FontWeight', 'bold', 'Color', 'k');
ylim([0.133, 0.162]); 
yticks(0.135:0.005:0.160);
set(gca, 'YColor', 'k'); 

% 3. Plotting Right Axis (LPSP)
yyaxis right
% Using green triangles to match the image
plot(Capacity_SM, LPSP, '-^', 'Color', [0 0.8 0], 'MarkerFaceColor', [0 0.8 0], ...
    'MarkerSize', 4, 'LineWidth', 1.2);
ylabel('LPSP', 'FontWeight', 'bold', 'Color', 'k');
ylim([0.08, 0.48]); 
yticks(0.10:0.05:0.45); % Completed the requested range
set(gca, 'YColor', 'k'); 

% 4. General Formatting
xlabel('Capacity of SM', 'FontWeight', 'bold');
set(gca, 'XTick', 1:0.5:3.5);
set(gca, 'LineWidth', 1.1, 'FontSize', 10, 'TickDir', 'in');
box on;

% 5. Legend
% Re-identifying the plot handles for a clean legend
lgd = legend('LCOE', 'LPSP', 'Location', 'northeast');
set(lgd, 'FontSize', 9);

% Final touch to ensure axes look like the image
grid on;