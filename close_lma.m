%%%%%%%%%%%%%  Function close_lma %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute a close operated image of an original image 
%
% Input Variables:
%      f2     mXn input 2D gray-scale image to be filtered
%      sf     size of filter
% 
% Returned Results:
%     X     new image after closing operation
%
% Processing Flow:
%      1.  finding the size of the filter,if unspecified then use 3X3.
%      2.  Dilate the image using dilation function.
%      3.  Erode the image using erosion function
% 
%  Restrictions/Notes:
%      This function takes a binary image as input. 
%
%  The following functions are called:
%      dilation.m  to dilate the image
%      erosion.m   to erode the image
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        28/01/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ X ] = close_lma( f2,sf )

if nargin == 1
        sf = 3;
end

X=erosion(dilation(f2,sf));

end