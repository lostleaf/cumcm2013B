function TT = deal
    [P1 P2] = readin;
    TT = [];
    for k = 1 : 209       
        A = P1{k};
        I = deal_with(A);
        if isempty(I) 
            disp(k)
        end
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
        imwrite(A, num2str(k, 'temp%da.bmp'));
        
        A = P2{k};
        I = deal_with(A);
        if isempty(I) 
            disp(k)
        end
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
        imwrite(A, num2str(k, 'temp%db.bmp')); 
    end
%     imshow(A);
end