%%%%%%%%%%%%%  Function minksum %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Computes the minksum of image A and mask B 
%
% Input Variables:
%      A    mXn size of a 2-D input image 
%      B    generated hole mask
%       
% Returned Results:
%      C   output of minksum operation of A and B
% 
% Processing Flow:
%      1.  Find the center of the mask.
%      2.  Locate the position of zeros in mask
%      3.  Process the image A part-by-part and return the output of the 
%          logic in image C.
% 
%  Restrictions/Notes:
%      This function takes a binary image as input. The image is not padded 
%      by zeros at the boundary. The process of part-by-part comparison is
%      long which increases the computation
%
%  The following functions are called:
%      posOfzero.m      finds the position of 0's in the mask
%      partofimage.m    extracts part of the image depending on the size of
%                       mask and image
%      count10_lma.m    counting number of 1's in the image
%      checkzeros.m     checking and comparing the position of the 0's of 
%                       the image and mask  
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        28/01/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ C ] = minksum( A,B )

%% finding the center of the mask
[mb,nb]=size(B);
omb=ceil(mb/2);
onb=ceil(nb/2);

%% locating the position of zeros in mask
[m,n]=size(A);
C=zeros(m,n);     % generate a black image C which will be outputed after 
                  % process
[ p,q ] = posOfzero( B );
o=0;

%% Processing part-by-part image A and mask B 
for i=1:(m-mb+1)
for j=1:(n-nb+1)
    M = partofimage( A,B,i,j ); % picking a part of image from A to process
    
    c1 = count10_lma( M );  %counting 1's in part of image of A at 
                            %that instance
 % checking the position of zeros in the particular part with the position 
 % of zeros in mask B. If there is even 1 zero in the position specified by 
 % position in the mask or if the entire part of image is white then return 
 % white in pixel in image C (the location of pixel in image C is decided 
 % from the location which coincides the centre of mask and the part of 
 % main image)  
    c0 = checkzeros( M,p,q ); %check position of zeros
     if (c0>0) 
        o=o+1;
        C((omb+i-1),(onb+j-1))=1; %% putting white at the location
       end
    if (c1 == (mb*nb))
        o=o+1;
        C((omb+i-1),(onb+j-1))=1; %% putting white at the location
    end
    
end
end

end

