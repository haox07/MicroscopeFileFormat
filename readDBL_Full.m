function image = readDBL_Full(filename)
% read data from a .dbl file in Matlab
% images have 128 byte headers
% read 4D data stack
%
% Header format should be Z, Y, X, T
%
% originally copied from Edward Allgeyer

fid = fopen(filename, 'r');
try
    
    pxsize = fread(fid, 4, 'uint16', 'b');
    fseek(fid, 128, -1);
    
    image = single(zeros(pxsize(2), pxsize(3), pxsize(4), pxsize(1)));
    
    for time = 1:pxsize(4)
        for z = 1:pxsize(1)
            try
                image(:, :, time, z) = fread(fid, [pxsize(2), pxsize(3)], 'single', 'l');
            catch
                fprintf(1, 'Error reading from file %s\n', filename);
            end;
        end;
    end;
    
catch
    fprintf(1, 'Error reading from file %s\n', filename);
end;

fclose(fid);