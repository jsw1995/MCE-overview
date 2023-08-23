function [ cip ] = embed_bezi( im,cover,t,dwt_typ )
%   EMBED_ 此处显示有关此函数的摘要
%   此处显示详细说明

[m,n]=size(im);
[ll,lh,hl,hh]=dwt2(cover,dwt_typ);  %db4不是变为1/4，比这大，注意
sph = hh;
sph(1:m,1:n) = (1-t)*hh(1:m,1:n)+t*im;
cip = idwt2(ll,lh,hl,sph,dwt_typ);

cip = round(cip);

end

