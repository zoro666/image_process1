%%%%%%%%%%%%%  Function hitandmiss_small %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Computes image with smallest disk from the original image 
%
% Input Variables:
%      X    mXn input 2D gray-scale image 
%      As   Generated disk/mask (A) for smallest disk 
%      Bs   Generated w-a mask (B) for smallest disk
% 
% Returned Results:
%      small     Generated image with smallest disk only
%
% Processing Flow:
%      1.  Counnt 1's and 0's in the masks As abd Bs.
%      2.  Compute minksub of image and mask A by inputing number of 
%           1's in mask A
%      3.  Compute minksum of image and mask B
%      4.  Compare the image ouput from minkum and minksub.The output will 
%          be small dots in place of smallest disk
%      5.  Magnify those dots
%      6.  Compare the size with that of original 
%          image to get the perfect shape.
%      
%  Restrictions/Notes:
%      This function takes a binary image as input. Magfnification is done
%      for 5 times to get original image.
%
%  The following functions are called:
%      count10_lma.m    Count number of 1's and o's in the mask
%      e2.m             Compute minksub operation by inputing count of 1's
%                       from the mask to be used for operation
%      minksum.m        Compute minksum of image and mask B
%      compare_lma.m    Compares the 2 images with same size 
%      magnify_lma.m    Magnifies the dots in the image(dilation)
%      maginfy2_lma.m   Magnifies the dots in the image and removes the
%                       black boundary from the image
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        28/01/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ small ] = hitandmiss_small( X,As,Bs )
%% count number of 1's and 0's in the mask used

[c1As,c0As,ras,cas]=count10_lma(As);
[c1Bs,c0Bs,rbs,cbs]=count10_lma(Bs);
disp('counted number of 1 and 0 in mask of smaller disk')

%% computing hit and miss for smallest disk

temp=e2(X,ras,c1As);  %% computing X minksub A using number of 1's in A
disp('computed minksub of image X with A')
temp2=minksum(X,Bs);   %% computing X minksum B
disp('computed minksum of image X with B')

%% Comapre and magnify the result to get desired result

out=compare_lma(temp,temp2);   % compare the result of minksum and minksub
small=magnify_lma(out,5);      % magnify image  
for loop1=1:3
small=magnify_lma(small,5);
end
small=magnify2_lma(small,5);   % magnify and remove the black boundary 
                               % obtained due to magnify function as well
small=compare_lma(X,small);    % compare with image X to get desired shape 


end

