function X = blank(A)
    X = zeros(1,180);
    [m n] = size(A);
    for i = 1 : m
        if sum(A(i,:)~=255)==0
            X(i) = 1;
        end
    end
end