function B = a 
    A=[];
    for i = 1:11
        A{i} = imread(num2str(i,'r%d.bmp'));
    end

    B = zeros(11,11);
    for i = 1:11
        for j = 1:11
            if i ~= j
                B(i,j) = sim(A{i}, A{j});
            end
        end
    end

    C = zeros(1,11);
    for i = 1:11
        m = max(B(i,:));
        t = find(B(i,:)==m);
        [t1, t2] = size(t);
%         disp(size(t));
        if t2 > 1
            C(i) = 0;
        else
            C(i) = t;
        end
    end
    
%     disp(C);
    
    K = find(C==0);
%     disp(K);
    for k = 1 : length(K)
        t = K(k);
        T = [A{t}];
        TT = [t];
        while true
            if(isempty(t))
                break;
            end
            [tt, t] = find(C == t);
            T = [A{t}; T];
            TT = [t TT];
        end
        if(~isempty(T))
        imwrite(T, num2str(k,'rr%d.bmp'));
        end
        R = [];
        for j = TT
            disp(j);
            X = csvread(num2str(j, 'r%d.txt'));
            R = [R;X];
        end
        csvwrite(num2str(k, 'rr%d.txt'), R);
%     imshow(T);
    end
end

function result = sim(A, B)
    tot = 0;
    hit = 0;
    for i = 1:1368
        if A(180,i) < 255
            tot = tot + 1;
            if B(1,i) < 255
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
