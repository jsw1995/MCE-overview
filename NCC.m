function [ a ] = NCC( im1,im2 )
%   NCC 此处显示有关此函数的摘要
%   此处显示详细说明

im1=double(im1);im2=double(im2);
mean_im1 = mean(mean(im1));
mean_im2 = mean(mean(im2));
tem1 = im1-mean_im1;
tem2 = im2-mean_im2;
a = sum(tem1.*tem2)/( sqrt(sum(tem1.^2)).*sqrt(sum(tem2.^2)) );

end

