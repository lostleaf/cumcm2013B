function [DF11 DF12 DF21 DF22] = difference
    [P1 P2] = readin;
    DF11 = zeros(209, 209);
    DF12 = zeros(209, 209);
    DF21 = zeros(209, 209);
    DF22 = zeros(209, 209);
    D1 = [];
    D2 = [];
    for i = 1 : 209
        D1{i} = deal_with(P1{i});
        D2{i} = deal_with(P2{i});
    end
    
    for i = 1 : 209
        for j = 1 : 209
            DF11(i, j) = calc_diff(D1{i}, D1{j});
            DF12(i, j) = calc_diff(D1{i}, D2{j});
            DF21(i, j) = calc_diff(D2{i}, D1{j});
            DF22(i, j) = calc_diff(D2{i}, D2{j});
        end
    end
end

function x = calc_diff(D1, D2)
    x = 1e10;
    for y1 = D1
        for y2 = D2
            t = mod(y2 - y1, 63);
            x = min([x t 63-t]);
        end
    end
end
