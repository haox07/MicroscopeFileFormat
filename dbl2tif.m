function dbl2tif(rfilepath,wfilepath)

% DBL2TIF reads the .dbl raw data from the file defined by "rfilepath" input
% and transfer it to a .tif file defined by "wfilepath".
%
% originally copied from Edward Allgeyer 
% updated by Xiang Hao on Sep 25, 2015. Normalize the figure to its own peak intensity for better visualization
% when preview the figure outside Matlab (e.g. Windows Photo Viewer).

data=uint16(squeeze(readDBL_Full(rfilepath)));
imsize=size(data);
MAX=double(max(max(max(data))));
data=uint16(double(data)*(2^16-1)/MAX);

try 
    for j=1:imsize(3)
        imwrite(data(:,:,j),wfilepath,'tif','compression','none','WriteMode','append');
    end
catch
    imwrite(data(:,:,1),wfilepath,'tif','compression','none');
end
