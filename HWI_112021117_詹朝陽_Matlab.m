%HWI_112021117_詹朝陽




%Excercise1
clear; clc; format long g;
% Recursive Erlang-B calculation
function B = erlangB(rho, m)
    if rho <= 0
        B = (m == 0);
        return;
    end
    invB = 1.0;
    for k = 1:m
        invB = 1.0 + (k / rho) * invB;
    end
    B = 1.0 / invB;
end

% Set channel number range (1~20 and 200~220)
m_range = [1:20, 200:220]; 
blocking_rates = [0.01, 0.03, 0.05, 0.10];

% Loop through each channel number and solve for offered traffic rho

fprintf('Channel (m) | 1%% Blocking  | 3%% Blocking  | 5%% Blocking  | 10%% Blocking\n');

for i = 1:length(m_range)
    m = m_range(i);
    
    rho_1  = fzero(@(rho) erlangB(rho, m) - 0.01, [0, max(1, m * 10)]); 
    rho_3  = fzero(@(rho) erlangB(rho, m) - 0.03, [0, max(1, m * 10)]); 
    rho_5  = fzero(@(rho) erlangB(rho, m) - 0.05, [0, max(1, m * 10)]); 
    rho_10 = fzero(@(rho) erlangB(rho, m) - 0.10, [0, max(1, m * 10)]); 
    
    % Print results in table format
    fprintf('%11d | %12.4f | %12.4f | %12.4f | %12.4f\n', ...
        m, rho_1, rho_3, rho_5, rho_10);
end







%Excercise3
clear; clc; format long g;
% Recursive Erlang-B calculation
function B = erlangB(rho, m)
    if rho <= 0
        B = (m == 0);
        return;
    end
    invB = 1.0;
    for k = 1:m
        invB = 1.0 + (k / rho) * invB;
    end
    B = 1.0 / invB;
end


fprintf('Operators | Channels/Cell (C_cell) | 1%% Blocking | 3%% Blocking | 5%% Blocking | 10%% Blocking\n');

operators = [1, 2, 3];
N = 5;

for i = 1:length(operators)
    op = operators(i);

    C_cell = (600 / op) / N; 
    
    rho_1  = fzero(@(rho) erlangB(rho, C_cell) - 0.01, [0, max(1, C_cell * 10)]);
    rho_3  = fzero(@(rho) erlangB(rho, C_cell) - 0.03, [0, max(1, C_cell * 10)]);
    rho_5  = fzero(@(rho) erlangB(rho, C_cell) - 0.05, [0, max(1, C_cell * 10)]);
    rho_10 = fzero(@(rho) erlangB(rho, C_cell) - 0.10, [0, max(1, C_cell * 10)]);
    
    fprintf('%9d | %20.2f | %12.4f | %12.4f | %12.4f | %12.4f\n', ...
        op, C_cell, rho_1, rho_3, rho_5, rho_10);
end






















