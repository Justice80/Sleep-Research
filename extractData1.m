function data = extractData1(filename, page_start, page_end)

p = 0;
[type,sheetname] = xlsfinfo(filename);

sleepdata = zeros(10,2);

for j = page_start:page_end
    
    sheet = char(sheetname(1,j));
    [num, txt] = xlsread(filename, sheet);
    
    sleepdata1 = txt(2:end,4);
    index = find(strcmp(sleepdata1, 'U'));
    sleepdata1(index(2:end)) = [];
    sleepdata1 = cell2mat(sleepdata1);
    
    for i = 1:length(sleepdata1)
        p = p + 1;             
        switch sleepdata1(i)            
            case '1'
                sleepdata(p,2) = 1;
            case '2'
                sleepdata(p,2) = 2;
            case '0'
                sleepdata(p,2) = 0;
            otherwise
                sleepdata(p,2) = 5;
        end
    end
end

data = sleepdata;