function trans2(data_base, data_D3, data_D8, data_D15, data_D22,...
    data_D29, data_D36, data_D55, data_D64, bin)

for i = 1:8
    trans_vec_base{i} = extractTrans1(data_base(((i-1)*4321+1):(i*4321),2));
    size1(i) = max(size(trans_vec_base{i}));
    time1{i} = zeros(size1(i),1); 
    length1{i} = ([1:1:size1(i)]'./360);
end

for i = 1:8
    trans_vec_3{i} = extractTrans1(data_D3(((i-1)*4321+1):(i*4321),2));
    size2(i) = max(size(trans_vec_3{i}));
    time2{i} = ones(size2(i),1)*3;
    length2{i} = ([1:1:size2(i)]'./360);
end

for i = 1:8
    trans_vec_8{i} = extractTrans1(data_D8(((i-1)*4321+1):(i*4321),2));
    size3(i) = max(size(trans_vec_8{i}));
    time3{i} = ones(size3(i),1)*8;
    length3{i} = ([1:1:size3(i)]'./360);
end

for i = 1:8
    trans_vec_15{i} = extractTrans1(data_D15(((i-1)*4321+1):(i*4321),2));
    size4(i) = max(size(trans_vec_15{i}));
    time4{i} = ones(size4(i),1)*15;
    length4{i} = ([1:1:size4(i)]'./360);
end

for i = 1:8
    trans_vec_22{i} = extractTrans1(data_D22(((i-1)*4321+1):(i*4321),2));
    size5(i) = max(size(trans_vec_22{i}));
    time5{i} = ones(size5(i),1)*22;
    length5{i} = ([1:1:size5(i)]'./360);
end

for i = 1:8
    trans_vec_29{i} = extractTrans1(data_D29(((i-1)*4321+1):(i*4321),2));
    size6(i) = max(size(trans_vec_29{i}));
    time6{i} = ones(size6(i),1)*29;
    length6{i} = ([1:1:size6(i)]'./360);
end

for i = 1:8
    trans_vec_36{i} = extractTrans1(data_D36(((i-1)*4321+1):(i*4321),2));
    size7(i) = max(size(trans_vec_36{i}));
    time7{i} = ones(size7(i),1)*36;
    length7{i} = ([1:1:size7(i)]'./360);
end

for i = 1:8
    trans_vec_55{i} = extractTrans1(data_D55(((i-1)*4321+1):(i*4321),2));
    size8(i) = max(size(trans_vec_55{i}));
    time8{i} = ones(size8(i),1)*55;
    length8{i} = ([1:1:size8(i)]'./360);
end

for i = 1:8
    trans_vec_64{i} = extractTrans1(data_D64(((i-1)*4321+1):(i*4321),2));
    size9(i) = max(size(trans_vec_64{i}));
    time9{i} = ones(size9(i),1)*64;
    length9{i} = ([1:1:size9(i)]'./360);
end

baseline = [ones(sum(size1),1); zeros(sum(size2)+sum(size3)+sum(size4)+sum(size5)+...
    sum(size6)+sum(size7)+sum(size8)+sum(size9),1)];
day3 = [zeros(sum(size1),1); ones(sum(size2),1); zeros(sum(size3)+sum(size4)+sum(size5)+...
    sum(size6)+sum(size7)+sum(size8)+sum(size9),1)];
day8 = [zeros(sum(size1)+sum(size2),1); ones(sum(size3),1); zeros(sum(size4)+sum(size5)+...
    sum(size6)+sum(size7)+sum(size8)+sum(size9),1)];
day15 = [zeros(sum(size1)+sum(size2)+sum(size3),1); ones(sum(size4),1); zeros(sum(size5)+...
    sum(size6)+sum(size7)+sum(size8)+sum(size9),1)];
day22 = [zeros(sum(size1)+sum(size2)+sum(size3)+sum(size4),1); ones(sum(size5),1); zeros(...
    sum(size6)+sum(size7)+sum(size8)+sum(size9),1)];
day29 = [zeros(sum(size1)+sum(size2)+sum(size3)+sum(size4)+sum(size5),1); ones(sum(size6),1);...
    zeros(sum(size7)+sum(size8)+sum(size9),1)];
day36 = [zeros(sum(size1)+sum(size2)+sum(size3)+sum(size4)+sum(size5)+sum(size6),1);...
    ones(sum(size7),1); zeros(sum(size8)+sum(size9),1)];
day55 = [zeros(sum(size1)+sum(size2)+sum(size3)+sum(size4)+sum(size5)+sum(size6)+sum(size7),1);...
    ones(sum(size8),1); zeros(sum(size9),1)];
day64 = [zeros(sum(size1)+sum(size2)+sum(size3)+sum(size4)+sum(size5)+sum(size6)+sum(size7)+...
    sum(size8),1); ones(sum(size9),1)];

time = [cat(1,time1{:}); cat(1,time2{:}); cat(1,time3{:}); cat(1,time4{:}); cat(1,time5{:});...
    cat(1,time6{:}); cat(1,time7{:}); cat(1,time8{:}); cat(1,time9{:})];

Y = [cat(1,trans_vec_base{:}); cat(1,trans_vec_3{:}); cat(1,trans_vec_8{:}); cat(1,trans_vec_15{:});...
    cat(1,trans_vec_22{:}); cat(1,trans_vec_29{:}); cat(1,trans_vec_36{:}); cat(1,trans_vec_55{:});...
    cat(1,trans_vec_64{:})];
% X = [day3 day8 day15 day22 day29 day36 day55 day64];
% X = [baseline day3 day8 day15 day22 day29 day36 day55];
X = [time];

% transitions from Wake subgroup
Y1 = Y(0<Y & Y<4);
X1 = X((0<Y & Y<4), :);
if bin == 1
    X1(Y1 == 2,:) = [];
    Y1(Y1 == 2) = [];
elseif bin == 0
    Y1(Y1 == 2) = 4;
end
Y1 = categorical(Y1);

% transitions from NREM subgroup
Y2 = Y(3<Y & Y<7);
X2 = X((3<Y & Y<7), :);
Y2 = Y2 - 3;
if bin == 1
    X2(Y2 == 1,:) = [];
    Y2(Y2 == 1) = [];
elseif bin == 0
    Y2(Y2 == 1) = 4;
end
Y2 = categorical(Y2);

% transitions from REM subgroup
Y3 = Y(6<Y & Y<10);
X3 = X((6<Y & Y<10), :);
Y3 = Y3 - 6;
if bin == 1
    X3(Y3 == 3,:) = [];
    Y3(Y3 == 3) = []; 
elseif bin == 0
    Y3(Y3 == 3) = 4;
end
Y3 = categorical(Y3);

Var1 = {'Intercept'; 'Recording Day'};
% Var1 = {'Intercept'; 'Day 3'; 'Day 8'; 'Day 15'; 'Day 22'; 'Day 29';...
%     'Day 36'; 'Day 55'; 'Day 64'; 'Recording Day'};

if bin == 1
    disp('Transitions from Wake')
    [b,dev,stats] = glmfit(X1,Y1,'binomial','link','logit');
    B = table(b(1), b(2), 'VariableNames', Var1)
    SE = table(stats.se(1), stats.se(2), 'VariableNames', Var1)
    P = table(stats.p(1), stats.p(2), 'VariableNames', Var1)
%     B = table(b(1), b(2), b(3), b(4), b(5), b(6), b(7), b(8), b(9), b(10), 'VariableNames', Var1)
%     SE = table(stats.se(1), stats.se(2), stats.se(3), stats.se(4), stats.se(5), stats.se(6),...
%         stats.se(7), stats.se(8), stats.se(9), stats.se(10), 'VariableNames', Var1)
%     P = table(stats.p(1), stats.p(2), stats.p(3), stats.p(4), stats.p(5), stats.p(6), stats.p(7),...
%          stats.p(8), stats.p(9), stats.p(10), 'VariableNames', Var1)
     
    disp('Transitions from NREM')
    [b,dev,stats] = glmfit(X2,Y2,'binomial','link','logit');
    B = table(b(1), b(2), 'VariableNames', Var1)
    SE = table(stats.se(1), stats.se(2), 'VariableNames', Var1)
    P = table(stats.p(1), stats.p(2), 'VariableNames', Var1)
     
    disp('Transitions from REM')
    [b,dev,stats] = glmfit(X3,Y3,'binomial','link','logit');
    B = table(b(1), b(2), 'VariableNames', Var1)
    SE = table(stats.se(1), stats.se(2), 'VariableNames', Var1)
    P = table(stats.p(1), stats.p(2), 'VariableNames', Var1)
elseif bin == 0
    disp('Transitions from Wake')
    Var = {'NREM', 'REM'};
    [b,dev,stats]=mnrfit(X1, Y1);
    B = table(b(1,:)', b(2,:)', 'VariableNames', Var1, 'RowNames', Var);
    SE = table(stats.se(1,:)', stats.se(2,:)', 'VariableNames', Var1, 'RowNames', Var);
    P = table(stats.p(1,:)', stats.p(2,:)', 'VariableNames', Var1, 'RowNames', Var);
%     B = table(b(1,:)', b(2,:)', b(3,:)', b(4,:)', b(5,:)', b(6,:)', b(7,:)', b(8,:)', b(9,:)',...
%         b(10,:)', 'VariableNames', Var1, 'RowNames', Var)
%     SE = table(stats.se(1,:)', stats.se(2,:)', stats.se(3,:)', stats.se(4,:)', stats.se(5,:)',...
%         stats.se(6,:)', stats.se(7,:)', stats.se(8,:)', stats.se(9,:)', stats.se(10,:)',...
%         'VariableNames', Var1, 'RowNames', Var)
%     P = table(stats.p(1,:)', stats.p(2,:)', stats.p(3,:)', stats.p(4,:)', stats.p(5,:)',...
%         stats.p(6,:)', stats.p(7,:)', stats.p(8,:)', stats.p(9,:)', stats.p(10,:)',...
%         'VariableNames', Var1, 'RowNames', Var)
    table(B, SE, P, 'VariableNames', {'B-values', 'Standard Error', 'P-values'})

    disp('Transitions from NREM')
    Var = {'Wake', 'REM'};
    [b,dev,stats]=mnrfit(X2, Y2);
    B = table(b(1,:)', b(2,:)', 'VariableNames', Var1, 'RowNames', Var);
    SE = table(stats.se(1,:)', stats.se(2,:)', 'VariableNames', Var1, 'RowNames', Var);
    P = table(stats.p(1,:)', stats.p(2,:)', 'VariableNames', Var1, 'RowNames', Var);
    table(B, SE, P, 'VariableNames', {'B-values', 'Standard Error', 'P-values'})

    disp('Transitions from REM')
    Var = {'Wake', 'NREM'};
    [b,dev,stats]=mnrfit(X3, Y3);
    B = table(b(1,:)', b(2,:)', 'VariableNames', Var1, 'RowNames', Var);
    SE = table(stats.se(1,:)', stats.se(2,:)', 'VariableNames', Var1, 'RowNames', Var);
    P = table(stats.p(1,:)', stats.p(2,:)', 'VariableNames', Var1, 'RowNames', Var);
    table(B, SE, P, 'VariableNames', {'B-values', 'Standard Error', 'P-values'})
end








