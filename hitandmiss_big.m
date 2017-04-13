%%%%%%%%%%%%%  Function hitandmiss_big %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Computes image with biggest disk from the original image 
%
% Input Variables:
%      X    mXn input 2D gray-scale image 
%      Ab   Generated disk/mask (A) for largest disk 
%      Bb   Generated w-a mask (B) for largest disk
% 
% Returned Results:
%      big     Generated image with largest disk only
%
% Processing Flow:
%      1.  Counnt 1's and 0's in the masks As abd Bs.
%      2.  Compute minksub of image and mask A by inputing number of 
%           1's in mask A
%      3.  Compute minksum of image and mask B
%      4.  Compare the image ouput from minkum and minksub.The output will  
%          be small dots in place of largest disk
%      5.  Magnify those dots
%      6.  Compare the size with that of original 
%          image to get the perfect shape.
%      
%  Restrictions/Notes:
%      This function takes a binary image as input. Magfnification is done
%      for 15 times to get original image.
%
%  The following functions are called:
%      count10_lma.m    Count number of 1's and o's in the mask
%      e2.m             Compute minksub operation by inputing count of 1's
%                       from the mask to be used for operation
%      minksum.m        Compute minksum of image and mask B
%      compare_lma.m    Compares the 2 images with same size 
%      maginfy2_lma.m   Magnifies the dots in the image and removes the
%                       black boundary from the image
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        28/01/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ big ] = hitandmiss_big(  X,Ab,Bb )
%% count number of 1's and 0's in the mask used

[c1Ab,c0Ab,rab,cab]=count10_lma(Ab);
[c1Bb,c0Bb,rbb,cbb]=count10_lma(Bb);
disp('counted number of 1 and 0 in mask of bigger disk')
%% computing hit and miss for biggest disk
temp=e2(X,rab,c1Ab); %%% computing X minksub A
disp('computed minksub of image X with A')
temp2=minksum(X,Bb);   %% computing X minksum B
disp('computed minksum of image X with B')

%% Comapre and magnify the result to get desired result

out=compare_lma(temp,temp2); % compare the result of minksum and minksub
big=magnify2_lma(out,5); % magnify image
for loop=1:14
  big=magnify2_lma(big,5);  
end
big=compare_lma(X,big);  % compare with image X to get desired shape


end

