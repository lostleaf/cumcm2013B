function TT = deal
    P = readin;
    TT = [];
    for k = 1 : 209       
        A = P{k};
        I = deal_with(A);
        for i = I
            for j = 1 : 72
                A(i, j) = 0;
            end
        end
        for i = 2 : length(I)
            t = I(i) - I(i-1);
            if(t<100)
                TT = [TT t];
            end
        end
        imwrite(A, num2str(k, 'temp%d.bmp'));
    end
%     imshow(A);
end