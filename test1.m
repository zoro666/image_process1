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
% figure;imshow(f1);title('thresholded image');
% imwrite(f1,'thresholded_image.jpg')
% % use the below code for finding output of hit and miss without removing 
% % salt and pepper noise. Note for using this please comment out part 3)
% % of the program.
% X=f1;figure;imshow(X);title('uncleaned main image');    

f2=erosion(f1,6);
f3=close_lma(f2,6);
figure;imshow(f2)
figure;imshow(f3)