%%%%%%%%%%%%%  Function posOfzero %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Computes the position of zeros in mask B 
%
% Input Variables:
%     B    generated hole mask
%      
% Returned Results:
%     p   row value of location of zeros
%     q   column value of location of zeros
% 
% Processing Flow:
%      1.  Find size of the mask and create two empty array.
%      2.  Check for zeros,if present put the row value of the position in 
%          p and column value in q.
% 
%  Restrictions/Notes:
%      This function takes an input of mask and returns the position of
%      zeros in two separate vectors
%
%  The following functions are called:
%      None
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        28/01/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ p,q ] = posOfzero( B )

[m1,n1]=size(B);
p=[];q=[];
for i=1:m1
    for j=1:n1
     if B(i,j)==0
     p=[p i]  ;
     q=[q j] ;
     end
    end
end

end

