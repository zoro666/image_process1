%%%%%%%%%%%%%  Function count10_lma %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Counts the number of 1's and 0's in the filter/mask 
%
% Input Variables:
%      X    rXcl input mask 
% 
% Returned Results:
%      c1     Number of 1's
%      c0     Number of 0's
%       r     length of row of mask
%       cl    length of column of mask
% 
% Processing Flow:
%      1.  Counnt 1's by adding all the pixel value(since pixels are just 
%          1's and 0's the result will always be number of 1's in this case)
%      2.  Subtract the number of 1's from total number of pixels
%      3.  If the output argument is just 1 then return the number of 1's
%      
%  Restrictions/Notes:
%      This function takes a matrix of 1's and 0's. 
%
%  The following functions are called:
%      None
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        28/01/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ c1,c0,r,cl ] = count10_lma( X )

[r,cl]=size(X);

% % %  counting 1's in X
c=0;
for i = 1:r
    for j= 1:cl
        c=c+X(i,j);
    end
end
c1=c; 
c0=(r*cl)-c1;  %   counting 0's in X

% If number of output arguments is 1 then return value of c1(number of 1's)
if nargout == 1
    c1=c1;
end

end

