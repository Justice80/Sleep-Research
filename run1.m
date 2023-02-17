% run to find survival vectors
% sheets 1-8 are Control dark, 9-16 are Control light,
% 17-24 are Stessed dark, 25-32 are Stressed light
clear
clc

data1 = extractData1('Baseline.xls', 17, 24);
% data2 = extractData1('Day 3.xls', 17, 24);
% data3 = extractData1('Day 8.xls', 17, 24);
% data4 = extractData1('Day 15.xls', 17, 24);
% data5 = extractData1('Day 22.xls', 17, 24);
% data6 = extractData1('Day 29.xls', 17, 24);
% data7 = extractData1('Day 36.xls', 17, 24);
% data8 = extractData1('Day 55.xls', 17, 24);
% data9 = extractData1('Day 64.xls', 17, 24);

% % [boutDur_Wake_Stress_Light_B, boutDur_NR_Stress_Light_B, boutDur_R_Stress_Light_B] = extractDur1(data1);
% 
% % [survivor_Wake_c, survbin_Wake_c] = survivor_fcn(boutDur_Wake_Cont_Dark);
% % [survivor_NR_c, survbin_NR_c] = survivor_fcn(boutDur_NR_Cont_Dark);
% % [survivor_R_c, survbin_R_c] = survivor_fcn(boutDur_R_Cont_Dark);

% [boutDur_Wake_CD, boutDur_NR_CD, boutDur_R_CD] = extractDur1(data1);
% [boutDur_Wake_CL, boutDur_NR_CL, boutDur_R_CL] = extractDur1(data2);
% [boutDur_Wake_SD, boutDur_NR_SD, boutDur_R_SD] = extractDur1(data3);
% [boutDur_Wake_SL, boutDur_NR_SL, boutDur_R_SL] = extractDur1(data4);
[boutDur_Wake_Stress_Light_B, boutDur_NR_Stress_Light_B, boutDur_R_Stress_Light_B] = ...
    extractDur1(data1);
% [boutDur_Wake_Stress_Light_3, boutDur_NR_Stress_Light_3, boutDur_R_Stress_Light_3] = ...
%     extractDur1(data2);
% [boutDur_Wake_Stress_Light_8, boutDur_NR_Stress_Light_8, boutDur_R_Stress_Light_8] = ...
%     extractDur1(data3);
% [boutDur_Wake_Stress_Light_15, boutDur_NR_Stress_Light_15, boutDur_R_Stress_Light_15] = ...
%     extractDur1(data4);
% [boutDur_Wake_Stress_Light_22, boutDur_NR_Stress_Light_22, boutDur_R_Stress_Light_22] = ...
%     extractDur1(data5);
% [boutDur_Wake_Stress_Light_29, boutDur_NR_Stress_Light_29, boutDur_R_Stress_Light_29] = ...
%     extractDur1(data6);
% [boutDur_Wake_Stress_Light_36, boutDur_NR_Stress_Light_36, boutDur_R_Stress_Light_36] = ...
%     extractDur1(data7);
% [boutDur_Wake_Stress_Light_55, boutDur_NR_Stress_Light_55, boutDur_R_Stress_Light_55] = ...
%     extractDur1(data8);
% [boutDur_Wake_Stress_Light_64, boutDur_NR_Stress_Light_64, boutDur_R_Stress_Light_64] = ...
%     extractDur1(data9);

% [survivor_Wake_CD, survbin_Wake_CD] = survivor_fcn(boutDur_Wake_CD);
% [survivor_NR_CD, survbin_NR_CD] = survivor_fcn(boutDur_NR_CD);
% [survivor_R_CD, survbin_R_CD] = survivor_fcn(boutDur_R_CD);
% 
% [survivor_Wake_CL, survbin_Wake_CL] = survivor_fcn(boutDur_Wake_CL);
% [survivor_NR_CL, survbin_NR_CL] = survivor_fcn(boutDur_NR_CL);
% [survivor_R_CL, survbin_R_CL] = survivor_fcn(boutDur_R_CL);
% 
% [survivor_Wake_SD, survbin_Wake_SD] = survivor_fcn(boutDur_Wake_SD);
% [survivor_NR_SD, survbin_NR_SD] = survivor_fcn(boutDur_NR_SD);
% [survivor_R_SD, survbin_R_SD] = survivor_fcn(boutDur_R_SD);
% 
% [survivor_Wake_SL, survbin_Wake_SL] = survivor_fcn(boutDur_Wake_SL);
% [survivor_NR_SL, survbin_NR_SL] = survivor_fcn(boutDur_NR_SL);
% [survivor_R_SL, survbin_R_SL] = survivor_fcn(boutDur_R_SL);
[survivor_Wake_B, survbin_Wake_B] = survivor_fcn(boutDur_Wake_Stress_Light_B);
[survivor_NR_B, survbin_NR_B] = survivor_fcn(boutDur_NR_Stress_Light_B);
[survivor_R_B, survbin_R_B] = survivor_fcn(boutDur_R_Stress_Light_B);

