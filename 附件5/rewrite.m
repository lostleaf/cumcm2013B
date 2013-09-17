function rewrite
    [P1 P2] = readin;
    for i = 1 : 22
        T1 = [];
        T2 = [];
        I = csvread(num2str(i, 'r%d.txt'));
        for j = I
            jj = fix((j+1)/2);
            if(mod(j,2) == 1)
                T1 = [T1 P1{jj}];
                T2 = [P2{jj} T2];
            else
                T1 = [T1 P2{jj}];
                T2 = [P1{jj} T2];
            end
        end
        imwrite([T1 T2], num2str(i, 'rr%d.bmp'));
    end
end