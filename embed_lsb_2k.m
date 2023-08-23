function [ cip ] = embed_lsb_2k( im,cover )
%EMBED_LSB_2K 此处显示有关此函数的摘要
%   此处显示详细说明

[m,n]=size(cover);

CA = cover(1:m/2,1:n/2);
CH = cover(m/2+1:m,1:n/2);
CV = cover(1:m/2,n/2+1:n);
CD = cover(m/2+1:m,n/2+1:n);

CA2 = floor(im/(4*4*4)) + floor(CA/4)*4;
CH2 = floor(mod(im,(4*4*4))/(4*4)) + floor(CH/4)*4;
CV2 = floor(mod(im,(4*4))/4)  + floor(CV/4)*4;
CD2 = mod(im,4) + floor(CD/4)*4;

cip = [CA2,CV2;CH2,CD2];
% 修正
cip = correction( cover,cip );

end

function [ cip2 ] = correction( cover,cip )
%   CORRECTION 修正
%   此处显示详细说明
e = 4;
tem = cip-cover;
cip2 = cip;
cip2(tem < -e/2) = cip(tem < -e/2) + e;
cip2(tem > e/2) = cip(tem > e/2) - e;
% 整数嵌入需要注意不要超范围
cip2(cip2 < 0) = cip(cip2 < 0);
cip2(cip2 > 255) = cip(cip2 > 255);

end
