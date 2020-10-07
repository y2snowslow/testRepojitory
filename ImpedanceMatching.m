clear all
close all
clc

freq(:,1) = logspace(2,8,1000);
omega = 2*pi*freq;


C = 0.1*10^-6; 
L = 7.087*10^-9;
R = 0.1427;

%Serial 
Z1 = R + 1i*(L*omega - 1./(C*omega));



C = 0.399*10^-9; 
L = 88.44*10^-9;
R = 1.02;

%Serial 
Z2 = R + 1i*(L*omega - 1./(C*omega));


% %Parallel 
% R = 10;
% L = 5*10^-6;
% C = 20*10^-9; 
% 
% Z2 =omega.*L*R./(1i*(C*L*R*omega.*omega-R)+L.*omega);



%2インピーダンスの合計


absZ1 = abs(Z1);
absZ2 = abs(Z2);
% absZ1plusZ2  = abs(Z1+Z2); %直列
absZ1plusZ2 = abs(Z1.*Z2./(Z1+Z2)); %並列

ax1=subplot(211);
loglog(freq,absZ1,freq,absZ2);grid on;


ax2=subplot(212);
loglog(freq,absZ1plusZ2);grid on;

linkaxes([ax1,ax2],'xy');

xlim([10*10^3 100*10^6]);
ylim([0.1 1000]);

% 
% subplot 313
% loglog(freq,absZ)


