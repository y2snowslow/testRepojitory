function [varargout] = timeSeriesPlot(varargin)
%TIMESERIESPLOT 時系列データを１軸で書ききるソフト
%  [fig1] = timeSeriesPlot(t,xlim,y1,y1lim,y1legend,y2,y2lim,y2legend,...)
%       t,y : plot Data
%       ylim = [-1 1]
%       ylegend ={'A','B'}


% y2_o3 wrote this file.
% 
% As long as you retain this notice you can do whatever you want
% with this stuff. If we meet some day, and you think this stuff
% is worth it, you can buy me a ** sushi ** in return.


%Initialize
t = varargin{1};
yDataCount = 0; % yDataCounter 
subPlotCount = 1;% subplotWindowCounter

% count y data number 
for i = 2:nargin
    if length(t) == length(varargin{i})
        yDataCount = yDataCount + 1;
    end
end

% make plot 
FigureHandler = figure();
ax(yDataCount).axes ={}; %initialize 
CombinedAxes = [];
xlimExecuteFlag = false;

for i = 2:nargin
    if length(t) == length(varargin{i})
        ax(subPlotCount).axes = subplot(yDataCount,1,subPlotCount);
        plot(t,varargin{i});

        %link-axes and Count-up 
        CombinedAxes = [CombinedAxes,ax(subPlotCount).axes];
        %if you don't want anything other than bottom X-axis,Plz Comment out.
        if subPlotCount ~= yDataCount
           ax(subPlotCount).axes.XTickLabel = [];
        end
        subPlotCount = subPlotCount + 1;

    elseif i == 2 && length(varargin{i}) == 2 && isnumeric(varargin{i})
        %for the second Variable with a length of 2 is Xlim
        xlimExecuteFlag = true;

    elseif  length(varargin{i}) == 2 && isnumeric(varargin{i})
        % length of 2 is Ylim
        ylim(varargin{i});

    elseif iscell(varargin{i}) %if varargin is cell, Consider as legend.
        legend(varargin{i})
    else
        disp('InputError@timeSeriesPlot:Quit')
        break;

    end
end

%Combine axes 
linkaxes(CombinedAxes,'x')

%xlim
if xlimExecuteFlag
    xlim(varargin{2});
end

%Output 
varargout{1} = FigureHandler;
end
