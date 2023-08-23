clc;clear all;close all;clear;

im = imread('date/5.bmp');
im = double(imresize(im,[256,256]));
cover = double(imread('date/6.bmp'));
key='8d5ab8ba5340fce4420829ad5d12a0e45dacb0858544163d04c1d02b73e3697d';
dwt_typ='haar';

path_file = 'date\';
fileExt = '*.bmp';  %待读取图像的后缀名
%获取所有路径
plain_files = dir(fullfile(path_file,fileExt)); 
plain_len1 = size(plain_files,1);
im = imread(strcat(path_file,plain_files(1).name));

figure(1)
imshow(uint8(im))


% % dwt_2k
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip ] = embed_dwt_2k( tcip,cover,dwt_typ );
% [ rtcip ] = extract_dwt_2k( cip,dwt_typ );
% [ rim ] = noise_den1( rtcip,key_pre );
% imwrite(uint8(cip(230:280,50:100)),'cip1/13.bmp')
% imwrite(uint8(cip),'cip1/23.bmp')
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% ncc1 = NCC(uint8(cip),uint8(cover));
% 
% figure(1)
% imshow(uint8(im))
% figure(2)
% imshow(uint8(tcip))
% figure(3)
% imshow(uint8(cip))
% 
% figure(11)
% imshow(uint8(cip(230:280,50:100)))
% 
% figure(4)
% imshow(uint8(rim))