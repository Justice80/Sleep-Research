function trans1(data_vec_control, data_vec_stress, bin)

%time = [0 3 8 15 22 29 36 55 64];

for i = 1:8
    trans_vec_control{i} = extractTrans1(data_vec_control(((i-1)*4321+1):(i*4321),2));
    size1(i) = max(size(trans_vec_control{i}));
%     length1{i} = ([1:1:size1(i)]./360);
end

for i = 1:8
    trans_vec_stress{i} = extractTrans1(data_vec_stress(((i-1)*4321+1):(i*4321),2));
    size2(i) = max(size(trans_vec_stress{i}));
%     length2{i} = ([1:1:size2(i)]./360);
end

control = [ones(sum(size1),1); zeros(sum(size2),1)];
stress = [zeros(sum(size1),1); ones(sum(size2),1)];

Y = [cat(1,trans_vec_control{:}); cat(1,trans_vec_stress{:})];
X = [stress]';

% transitions from Wake subgroup
Y1 = Y(0<Y & Y<4);
X1 = X(0<Y & Y<4);
if bin == 1
    X1(Y1 == 2) = [];
    Y1(Y1 == 2) = [];
elseif bin == 0
    Y1(Y1 == 2) = 4;
end
Y1 = categorical(Y1);

% transitions from NREM subgroup
Y2 = Y(3<Y & Y<7);
X2 = X(3<Y & Y<7);
Y2 = Y2 - 3;
if bin == 1
    X2(Y2 == 1) = [];
    Y2(Y2 == 1) = [];
elseif bin == 0
    Y2(Y2 == 1) = 4;
end
Y2 = categorical(Y2);

% transitions from REM subgroup
Y3 = Y(6<Y & Y<10);
X3 = X(6<Y & Y<10);
Y3 = Y3 - 6;
if bin == 1
    X3(Y3 == 3) = [];
    Y3(Y3 == 3) = []; 
elseif bin == 0
    Y3(Y3 == 3) = 4;
end
Y3 = categorical(Y3);

Var1 = {'Intercept'; 'Stress'};

if bin == 1
    disp('Transitions from Wake')
    [b,dev,stats] = glmfit(X1,Y1,'binomial','link','logit');
    B = table(b(1), b(2), 'VariableNames', Var1);
    SE = table(stats.se(1), stats.se(2), 'VariableNames', Var1);
    P = table(stats.p(1), stats.p(2), 'VariableNames', Var1);
    table(B, SE, P, 'VariableNames', {'B-values', 'Standard Error', 'P-values'})
    disp('Transitions from NREM')
    [b,dev,stats] = glmfit(X2,Y2,'binomial','link','logit');
    B = table(b(1), b(2), 'VariableNames', Var1);
    SE = table(stats.se(1), stats.se(2), 'VariableNames', Var1);
    P = table(stats.p(1), stats.p(2), 'VariableNames', Var1);
    table(B, SE, P, 'VariableNames', {'B-values', 'Standard Error', 'P-values'})
    disp('Transitions from REM')
    [b,dev,stats] = glmfit(X3,Y3,'binomial','link','logit');
    B = table(b(1), b(2), 'VariableNames', Var1);
    SE = table(stats.se(1), stats.se(2), 'VariableNames', Var1);
    P = table(stats.p(1), stats.p(2), 'VariableNames', Var1);
    table(B, SE, P, 'VariableNames', {'B-values', 'Standard Error', 'P-values'})
elseif bin == 0
    disp('Transitions from Wake')
    Var = {'NREM', 'REM'};
    [b,dev,stats]=mnrfit(X1, Y1);
    B = table(b(:,1), b(:,2), 'VariableNames', Var1);
    SE = table(stats.se(:,1), stats.se(:,2), 'VariableNames', Var1);
    P = table(stats.p(:,1), stats.p(:,2), 'VariableNames', Var1);
    table(B, SE, P, 'VariableNames', {'B-values', 'Standard Error', 'P-values'}, 'RowNames', Var)
    disp('Transitions from NREM')
    Var = {'Wake', 'REM'};
    [b,dev,stats]=mnrfit(X2, Y2);
    B = table(b(:,1), b(:,2), 'VariableNames', Var1);
    SE = table(stats.se(:,1), stats.se(:,2), 'VariableNames', Var1);
    P = table(stats.p(:,1), stats.p(:,2), 'VariableNames', Var1);
    table(B, SE, P, 'VariableNames', {'B-values', 'Standard Error', 'P-values'}, 'RowNames', Var)
    disp('Transitions from REM')
    Var = {'Wake', 'NREM'};
    [b,dev,stats]=mnrfit(X3, Y3);
    B = table(b(:,1), b(:,2), 'VariableNames', Var1);
    SE = table(stats.se(:,1), stats.se(:,2), 'VariableNames', Var1);
    P = table(stats.p(:,1), stats.p(:,2), 'VariableNames', Var1);
    table(B, SE, P, 'VariableNames', {'B-values', 'Standard Error', 'P-values'}, 'RowNames', Var)
end









