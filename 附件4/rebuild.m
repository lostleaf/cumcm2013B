function Ret = rebuild
    C = zeros(1,209);
    B = similar;
    A = readin;
    global U; 
    U = zeros(1,209);
%     for i = 1:209
%         m = max(B(i,:));
%         t = find(B(i,:)==m);
%         [t1, t2] = size(t);
%         if t2 > 1 || B(i, t) == 0 
%             C(i) = 0;
%         else
%             C(i) = t;
%         end
%     end
    
    
%     C = [86 130 105 131 0 28 18 50 48 184 158 155 178 111 69 77 10 29 57 195 144 8 58 100 118 52 101 31 0 41 38 0 205 143 14 17 208 47 124 68 159 109 67 200 0 174 128 173 73 62 161 108 126 39 193 19 36 199 93 59 15 120 170 188 107 40 206 148 175 168 85 166 13 37 146 12 44 129 0 162 102 78 0 135 61 54 60 90 122 49 186 81 179 142 114 70 24 204 25 123 7 27 116 92 181 84 5 30 117 0 26 145 0 165 177 0 137 151 190 34 176 127 91 121 1 141 106 0 201 64 35 53 182 119 56 16 74 196 154 2 194 89 169 0 207 156 0 0 171 0 6 23 45 139 191 115 97 75 187 140 51 180 134 167 79 83 189 164 63 55 197 43 157 80 138 103 183 125 0 0 65 96 152 153 0 110 99 98 112 163 185 76 198 88 94 9 0 113 95 46 132 149 72 32 66 11 4 136 22 ];
    C = csvread('match.txt');
    T = [find_left 33 104];
    for i = 1 : length(T)
        do_rebuild_lr(A, B, C, T(i), i);
    end
    disp(sum(U));
    Ret = U;
%     disp(U);
end

function do_rebuild_lr(A, B, C, t, idx)
    T = [];
    TR = [];

    global U;    U(t)=1;
    while true
        T = [T A{t}];
        TR = [TR t];
        t=C(t);
%         disp(t);
        if(t==0)
            break;
        end;
        if(U(t))
            disp('used', t);
            break;
        end;        
        U(t) = 1;
    end
    imwrite(T, num2str(idx, 'r%d.bmp'));
%     imshow(T);
    disp(TR);
    csvwrite(num2str(idx, 'r%d.txt'), TR);
end

function do_rebuild_rl(A, B, C, t, idx)
    T = [];
    TR = [];
    global U;
    while true
        T = [A{t}, T];
        TR = [t, TR];
        U(t) = 1;
%         disp(size(t));
        X = find(C == t);
%         disp(X);
        if(isempty(X))
            break;
        end
        if(length(X) > 1)
            BB = B(X,t);
            t = X(BB==max(BB));
            if(length(t)>1)
                t=t(1);
            end
        else
            t=X;
        end
        if(t==0)
            break;
        end;
    end
    imwrite(T, num2str(idx, 'r%d.bmp'));
%     imshow(T);
    disp(TR);
end
