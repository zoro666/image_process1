%%%%%%%%%%%%%  Function e2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Computes the minksub of image X and mask A 
%
% Input Variables:
%      s    mXn size of a 2-D input image 
%      sof  size of the mask, default value is 3
%      c    number of 1's in the mask
% 
% Returned Results:
%      temp   output of minksub operation of X and A
% 
% Processing Flow:
%      1.  finding the size of the mask,if unspecified then use 3X3.
%      2.  Place the centre of mask on the image and count the number of   
%       ones in that particular structure(image).
%      3.  If the number of ones is less than c of mask 
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

function [ temp ] = e2( s,sof,c )
if nargin == 1
        sof = 3;
    end

rew= round(sof/2);
rew1=rew-1;
[m, n]=size(s);
temp= zeros(m,n);
   for i=rew:(m-rew)
       for j= rew:(n-rew)
           count=0;
           for p=i-rew1:i+rew1 
               for q= j-rew1: j+rew1
                   count=count + s(p,q);
               end
           end
           
           if count < c
               temp (i,j)= 0;
           else
               temp(i,j)=1;
           end
       end
   end

end

