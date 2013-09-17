function DF = difference
    P = readin;
    DF = zeros(209, 209);
    D = [];
    for i = 1 : 209
        A = P{i};
        D{i} = deal_with(A);
    end
    
    for i = 1 : 209
        for j = 1 : 209
            D1 = D{i};
            D2 = D{j};
            DF(i, j) = calc_diff(D1, D2);
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
