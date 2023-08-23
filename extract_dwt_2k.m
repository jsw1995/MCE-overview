function [ rim ] = extract_dwt_2k( cip,dwt_typ )
%EXTRACT_DWT_2K �˴���ʾ�йش˺�����ժҪ
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


% ������С���任
cip=double(cip);
LS=liftwave(dwt_typ,'Int2Int');
[CA3,CH3,CV3,CD3]=lwt2(cip,LS);

CA4 = mod(CA3,2^a);
CH4 = mod(CH3,2^b);
CV4 = mod(CV3,2^c); 
CD4 = mod(CD3,2^d);

rim = CA4*2^(b+c+d)+CH4*2^(c+d)+CV4*2^d+CD4;

end

