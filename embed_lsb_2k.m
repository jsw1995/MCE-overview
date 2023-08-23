function [ cip ] = embed_lsb_2k( im,cover )
%EMBED_LSB_2K �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

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
% ����
cip = correction( cover,cip );

end

function [ cip2 ] = correction( cover,cip )
%   CORRECTION ����
%   �˴���ʾ��ϸ˵��
e = 4;
tem = cip-cover;
cip2 = cip;
cip2(tem < -e/2) = cip(tem < -e/2) + e;
cip2(tem > e/2) = cip(tem > e/2) - e;
% ����Ƕ����Ҫע�ⲻҪ����Χ
cip2(cip2 < 0) = cip(cip2 < 0);
cip2(cip2 > 255) = cip(cip2 > 255);

end
