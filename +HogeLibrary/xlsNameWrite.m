function [] = xlsNameWrite(FileName,SaveData,varargin)
%XLSNAMEWRITE エクセルに変数名をつけて保存する
%   
%　xlsNameWrite(SaveData,FileName,VariableNameList);
%   ex. VariableNameList =  {'A','B'};
% 
%　xlsNameWrite(SaveData,FileName,VariableNameList,SheetName);
%   ex.  SheetName = 'Sheet1';
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

if nargin == 2
    xlswrite(FileName,SaveData);
    
elseif nargin == 3
    VariableNameList = varargin{1};

    %Write variableName
    xlswrite(FileName,VariableNameList,'Sheet1','A1');
    %Write Data
    xlswrite(FileName,SaveData,'Sheet1','A2');
     
elseif nargin == 4
    VariableNameList = varargin{1};
    SheetName = varargin{2};
    
    %Write variableName
    xlswrite(FileName,VariableNameList,SheetName,'A1');
    %Write Data
    xlswrite(FileName,SaveData,SheetName,'A2');
else
    disp('InputVariable is error,check input @ xlsNameWrite')
end

end

