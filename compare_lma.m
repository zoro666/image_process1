%%%%%%%%%%%%%  Function compare_lma %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Computes two images 
%
% Input Variables:
%      temp2    mXn size of a 2-D input image 
%      temp3    mXn size of a 2-D input image
% 
% Returned Results:
%      temps   mXn size of a 2-D ouput image
% 
% Processing Flow:
%      1.  Create a mXn temps image with gray level 1(white).
%      2.  Check pixel by pixel grey value of two image.
%      3.  If grey level in both images are zero then put zero in the
%      particular pixel of image temps
% 
%  Restrictions/Notes:
%      This function inputs 2 binary images
%
%  The following functions are called:
%     None
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        28/01/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ temps ] = compare_lma( temp2,temp3 )

[m,n]=size(temp2);
temps=ones(m,n);

for i=1:m
    for j=1:n
        if (temp2(i,j)== 0) && (temp3(i,j) == 0)
            temps(i,j) = 0;
        end
        end
end

end

