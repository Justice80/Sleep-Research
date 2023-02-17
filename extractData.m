function [data] = extractData(filename) %, start, end

p = 1;

% [type, sheetname] = cvsinfo(filename);

sleepdata = zeros(5, 1);

T = readtable(filename);

index = find(strcmp(T.COL1, 'U'));

T(index, :) = [];
T = removevars(T,{'dtid'});

for i = 1:length(sleepdata)
    
    sleepdata(p,1) = 
    
end