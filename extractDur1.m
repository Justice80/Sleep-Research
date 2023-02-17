function [bout_Dur_Wake, bout_Dur_NR, bout_Dur_REM, WakeAvg, WakeSD, NRAvg,...
    NRSD, REMAvg, REMSD, boutCntWake, boutCntNR, boutCntREM] = extractDur1(data_vec)

bout_Dur_Wake = zeros(1);
bout_Dur_NR = zeros(1);
bout_Dur_REM = zeros(1);
boutCntWake = zeros(8,1);
boutCntNR = zeros(8,1);
boutCntREM = zeros(8,1);
LI_W = 1; LI_N = 1; LI_R = 1; sub = 1;

% 0 = NREM, 1 = Wake, 2 = REM
r = 1; w = 1; nr = 1;

maxI = length(data_vec);

Ishift(1:maxI,1) = zeros(maxI,1);
Ishift(1,2) = 0;

for i = 2:maxI
    Ishift(i,2) = data_vec(i-1,2);
end

tx = data_vec - Ishift;

txInd = find(tx(:,2) ~= 0);
txInd = [txInd; maxI+1];

for j = 2:length(txInd)-1
    
    switch data_vec(txInd(j),2)
        case 0
            bout_Dur_NR(nr) = txInd(j+1) - txInd(j); nr = nr + 1;
        case 1
            bout_Dur_Wake(w) = txInd(j+1) - txInd(j); w = w + 1;
        case 2 
            bout_Dur_REM(r) = txInd(j+1) - txInd(j); r = r + 1;
        case 5
            %save last index     index = find(a == 1)
            index = find(bout_Dur_Wake(LI_W:end) == 1); tmp = bout_Dur_Wake; tmp(index) = [];
            boutCntWake(sub) = length(tmp(LI_W:end));
            index = find(bout_Dur_NR(LI_N:end) == 1); tmp = bout_Dur_NR; tmp(index) = [];
            boutCntNR(sub) = length(tmp(LI_N:end));
            index = find(bout_Dur_REM(LI_R:end) == 1); tmp = bout_Dur_REM; tmp(index) = [];
            boutCntREM(sub) = length(tmp(LI_R:end));
            sub = sub + 1;
            LI_W = length(bout_Dur_Wake) + 1;
            LI_N = length(bout_Dur_NR) + 1;
            LI_R = length(bout_Dur_REM) + 1;
    end
end
index = find(bout_Dur_Wake(LI_W:end) == 1); tmp = bout_Dur_Wake; tmp(index) = [];
boutCntWake(sub) = length(tmp(LI_W:end));
index = find(bout_Dur_NR(LI_N:end) == 1); tmp = bout_Dur_NR; tmp(index) = [];
boutCntNR(sub) = length(tmp(LI_N:end));
index = find(bout_Dur_REM(LI_R:end) == 1); tmp = bout_Dur_REM; tmp(index) = [];
boutCntREM(sub) = length(tmp(LI_R:end));

WakeAvg = mean(boutCntWake);
NRAvg = mean(boutCntNR);
REMAvg = mean(boutCntREM);
WakeSD = std(boutCntWake);
NRSD = std(boutCntNR);
REMSD = std(boutCntREM);

bout_Dur_Wake = bout_Dur_Wake';
bout_Dur_NR = bout_Dur_NR';
bout_Dur_REM = bout_Dur_REM';



















