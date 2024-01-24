function writeDBL(image, savepath)
% write data into a .dbl file in Matlab
% 
% pixel lengths as unsigned 16 bit with Big-Endian
% Physical lengths as X with Little-Endian
% 104 8-bit unsigned ints with Big-Endian
% Image as Single with Little-Endian
%
% originally copied from Edward Allgeyer
% revised by Xiang Hao on Sep. 20, 2015. Now also compatible with 2D data

imsize = size(image);

if length(imsize) == 2
    imsize=[imsize(1),imsize(2),1];
end


fid = fopen(savepath, 'w');

fwrite(fid, [1, imsize], 'uint16', 'b');

fwrite(fid, [1, 1, 1, 1], 'single', 'l');

holder(1:104) = 1;
fwrite(fid, holder, 'uint8', 'b');

image = reshape(image, [imsize(1)*imsize(2)*imsize(3), 1]);


fwrite(fid, image, 'single', 'l');

fclose(fid);