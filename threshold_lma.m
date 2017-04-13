%%%%%%%%%%%%%  Function threshold_lma %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute a thresholded image of an original image 
%
% Input Variables:
%      f       MxN input 2D gray-scale image to be filtered
%      
% Returned Results:
%     f1       new image cantaining the thresholded results
%
% Processing Flow:
%      1.  finding the size of the image
%      2.  For each valid pixel,check the gray level. If the pixel are
%      greater than 127 then set them to 255 and all below them to 0 value.
%      3.  Make all values of 255 to 1 and all 0 to 0.
% 
%  Restrictions/Notes:
%      This function takes a binary image as input.  
%
%  The following functions are called:
%      none
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        28/01/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ f1 ] = threshold_lma( f )
[M, N] = size(f);
for x = 1 : M
    for y = 1 : N
        if f(x,y) > 127
            f1(x,y) = max(f(x,y),255);
        else
            f1(x,y) = 0;
        end
    end
end
f1=f1>1;
end

