function X = blank_diff
    X = zeros(209, 209);
    A = readin;
    for i = 1:209
        for j = 1:209
            X(i, j) = sum(abs(blank(A{i})-blank(A{j})));
        end
    end
end