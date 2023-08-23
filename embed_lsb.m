function [ cip ] = embed_lsb( im,cover )
%   EMBED_LSB 此处显示有关此函数的摘要
%   此处显示详细说明

[m,n]=size(cover);
% cover = ceil(10+(245-10)/255*cover);
CA = cover(1:m/2,1:n/2);
CH = cover(m/2+1:m,1:n/2);
CV = cover(1:m/2,n/2+1:n);
CD = cover(m/2+1:m,n/2+1:n);

CA2 = floor(im/2^6) + floor(CA/2^2)*2^2;
CH2 = floor(mod(im,2^6)/2^4) + floor(CH/2^2)*2^2;
CV2 = floor(mod(im,2^4)/2^2) + floor(CV/2^2)*2^2;
CD2 = mod(im,2^2) + floor(CD/2^2)*2^2;

cip = [CA2,CV2;CH2,CD2];

end

