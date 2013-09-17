function [LR, UD] = similar 
    A = readin;

    LR = zeros(209,209);
    UD = zeros(209,209);
    for i = 1:209
        for j = 1:209
            if i ~= j
                LR(i,j) = sim_lr(A{i}, A{j});
                UD(i,j) = sim_ud(A{i}, A{j});
            end
        end
    end

end

function [result, tot] = calc_sim(A, B)
    tot = 0;
    hit = 0;
    for i = 1:length(A)
        if A(i) < 255
            tot = tot + 1;
            if ((B(i) < 255) || ( i-1 > 0 && B(i-1)<255 ) || ( i+1 <= length(A) && B(i+1)<255 ))
                hit = hit + 1;
            end
        end
    end
    if tot == 0
        result = 0;
    else
        result = hit/tot;
    end
end


function result = sim_lr(A, B)
    [result1, w1] = calc_sim(A(:, 72), B(:, 1));
    [result2, w2] = calc_sim(B(:, 1), A(:, 72));

    if(w1+w2==0)
        result = 0;
    else
        result = (result1*w1 + result2*w2) / (w1+w2);
    end
    
    %result = result1;
end

function result = sim_ud(A, B)
    [result1, w1] = calc_sim(A(180, :), B(1, :));
    [result2, w2] = calc_sim(B(1, :), A(180, :));

    if(w1+w2==0)
        result = 0;
    else
        result = (result1*w1 + result2*w2) / (w1+w2);
    end
end
