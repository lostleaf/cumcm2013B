function A = readin
    A=[];
    for i = 0:208
        A{i+1} = imread(num2str(i,'%03d.bmp'));
    end
end

