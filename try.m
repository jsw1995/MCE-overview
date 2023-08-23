clc;clear all;close all;clear;
% 
% im = imread('date/5.bmp');
% im = double(imresize(im,[256,256]));
% num = 1;
% 
% imwrite(uint8(im),strcat(strcat('cip110/',str(num)),'.bmp'))
aa=[1,0,1,1,0,0,0,1,1,1;
    1,0,0,0,1,1,0,0,1,1];
out=rand(2,10);

figure(1)
plotroc(aa,out,['cat','dog'])