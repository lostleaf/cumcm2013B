function T = a 
    A=[];
    for i = 0:18
        A{i+1} = imread(num2str(i,'%03d.bmp'));
    end

    B = zeros(19,19);
    for i = 1:19
        for j = 1:19
            if i ~= j
                B(i,j) = sim(A{i}, A{j});
            end
        end
    end

    C = zeros(1,19);
    for i = 1:19
        m = max(B(i,:));
        t = find(B(i,:)==m);
        [t1, t2] = size(t);
        if t2 > 1
            C(i) = 0;
        else
            C(i) = t;
        end
    end
    
    t = 0;
    T = [];
    TT = [];
    for i = 1:19
        [tt, t] = find(C == t);
        T = [A{t}, T];
        TT = [t TT];
    end
    imwrite(T, 'a.bmp');
    imshow(T);
    csvwrite('order_1.txt',TT);
end

function result = sim(A, B)
    tot = 0;
    hit = 0;
    for i = 1:1980
        if A(i,72) < 255
            tot = tot + 1;
            if B(i,1) < 255
                hit = hit + 1;
            end
        end
    end
    if tot == 0
        result1 = 0;
    else
        result1 = hit/tot;
    end

    tot = 0;
    hit = 0;
    for i = 1:1980
        if B(i,1) < 255
            tot = tot + 1;
            if A(i,72) < 255
                hit = hit + 1;
            end
        end
    end
    if tot == 0
        result2 = 0;
    else
        result2 = hit/tot;
    end

    result = (result1 + result2) / 2;
end
