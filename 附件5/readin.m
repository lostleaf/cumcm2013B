function [A B]= readin
    A=[];
    B=[];
    for i = 0:208
        A{i+1} = imread(num2str(i,'%03da.bmp'));
        B{i+1} = imread(num2str(i,'%03db.bmp'));
    end
end

