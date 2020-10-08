clear all
% close all
clc

Sampling =  1*10^8; %Hz
freq = 10*10^3; %Hz
dv = 4000; %V/us 


Time(:,1) = 0:1/Sampling:0.010-1/Sampling;
sint = sin(2*pi*freq*Time);

Data = sint;
Data(Data>0) = 400;
Data(Data<=0) = 0;

Data_moto = Data;

if dv > 0  %‘äŒ`”g‚É‚·‚é
   
    posedge  = find(diff(Data) == 400) + 1;
    negedge =  find(diff(Data) == -400) + 1;
    step = 400/(dv/Sampling *10^6);
    disp(step);
    
    for i = 1:length(posedge)
        Data(posedge(i):posedge(i)+step) = 0:400/(step):400;
    end
    
    for i = 1:length(negedge)
        Data(negedge(i):negedge(i)+step) = 400:-400/(step):0;
    end
    
    
end

%FFT
[f,amp,phase] = HogeLibrary.fftFitSampling(Data,Sampling); 
[f2,amp2,phase2] = HogeLibrary.fftFitSampling(Data_moto,Sampling); 

subplot 211
plot(Time,Data_moto,Time,Data)
legend('Base','Trapezoid')

subplot 212
semilogx(f,20*log10(amp2*10^6),f,20*log10(amp*10^6)); grid on;%dB uVŠ·ŽZ
legend('Base','Trapezoid')
ylim([0 200])


