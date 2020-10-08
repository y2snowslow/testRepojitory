function [] = powerPointSlidesExportasJPG()
%POWERPOINTSLIDESEXPORTASPNG この関数の概要をここに記述
%   PowerPointファイルをGUIで選択すると、imagesフォルダに各スライドタイトルの
% 　名前で.jpgファイルをExportする関数
%
%Select PowerpointFile
% [FileName,PathName,~] = uigetfile('.pptx');
 PathName =  'C:\Users\snow_\Desktop\Python\';
 FileName =  '描画用.pptx';
%Create "images" dir
if ~(exist('./images') == 7)
    mkdir('images')
end

try
    %Launch PowerPoint Server
    ppt = actxserver('powerpoint.application');
    ppt.Visible = 1;
    
    % Open PowerPoint file
    ppt.Presentations.Open([PathName,FileName] );
    slideList = ppt.ActivePresentation.Slides;
    
    %get SlideTitleName and save slide as png
    for i = 1:slideList.Count
        %Initialize
        title = {};
        slide = slideList.Item(i);
        title{1} = slide.Shapes.Title.TextFrame.TextRange.Text;
        slide.Export([PathName,'images\',title{1},'.jpg'] ,'jpg')
        
        %Cut white space 
        whiteSpaceCut([PathName,'images\',title{1},'.jpg']);
    end
    
    % Close Procedure
    ppt.ActivePresentation.Close;
    ppt.Quit;
    ppt.delete;
    
catch
    % Close Procedure
    ppt.ActivePresentation.Close;
    ppt.Quit;
    ppt.delete;
    disp('エラーで強制終了します');
end

end

function whiteSpaceCut(PNGFullPath)
%WhiteSpaceCut 余白をカットする。
%   .jpgファイルまでのフルパスを入力すると、
% 　 該当のファイルの余白を10％のマージンを残してカットしてくれる。
%

ImageData = imread(PNGFullPath);

%CutTitleData
CutImageData = ImageData(size(ImageData,1)*0.2:end,:,:);

%Serch White(r,g,b = 255,255,255) Area 
GrayImage = rgb2gray(CutImageData);
GrayImageWidth = mean(GrayImage);
GrayImageHeight = mean(GrayImage');

GrayImageWidthStart = find(GrayImageWidth < 255,1,'first');
GrayImageWidthEnd = find(GrayImageWidth < 255,1,'last');

GrayImageHeightStart = find(GrayImageHeight < 255,1,'first');
GrayImageHeightEnd = find(GrayImageHeight < 255,1,'last');

%Take 10% Margin
Margin = 0.1;
WidthLength  =  GrayImageWidthEnd - GrayImageWidthStart;
HeightLength =  GrayImageHeightEnd - GrayImageHeightStart;

%Cut area 
WidthStartPoint = GrayImageWidthStart - round(WidthLength*Margin);
if WidthStartPoint < 1
    WidthStartPoint = 1;
end

WidthEndPoint = GrayImageWidthEnd + round(WidthLength*Margin);
if WidthEndPoint >= length(GrayImageWidth)
    WidthEndPoint = length(GrayImageWidth);
end

HeightStartPoint = GrayImageHeightStart - round(HeightLength*Margin);
if HeightStartPoint < 1
    HeightStartPoint = 1;
end

HeightEndPoint = GrayImageHeightEnd + round(HeightLength*Margin);
if HeightEndPoint >= length(GrayImageHeight)
    HeightEndPoint = length(GrayImageHeight);
end

%OutputImage
OutputImageData = CutImageData(HeightStartPoint:HeightEndPoint,...
                               WidthStartPoint:WidthEndPoint,...
                               :);
                           
imwrite(OutputImageData,PNGFullPath);

end


