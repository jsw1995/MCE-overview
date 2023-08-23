function [ cip ] = embed_bezi( im,cover,t,dwt_typ )
%   EMBED_ �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

[m,n]=size(im);
[ll,lh,hl,hh]=dwt2(cover,dwt_typ);  %db4���Ǳ�Ϊ1/4�������ע��
sph = hh;
sph(1:m,1:n) = (1-t)*hh(1:m,1:n)+t*im;
cip = idwt2(ll,lh,hl,sph,dwt_typ);

cip = round(cip);

end

