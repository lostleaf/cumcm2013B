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
    
    
%     disp(C(1));
%    C = [138 88 58 160 102 93 178 209 106 9 105 23 74 183 129 134 185 0 0 79 53 174 130 148 36 10 2 61 92 65 42 52 197 203 85 82 0 76 149 32 152 24 125 0 207 175 162 122 38 55 180 108 37 57 66 45 94 193 44 0 0 20 143 117 112 0 107 70 176 100 167 157 7 161 0 56 0 113 0 64 34 190 200 133 184 153 196 19 168 147 48 189 181 154 35 12 132 137 173 163 77 114 155 131 99 75 151 116 118 198 188 202 150 195 41 177 164 5 191 124 87 43 104 0 145 14 69 59 4 29 194 80 201 171 40 13 165 54 159 146 186 0 31 187 78 0 0 192 47 98 22 208 166 71 115 141 84 182 127 83 204 25 97 73 128 28 33 26 101 135 206 60 172 158 1 46 0 21 119 121 49 205 110 91 111 109 3 67 142 123 96 51 179 89 120 27 0 17 16 0 18 6 199 170 140 86 11 156 139 ];
    C = csvread('match.txt');
	T = [find_left 103];
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
    global U;    
    U(t)=1;
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
%     disp(TR);
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
