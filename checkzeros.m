%%%%%%%%%%%%%  Function checkzeros %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Computes whether zero is present in the particular location in image 
%
% Input Variables:
%      M    part of the image extracted 
%      p    row location of zero pixel of the mask (row location vector)
%      q    column location of zero pixel of the mask(column location vector)
% 
% Returned Results:
%      c0   count of 0 in from the image
% 
% Processing Flow:
%      1.  Initialise c0 to zero.
%      2.  Check the location of zero from the specified location from 
%          row and column vectors.
%      3.  If zero occurs increase value of c0 and break the loop
% 
%  Restrictions/Notes:
%      This function input of the row and column location from posOfzero
%      function called prior to this function in a function.
%
%  The following functions are called:
%     None
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        28/01/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ c0 ] = checkzeros( M,p,q )

 c0=0;
    for k=1:length(p)
        if M(p(k),q(k)) == 0
        c0=c0+1  ;   %if a zero is present then increase the count and 
                     % break loop
        break
        end
    
    end

end

