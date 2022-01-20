function [fg_x, close_fg_4r, close_fg_5r, erosed_fg] = preprocessor()

clc
clear

myFolder = 'ximagepixels';
if ~isfolder(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end
all_imgs=[];
filePattern = fullfile(myFolder, '*.bmp');
bmpFiles = dir(filePattern);
for k = 1:length(bmpFiles)
  baseFileName = bmpFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  imageArray{k} = imread(fullFileName);
  fg_x{k} = countWhites(imageArray{k});
  
  se_4r = strel('disk',4);
  se_5r = strel('disk',5);
  close_4r = imclose(imageArray{k},se_4r);
  close_5r = imclose(imageArray{k},se_5r);
  
  close_fg_4r{k} = countWhites(close_4r);
  close_fg_5r{k} = countWhites(close_5r);
   
  SE = strel('square',2);
  erosed = imerode(imerode(imageArray{k},SE),SE);
  erosed_fg{k} = countWhites(erosed);

%   imwrite(erosed,strcat('errosed_',num2str(k),'.png'));

end

xlswrite('processed/x.xlsx',fg_x')
xlswrite('processed/c_4r.xlsx',close_fg_4r')
xlswrite('processed/c_5r.xlsx',close_fg_5r')
xlswrite('processed/s.xlsx',erosed_fg')

fg_x = fg_x(1: end);
close_fg_4r = close_fg_4r(1: end);
close_fg_5r = close_fg_5r(1: end);
erosed_fg =  erosed_fg(1: end);


function [white]=countWhites(Image)
  white=length(Image(Image==255));
end


end

