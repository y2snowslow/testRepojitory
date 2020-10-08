function [PropetryList] = serchDefaultFigureProperty(SerchString)
%SERCHDEFAULTFIGUREPROPERTY デフォルトのフィギュアプロパティを探す
% Input
%   SerchString = 'Axes';
% Output
%   PropetryList ={'Axes1','Axes2'....}
% 

%initialize 
counter = 1;
PropetryList = {};

allDefaultProperties = get(groot,'Factory');
List = fieldnames(allDefaultProperties); %Convert Cell

for i = 1:length(List)
    HasString = strfind(List{i},SerchString);
    if ~isempty(HasString)
        PropetryList{counter,1} = List{i};
        counter = counter + 1;
    end
end

%Replace 'factory' -> 'default' and remove space
for i = 1:length(PropetryList)
    PropetryList{i}  = regexprep(PropetryList{i},'factory','default');
end

