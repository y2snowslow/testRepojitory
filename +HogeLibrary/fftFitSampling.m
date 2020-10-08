function [Frequency,Power,Phase_deg] = fftFitSampling(TimeDomainData,Sampling_Hz)
%FFTFITSAMPLING 時系列データとサンプリング周波数を入れたら周波数とパワーと位相情報を
%               返してくれるソフト
% 
% # "THE SUSHI-WARE LICENSE"
% 
% y2_o3 wrote this file.
% 
% As long as you retain this notice you can do whatever you want
% with this stuff. If we meet some day, and you think this stuff
% is worth it, you can buy me a ** sushi ** in return.
% 
% (This license is based on ["THE BEER-WARE LICENSE" (Revision 42)].
%  Thanks a lot, Poul-Henning Kamp ;)
% ?["THE BEER-WARE LICENSE" (Revision 42)]: https://people.freebsd.org/~phk/

DataSize = length(TimeDomainData);
fftData = fft(TimeDomainData);

%check odd or even
if mod(DataSize,2) == 1 %odd
   fftDataSize =  (DataSize-1)/2;
else %even
   fftDataSize =  DataSize/2;    
end

%ConvertData
Frequency(:,1) = 0:(Sampling_Hz/2)/fftDataSize:(Sampling_Hz/2);
Power(:,1) = abs(fftData(1:fftDataSize+1)); %DC+AC
Power(1) = Power(1) / DataSize;
Power(2:end) = Power(2:end) / fftDataSize; 
Phase_deg = angle(fftData(1:fftDataSize+1))/pi*180; %rad -> deg

end

