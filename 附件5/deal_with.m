function I = deal_with(A)
    B = sum(A<255, 2);
    last = 300;
    I = [];
    for i = 180 : -1 : 3
        if B(i) <= 13 && (B(i-1) - B(i) >= 10 || B(i-2) - B(i) >= 10) && last - i > 12
%             disp(i);
            last = i;
            I = [i I];
        end
    end
%         disp([k length(I)]);
%         disp(I);

    if length(I) > 2
        if(I(1) < 10 && I(2) - I(1) < 55)
            I = I(2:length(I));
        end
        II = [];
        for j = 1 : length(I)
            cnt = 0;
            for l = 1 : length(I)
%                     disp(abs(abs(I(l)-I(j)) / 63.0 - 1));
                t = abs(I(l)-I(j)) / 63.0;
%                     disp(t);
                if(t > 0.5)
                    t = abs(t / round(t) - 1);
                else
                    t = 1;
                end
%                 disp([j l t]);
                if(l ~= j && t > 0.079)
                    cnt = cnt + 1;
                end
            end
%             disp([cnt]);
            if(cnt <= length(I) / 2)
                II = [II I(j)];
            end
        end
        I = II;
    end
%     disp(I);
    if length(I) > 3
        II = [];
        for j = I
            if(B(j) > 0)
                II = [II j];
            end
        end
        I = II;
    end
end