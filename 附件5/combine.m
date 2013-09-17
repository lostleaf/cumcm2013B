function DF = combine
    [P1 P2] = readin;
    for i = 1 : 418
         j = fix((i+1)/2);
         if(mod(i, 2) == 1)
             T = [P1{j}; fliplr(P2{j})];
         else
%              disp(j);
             T = [P2{j}; fliplr(P1{j})];
         end
         imwrite(T, num2str(i, 't%d.bmp'));
    end
    
    [DF11 DF12 DF21 DF22] = difference;
    DF = zeros(418, 418);
    
    for i = 1 : 418
        for j = 1 : 418
            ii = fix((i+1)/2);
            jj = fix((j+1)/2);
            if(mod(i, 2) == mod(j, 2))
                DF(i, j) = DF11(ii, jj) + DF22(ii, jj);
            else
                DF(i, j) = DF12(ii, jj) + DF21(ii, jj);
            end
        end
    end
end