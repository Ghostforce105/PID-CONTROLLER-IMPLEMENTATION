clc; clear; close all;

figure('Color','w'); hold on; grid on;

%% ================= Parameters =================
battery_costs = [110 160 210];   % three slices like figure
colors = [ ...
    0.3 0.3 0.3;      % gray
    0 0.447 0.741;    % blue
    0.85 0.33 0.1;    % orange
    0 0.5 0];         % green

labels = { ...
    'PV\_Inv', ...
    'PV\_Inv\_Battery', ...
    'PV\_Inv\_Battery\_SM\_TES\_Cycle', ...
    'PV\_Inv\_Battery\_SM\_EH\_TES\_Cycle'};

%% ================= Generate Pareto slices =================
h = gobjects(4,1); % To store handles for the legend

for k = 1:length(battery_costs)

    % LCOE sweep
    LCOE = linspace(0.06, 0.16, 60);

    % Create decreasing reliability curve (LPSP decreases as LCOE increases)
    LPSP_base = 0.75 * exp(-12 * (LCOE - 0.06));

    % Slight shift/scaling per slice for visual separation
    LPSP = LPSP_base - 0.04 * (k-1);

    % Constant battery cost plane
    COST = battery_costs(k) * ones(size(LCOE));

    % --- Plot different system segments ---
    % Segment indices (overlapping by 1 point to ensure continuity)
    idx1 = 1:12;
    idx2 = 12:35;
    idx3 = 35:50;
    idx4 = 50:60;

    % 1. PV_Inv (Top/Gray)
    p1 = plot3(LCOE(idx1), COST(idx1), LPSP(idx1), 'o-', ...
        'Color', colors(1,:), 'LineWidth', 1.5, 'MarkerSize', 4, 'MarkerFaceColor', 'none');
    
    % 2. PV_Inv_Battery (Blue)
    p2 = plot3(LCOE(idx2), COST(idx2), LPSP(idx2), 'o-', ...
        'Color', colors(2,:), 'LineWidth', 1.5, 'MarkerSize', 4, 'MarkerFaceColor', 'none');
    
    % 3. PV_Inv_Battery_SM_TES_Cycle (Orange)
    p3 = plot3(LCOE(idx3), COST(idx3), LPSP(idx3), 'o-', ...
        'Color', colors(3,:), 'LineWidth', 1.5, 'MarkerSize', 4, 'MarkerFaceColor', 'none');
    
    % 4. PV_Inv_Battery_SM_EH_TES_Cycle (Bottom/Green)
    p4 = plot3(LCOE(idx4), COST(idx4), LPSP(idx4), 'o-', ...
        'Color', colors(4,:), 'LineWidth', 1.5, 'MarkerSize', 4, 'MarkerFaceColor', 'none');

    % Capture handles from the first slice for the legend
    if k == 1
        h = [p1; p2; p3; p4];
    end
end

%% ================= Final Formatting =================
% Labels and Title
xlabel('LCOE ($/kWh)', 'FontWeight', 'bold');
ylabel('Cost of battery ($/kWh)', 'FontWeight', 'bold');
zlabel('LPSP', 'FontWeight', 'bold');
title('Pareto frontiers of different scenarios', 'FontSize', 12);

% Set view angle and axis limits
view(135, 30); % Adjusted to match the perspective in your image
xlim([0.06 0.16]);
ylim([100 210]);
zlim([0 0.8]);

% Legend (pointing to the handles captured in the loop)
legend(h, labels, 'Location', 'northeastoutside', 'FontSize', 9);

% Enhance visual look
set(gca, 'LineWidth', 1.1, 'TickDir', 'out', 'Box', 'on');