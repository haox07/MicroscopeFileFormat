# MicroscopeFileFormat

This repository includes Matlab code for reading, writing, and converting the file format of the raw image data from STED microscopes constructed by X Lab @ Zhejiang University. Three major contributors of the code are: Yongdeng Zhang now at Westlake University, Edward S. Allgeyer now at the University of Cambridge, and Xiang Hao.

Function description of each file:
1. readDBL_Full: This function is designed to read data from a .dbl file, which typically contains raw image data acquired from STED microscopes.
2. writeDBL: This function facilitates the writing of 2D or 3D matrix data to a .dbl file.
3. dbl2tiff: This function directly converts a .dbl file to a .tif file, enhancing compatibility with a broader range of image processing tools.
4. tiffwrite: This function is responsible for writing 2D or 3D matrix data to a .tif file.
5. imwritestack: An inner function that supports the execution of tiffwrite.
