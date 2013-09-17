function a = find_left
    A = readint;
    T = [];
    for i = 1:418
        B = A{i};
        if(isempty(find(B(:,1)<255, 1)))
            T = [T i];
        end
    end
    a = T;
end