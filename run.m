% move all data to struct in tables

subpaths = genpath(pwd);
subpaths = strsplit(subpaths,';'); subpaths = subpaths';
subpaths(end) = []; subpaths(1) = [];


extractData('C:\Users\Justice Martinez\Desktop\forModelling\Baseline\B1_B_Dark_sco.csv')