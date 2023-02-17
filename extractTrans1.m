function trans_vec = extractTrans1(data)

i = 1;
maxI = length(data);
trans_vec = zeros(maxI-2,1);
% NREM = 0, WAKE = 1, REM = 2
for j = 1:length(data)-2
    switch data(j+1)
        % transitions from NREM
        case 0
            switch data(j+2)
                case 0
                    trans_vec(j) = 4;
                case 1
                    trans_vec(j) = 5;
                case 2
                    trans_vec(j) = 6;
            end
        % transition from Wake 
        case 1
            switch data(j+2)
                case 0
                    trans_vec(j) = 1;
                case 1
                    trans_vec(j) = 2;
                case 2
                    trans_vec(j) = 3;
            end
        % transition from REM    
        case 2
            switch data(j+2)
                case 0
                    trans_vec(j) = 7;
                case 1
                    trans_vec(j) = 8;
                case 2
                    trans_vec(j) = 9;
            end
    end
end