% [survivor_Wake_3, survbin_Wake_3] = survivor_fcn(boutDur_Wake_Stress_Light_3);
% [survivor_NR_3, survbin_NR_3] = survivor_fcn(boutDur_NR_Stress_Light_3);
% [survivor_R_3, survbin_R_3] = survivor_fcn(boutDur_R_Stress_Light_3);
% 
% [survivor_Wake_8, survbin_Wake_8] = survivor_fcn(boutDur_Wake_Stress_Light_8);
% [survivor_NR_8, survbin_NR_8] = survivor_fcn(boutDur_NR_Stress_Light_8);
% [survivor_R_8, survbin_R_8] = survivor_fcn(boutDur_R_Stress_Light_8);
% 
% [survivor_Wake_15, survbin_Wake_15] = survivor_fcn(boutDur_Wake_Stress_Light_15);
% [survivor_NR_15, survbin_NR_15] = survivor_fcn(boutDur_NR_Stress_Light_15);
% [survivor_R_15, survbin_R_15] = survivor_fcn(boutDur_R_Stress_Light_15);
% 
% [survivor_Wake_22, survbin_Wake_22] = survivor_fcn(boutDur_Wake_Stress_Light_22);
% [survivor_NR_22, survbin_NR_22] = survivor_fcn(boutDur_NR_Stress_Light_22);
% [survivor_R_22, survbin_R_22] = survivor_fcn(boutDur_R_Stress_Light_22);
% 
% [survivor_Wake_29, survbin_Wake_29] = survivor_fcn(boutDur_Wake_Stress_Light_29);
% [survivor_NR_29, survbin_NR_29] = survivor_fcn(boutDur_NR_Stress_Light_29);
% [survivor_R_29, survbin_R_29] = survivor_fcn(boutDur_R_Stress_Light_29);
% 
% [survivor_Wake_36, survbin_Wake_36] = survivor_fcn(boutDur_Wake_Stress_Light_36);
% [survivor_NR_36, survbin_NR_36] = survivor_fcn(boutDur_NR_Stress_Light_36);
% [survivor_R_36, survbin_R_36] = survivor_fcn(boutDur_R_Stress_Light_36);
% 
% [survivor_Wake_55, survbin_Wake_55] = survivor_fcn(boutDur_Wake_Stress_Light_55);
% [survivor_NR_55, survbin_NR_55] = survivor_fcn(boutDur_NR_Stress_Light_55);
% [survivor_R_55, survbin_R_55] = survivor_fcn(boutDur_R_Stress_Light_55);
% 
% [survivor_Wake_64, survbin_Wake_64] = survivor_fcn(boutDur_Wake_Stress_Light_64);
% [survivor_NR_64, survbin_NR_64] = survivor_fcn(boutDur_NR_Stress_Light_64);
% [survivor_R_64, survbin_R_64] = survivor_fcn(boutDur_R_Stress_Light_64);

% XWz = zeros(length(boutDur_R_Stress_Light_B),1);
% XWzn = zeros(length(boutDur_R_Stress_Light_3),1);
% Xwc = [boutDur_R_Stress_Light_B XWz];
% Xwn = [boutDur_R_Stress_Light_3 XWzn];
% 
% p = logrank(Xwc, Xwn);

figure
hold on
plot(survbin_R_B, survivor_R_B, 'color', [1 0 0], 'LineWidth', 2) % survbin_R_CD, survivor_R_CD
%plot(survbin_R_3, survivor_R_3, 'color', [1 1 0], 'LineWidth', 2) % survbin_R_SD, survivor_R_SD, [0 1 1]
plot(survbin_R_8, survivor_R_8, 'color', [1 0 1], 'LineWidth', 2)
%plot(survbin_R_15, survivor_R_15, 'color', [0 1 1], 'LineWidth', 2)
plot(survbin_R_22, survivor_R_22, 'color', [0 1 0], 'LineWidth', 2)
%plot(survbin_R_29, survivor_R_29, 'color', [0 0 1], 'LineWidth', 2)
plot(survbin_R_36, survivor_R_36, 'color', [0 0 0], 'LineWidth', 2)
%plot(survbin_R_55, survivor_R_55, 'color', [0.85 0.325 0.098], 'LineWidth', 2)
plot(survbin_R_64, survivor_R_64, 'color', [0 0.85 0.85], 'LineWidth', 2)

title('REM Survival Curves (Stressed Dark)')
legend('Baseline', 'Day 8', 'Day 22', 'Day 36', 'Day 64') %'Day 3', 'Day 15', 'Day 29', 'Day 55',   'Control', 'Stressed'
xlabel('Time (sec)')
ylabel('Percentage')
ax = gca;
ax.XScale = 'linear';
ax.YScale = 'log';
hold off

