function setBlockWithCentralReference(Source,Destination,CenterPosition,varargin)
%SETBLOCKWITHCENTRALREFERENCE　中心基準でブロック配置
%   if target is test.slx
%   Source          :'simulink/Sinks/Scope'  %from library
%   Destination     :'test/MyScope'          %for target 
%   CenterPosition  :[50 50];
%   IconSize        :[width  height]  like [1 3] set integer magnification
% 
%   DefaultBlockSize is 40 x 40 

%Default Blocksize
DefaultBlockSize = 40;

%set BlockSize
if nargin == 3
    BlockSize = DefaultBlockSize;
    BlockPosition =    ...
        [CenterPosition(1)-BlockSize(1)/2  CenterPosition(2)-BlockSize(1)/2 ...
         CenterPosition(1)+BlockSize(1)/2  CenterPosition(2)+BlockSize(1)/2];
elseif nargin == 4
    IconSize = varargin{1};
    BlockSize = DefaultBlockSize.*IconSize;
    BlockPosition =    ...
        [CenterPosition(1)-BlockSize(2)/2  CenterPosition(2)-BlockSize(1)/2 ...
         CenterPosition(1)+BlockSize(2)/2  CenterPosition(2)+BlockSize(1)/2];
else
    disp('InputError@setBlockWithCentralReference.Break')
    return;
end

%Place Block
add_block(Source,Destination);
set_param(Destination,'Position',BlockPosition);

end

