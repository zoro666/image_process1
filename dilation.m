%%%%%%%%%%%%%  Function dilation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute a dilated image of an original image 
%
% Input Variables:
%      s       mXn input 2D gray-scale image to be filtered
%      sof     size of filter
% 
% Returned Results:
%     temp     new dilated image
%
% Processing Flow:
%      1.  finding the size of the filter,if unspecified then use 3X3.
%      2.  Place the centre of filter on the image and count the number of   
%       ones in that particular structure.
%      3.  If the number of ones is less than (sof*sof) of filter 
%       then return 0 (black) at the centre else return 1(white).
%      
%  Restrictions/Notes:
%      This function takes a binary image as input. The image is not padded 
%       by zeros at the boundary.
%
%  The following functions are called:
%      none
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        28/01/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ temp ] = dilation( s,sof )
if nargin == 1
        sof = 3;
    end

rew= round(sof/2);
rew1=rew-1;
[m, n]=size(s);
temp= zeros(m,n);
% Place the filter such that the center of the filter is offsetted from the
% edge of the image by (sof)/2 
   for i=rew:(m-rew)
       for j= rew:(n-rew)
           count=0;
           for p=i-rew1:i+rew1 
               for q= j-rew1: j+rew1
                   count=count + s(p,q);
               end
           end
           
           if count < (sof*sof)
               temp (i,j)= 0;  %% set black
           else
               temp(i,j)=1;
           end
       end
   end
   
end
