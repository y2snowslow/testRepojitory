function [FilteredData] = easyFilter(timeDomainData,Sampling_Hz,CutOffFrequency_Hz,varargin)
%EASYFILTER 時系列データに周波数指定でフィルタをかける
%  lowpass  : FilteredData = easyFilter(y,1000,30);
%  bandpass : FilteredData = easyFilter(y,1000,[30  80]);
%  highpass : FilteredData = easyFilter(y,1000,30,'high');
% 
%   Signal Processing Toolbox が必要

% y2_o3 wrote this file.
% 
% As long as you retain this notice you can do whatever you want
% with this stuff. If we meet some day, and you think this stuff
% is worth it, you can buy me a ** sushi ** in return.

if nargin == 3 % for low or bandpass filter
    [b,a] = butter(2,CutOffFrequency_Hz/(Sampling_Hz/2) );
    FilteredData = filtfilt(b,a,timeDomainData);
    
elseif nargin == 4 % for high pass filter
    [b,a] = butter(2,CutOffFrequency_Hz/(Sampling_Hz/2),varargin{1});
    FilteredData = filtfilt(b,a,timeDomainData);
else
    disp('Arguments Error@easyFilter: Quit');
end

end

