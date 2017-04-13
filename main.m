%%%%%%%%%%%%% main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      To identify biggest and smallest disk from image  
%
% Input Variables:
%      f       input 2D image
%      sf      size of filter to remove noise
% Returned Results:
%      Y      (Desired output)An image with only biggest and smallest disks
%      big    An image with only biggest disks
%      small  An image with only smallest disks
%      X       cleaned image from salt pepper noise
%      f1      thresholded image
%      As,Ab   structuring element A for smaller and bigger disk
%              respectively
%      Bs,Bb   structuring element W-A for smaller and bigger disk
%              respectively
% Processing Flow:
%      1.  Load, convert input image to 8 bit gray image and display it.
%      2.  Compute thresholded image
%      3.  Remove salt and pepper noise from the image
%      4.  Generate disk and hole structuring elements for the biggest and 
%          smallest disk
%      5.  Compute hit and miss transform for the smallest disk
%      6.  Compute hit and miss transform for the biggest disk 
%      7.  Generate the required image with biggest and smallest disk
% 
%  Restrictions/Notes:
%      This function requires an 8-bit image as input. The hit and miss
%      tranform for the biggest disk has large computation which requires
%      most of the time. Output is a binary image. By changing a part of
%      code we can get the output image when noisy input is used.
% 
%  Warning : Might take few minutes for the whole code to run depending
%  upon the system configuration
%
%  The following functions are called:
%      threshold_lma.m       returns image with thresholded value to 1(white)
%                         and 0(black)
%      noiseremoval_lma.m    filter to remove salt and pepper noise
%      disk_lma.m            create structuring element A as shown 
%                         from lecture notes  
%      hole_lma.m            create structuring element W-A as shown 
%                         from lecture notes
%      hitandmiss_small.m returns output of hit and miss for smallest disk
%      hitandmiss_big.m   returns output of hit and miss for biggest disk
%      addimages_lma.m    returns the output as addition of two images with
%                         smallest and largest disk
%         
%
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        28/01/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;clear all;clear;      % Clear out all memory 

% 1) Read in image "RandomDisks-P10.jpg" into array "f", get 2D dimensions,
%  and display it on the screen
% "RandomDisks-P10.jpg" is needed in the directory of this .m file

f=imread('RandomDisks-P10.jpg');
f=rgb2gray(f);
disp('read input image and convert to 2-D image')
figure;imshow(f);title('input image');

%%  2) thresholding to 0 and 1
f1=threshold_lma(f); 
disp('thresholded image')
figure;imshow(f1);title('thresholded image');
imwrite(f1,'thresholded_image.jpg')
% % use the below code for finding output of hit and miss without removing 
% % salt and pepper noise. Note for using this please comment out part 3)
% % of the program.
% X=f1;figure;imshow(X);title('uncleaned main image');    

%% 3) filtering the salt pepper noise. Comment this part if image with 
% noise is used
sf=3;   %% size of the filter to remove noise;size has to be atleast 3
X=noiseremoval_lma(f1,sf); %% image to be processed, X
imwrite(X,'withoutnoise.jpg')
disp('removed noise')
figure;imshow(X);title('cleaned main image');

%% 4) generating disk and hole for small and big disk
disp('generating masks..')
As=disk_lma(8); %% Generated disk A for smallest disk
Ab=disk_lma(31); %% Generated disk A for biggest disk
Bs=hole_lma(10); %% Generated w-a mask (B) for smallest disk
Bb=hole_lma(36); %% Generated w-a mask (B) for biggest disk

%% 5) computing hit and miss for smallest disk
disp('computing hit and miss for smaller disk..')
small = hitandmiss_small( X,As,Bs );
% imtool(small);title('smallest disk');
figure;imshow(small);title('smallest disk');
imwrite(small,'smallest_disk.jpg')
%% 6) computing hit and miss for biggest disk
disp('computing hit and miss for bigger disk..')
big = hitandmiss_big(  X,Ab,Bb );
% imtool(big);title('biggest disk');
figure;imshow(big);title('biggest disk');
imwrite(big,'biggest_disk.jpg')
%% 7) creating required image of smaller and bigger disk
disp('generating the required image..')
Y = addimages_lma(small,big);
% imtool(Y);title('desired image');
figure;imshow(Y);title('desired image');
imwrite(Y,'desired_image.jpg') %% create a desired image file
% imwrite(Y,'output_from_noiseyinput.jpg') %% use when noiseremoval is not done
disp('finish')
% %%%%%%%%%%%%% End of the main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

