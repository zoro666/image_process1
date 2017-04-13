%%%%%%%%%%%%%  Function addimages_lma %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Computes image addition pixel-by-pixel 
%
% Input Variables:
%      X    mXn input 2D gray-scale image 
%      W    mXn input 2D gray-scale image
% 
% Returned Results:
%      Y    mXn output 2D gray-scale image
%
% Processing Flow:
%      1.  Compute pixel-by-pixel addition of two images.
%      2.  Subtract 1 from each pixel of image Y to get desired result of
%      addition(1's for white and 0's for black)
%      
%  Restrictions/Notes:
%      This function takes a binary image as input.
%
%  The following functions are called:
%     None
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        28/01/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ Y ] = addimages_lma( X,W )

Y=[];
[m,n]=size(X);
%% Compute pixel-by-pixel image addition which results in two values in 
% image which are 1 and 2. Hence subtract 1 from all pixel to get 1 and 0.
for i=1:m
    for j=1:n
        Y(i,j)=X(i,j)+W(i,j);
    end
end
for i=1:m
    for j=1:n
        Y(i,j)=Y(i,j)-1;
    end
end

end

