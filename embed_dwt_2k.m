function [ cip ] = embed_dwt_2k( im,cover,dwt_typ )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

if length(dwt_typ) == 4
    if dwt_typ == 'haar';
        a=1;b=2;c=2;d=3;
    elseif dwt_typ == 'sym4';
        a=0;b=2;c=2;d=4;
    elseif dwt_typ == 'sym2';
        a=0;b=2;c=2;d=4;
    else
        print('ʹ�ñ���embed������ȡ����a,b,c,dȡֵ')
        return
    end
elseif length(dwt_typ) == 3
    if dwt_typ == 'db4';
        a=3;b=2;c=2;d=1;
    elseif dwt_typ == 'db1';
        a=1;b=2;c=2;d=3;
    elseif dwt_typ == 'db2';
        a=0;b=2;c=2;d=4;
    elseif dwt_typ == 'bs3';
        a=0;b=2;c=2;d=4;
    elseif dwt_typ == '9.7';
        a=2;b=2;c=2;d=2;
    else
         print('ʹ�ñ���embed������ȡ����a,b,c,dȡֵ')
        return
    end
elseif length(dwt_typ) == 5
    if dwt_typ == 'coif2';
        a=0;b=0;c=1;d=7;
    else
         print('ʹ�ñ���embed������ȡ����a,b,c,dȡֵ')
        return
    end
elseif length(dwt_typ) == 6
    if dwt_typ == 'cdf4.4';
        a=0;b=2;c=2;d=4;
    else
         print('ʹ�ñ���embed������ȡ����a,b,c,dȡֵ')
        return
    end
elseif length(dwt_typ) == 7
    if dwt_typ == 'bior3.7';
        a=3;b=2;c=2;d=1;
    elseif dwt_typ == 'rbio3.7';
        a=1;b=2;c=2;d=3;
    else
         print('ʹ�ñ���embed������ȡ����a,b,c,dȡֵ')
        return
    end
else
     print('ʹ�ñ���embed������ȡ����a,b,c,dȡֵ')
    return
end



% �޸ķ���
max1=250;min1=5;
cover(cover>max1)=max1;
cover(cover<min1)=min1;

% ������С���任
cover=double(cover);
LS=liftwave(dwt_typ,'Int2Int');
[CA,CH,CV,CD]=lwt2(cover,LS);

% Ƕ��
CA2 = floor(im/2^(b+c+d)) + floor(CA/2^a)*2^a;
CH2 = floor(mod(im,2^(b+c+d))/2^(c+d)) + floor(CH/2^b)*2^b;
CV2 = floor(mod(im,2^(c+d))/2^d) + floor(CV/2^c)*2^c;
CD2 = mod(im,2^d) + floor(CD/2^d)*2^d;
% �޸�
CA2 = correction(CA,CA2,a);
CH2 = correction(CH,CH2,b);
CV2 = correction(CV,CV2,c);
CD2 = correction(CD,CD2,d);

cip = ilwt2(CA2,CH2,CV2,CD2,LS);

end



function [ cip2 ] = correction( cover,cip,a )
%   CORRECTION ����
%   �˴���ʾ��ϸ˵��

a = 2^a;
tem = cip-cover;
cip2 = cip;
cip2(tem < -a/2) = cip(tem < -a/2) + a;
cip2(tem > a/2) = cip(tem > a/2) - a;

end
