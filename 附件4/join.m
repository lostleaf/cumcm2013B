function join
    A = readin;
    for i = 1:17
        T = csvread(num2str(i,'r%d.txt'));
        I = [];
        for j = 1:length(T)
%             disp(T(j));
            I = [I A{T(j)}];
        end
        imwrite(I, num2str(i, 'r%d.bmp'));
    end
end