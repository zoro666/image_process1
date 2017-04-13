%%%%%%%%%%%%%  Function noiseremoval_lma %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute an image without salt and pepper noise of an original image 
%
% Input Variables:
%      f1     mXn input 2D gray-scale image to be filtered
%      sf     size of filter
% 
% Returned Results:
%     X     new image after opening and closing operation
%
% Processing Flow:
%      1.  Finding the size of the filter,if unspecified then use 3X3.
%      2.  Open the image using opening function
%      3.  Close the image using closing function.
%      4.  Remove the border from the image
% 
%  Restrictions/Notes:
%      This function takes a binary image as input.Zero padding is not done 
%       with the image 
%
%  The following functions are called:
%      open_lma.m    to perform opening on image
%      close_lma.m   to perform closing on image
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        28/01/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ X ] = noiseremoval_lma( f1,sf )

if nargin == 1
        sf = 3;
end
    
f2=open_lma(f1,sf);
X=close_lma(f2,sf);

% This part removes the borders from the image obtained by the offsetting 
% condition from erosion and dilation operation. The size of the border 
% around image is of 4 pixels.

out1=X; 
o=4;
[m,n]=size(out1);
for i=1:m
for j=1:o
out1(i,j)=1;
end
end
for i=1:o
for j=1:n
out1(i,j)=1;
end
end
for i=1:m
for j=(n-o):n
out1(i,j)=1;
end
end

for i=(m-o):m
for j=1:n
out1(i,j)=1;
end
end
X=out1;

end

