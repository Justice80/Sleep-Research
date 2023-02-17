function [survbinW, survivorW, survbinNR, survivorNR, survbinR, survivorR] = surv(datasht, dta_strt, dta_end)

data = extractData1(datasht, dta_strt, dta_end);
[boutDur_Wake, boutDur_NR, boutDur_REM] = extractDur1(data);

[survivorW, survbinW] = survivor_fcn(boutDur_Wake);
[survivorNR, survbinNR] = survivor_fcn(boutDur_NR);
[survivorR, survbinR] = survivor_fcn(boutDur_REM);