figure
hold on
plot(survbin_NR_B, survivor_NR_B, 'color', [1 0 0], 'LineWidth', 2) % survbin_NR_CD, survivor_NR_CD
%plot(survbin_NR_3, survivor_NR_3, 'color', [0 1 1], 'LineWidth', 2) % survbin_NR_SD, survivor_NR_SD
plot(survbin_NR_8, survivor_NR_8, 'color', [1 0 1], 'LineWidth', 2)
%plot(survbin_NR_15, survivor_NR_15, 'color', [0 1 1], 'LineWidth', 2)
plot(survbin_NR_22, survivor_NR_22, 'color', [0 1 0], 'LineWidth', 2)
%plot(survbin_NR_29, survivor_NR_29, 'color', [0 0 1], 'LineWidth', 2)
plot(survbin_NR_36, survivor_NR_36, 'color', [0 0 0], 'LineWidth', 2)
%plot(survbin_NR_55, survivor_NR_55, 'color', [0.85 0.325 0.098], 'LineWidth', 2)
plot(survbin_NR_64, survivor_NR_64, 'color', [0 0.85 0.85], 'LineWidth', 2)

title('NonREM Survival Curves (Stressed Dark)')
legend('Baseline', 'Day 8', 'Day 22', 'Day 36', 'Day 64') %'Day 3', 'Day 15', 'Day 29', 'Day 55',  'Control', 'Stressed'
xlabel('Time (sec)')
ylabel('Percentage')
ax = gca;
ax.XScale = 'linear';
ax.YScale = 'log';
hold off

figure
hold on
plot(survbin_Wake_B, survivor_Wake_B, 'color', [1 0 0], 'LineWidth', 2) % survbin_Wake_CD, survivor_Wake_CD
%plot(survbin_Wake_3, survivor_Wake_3, 'color', [0 1 1], 'LineWidth', 2) % survbin_Wake_SD, survivor_Wake_SD
plot(survbin_Wake_8, survivor_Wake_8, 'color', [1 0 1], 'LineWidth', 2)
%plot(survbin_Wake_15, survivor_Wake_15, 'color', [0 1 1], 'LineWidth', 2)
plot(survbin_Wake_22, survivor_Wake_22, 'color', [0 1 0], 'LineWidth', 2)
%plot(survbin_Wake_29, survivor_Wake_29, 'color', [0 0 1], 'LineWidth', 2)
plot(survbin_Wake_36, survivor_Wake_36, 'color', [0 0 0], 'LineWidth', 2)
%plot(survbin_Wake_55, survivor_Wake_55, 'color', [0.85 0.325 0.098], 'LineWidth', 2)
plot(survbin_Wake_64, survivor_Wake_64, 'color', [0 0.85 0.85], 'LineWidth', 2)

title('Wake Survival Curves (Stressed Dark)')
legend('Baseline', 'Day 8', 'Day 22', 'Day 36', 'Day 64') %'Day 3', 'Day 15', 'Day 29', 'Day 55',  'Control', 'Stressed'
xlabel('Time (sec)')
ylabel('Percentage')
ax = gca;
ax.XScale = 'log';
ax.YScale = 'log';
hold off
%%%%%%
% figure
% hold on
% plot(survbin_R_CL, survivor_R_CL, 'color', [1 0 0], 'LineWidth', 2)
% plot(survbin_R_SL, survivor_R_SL, 'color', [0 1 1], 'LineWidth', 2)
% 
% title('REM Survival Curves (Light)')
% legend('Control', 'Stressed')
% xlabel('Time (sec)')
% ylabel('Percentage')
% ax = gca;
% ax.XScale = 'linear';
% ax.YScale = 'log';
% hold off
% 
% figure
% hold on
% plot(survbin_NR_CL, survivor_NR_CL, 'color', [1 0 0], 'LineWidth', 2)
% plot(survbin_NR_SL, survivor_NR_SL, 'color', [0 1 1], 'LineWidth', 2)
% 
% title('NonREM Survival Curves (Light)')
% legend('Control', 'Stressed')
% xlabel('Time (sec)')
% ylabel('Percentage')
% ax = gca;
% ax.XScale = 'linear';
% ax.YScale = 'log';
% hold off
% 
% figure
% hold on
% plot(survbin_Wake_CL, survivor_Wake_CL, 'color', [1 0 0], 'LineWidth', 2)
% plot(survbin_Wake_SL, survivor_Wake_SL, 'color', [0 1 1], 'LineWidth', 2)
% 
% title('Wake Survival Curves (Light)')
% legend('Control', 'Stressed')
% xlabel('Time (sec)')
% ylabel('Percentage')
% ax = gca;
% ax.XScale = 'log';
% ax.YScale = 'log';
% hold off

