function [A B]= readin
    A=[];
    for i = 1:418
        A{i} = imread(num2str(i,'t%d.bmp'));
    end
end

