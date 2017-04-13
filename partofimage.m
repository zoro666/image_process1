%%%%%%%%%%%%%  Function partofimage %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Extract the part of image from A by translating the mask B
%      and outputs it in M 
%
% Input Variables:
%      A    mXn size of a 2-D input image 
%      B    generated mask
%      i    row location of translation
%      j    column location of translation
%       
% Returned Results:
%      M   mbXnb size of part of image(size of M depends on size of mask)
% 
% Processing Flow:
%      1.  Find the size of mask.
%      2.  Extract the part of image of A into M depending upon the
%      translation
% 
%  Restrictions/Notes:
%      This function takes a binary image as input. Size of the output
%      depends on size of mask and the location of translation is equally
%      important as the function is used for part-by-part processing of the
%      image
%
%  The following functions are called:
%      None
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        28/01/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ M ] = partofimage( A,B,i,j )

M=[];
[mb,nb]=size(B);
    for x=1:mb
        for y=1:nb
            M(x,y)=A((x+i-1),(y+j-1));
        end
    end

end

