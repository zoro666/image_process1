%%%%%%%%%%%%%  Function open_lma %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute a open operated image of an original image 
%
% Input Variables:
%      f1     mXn input 2D gray-scale image to be filtered
%      sf     size of filter
% 
% Returned Results:
%     f2     new image after opening operation
%
% Processing Flow:
%      1.  finding the size of the filter,if unspecified then use 3X3.
%      2.  Erode the image using erosion function.
%      3.  Dilate the image using dilation function
% 
%  Restrictions/Notes:
%      This function takes an 8-bit image as input. 
%
%  The following functions are called:
%      dilation.m  to dilate the image
%      erosion.m   to erode the image
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        28/01/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ f2 ] = open_lma( f1,sf )

if nargin == 1
        sf = 3;
end

f2=dilation(erosion(f1,sf));

end

