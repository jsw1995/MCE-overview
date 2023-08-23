function [ cip ] = embed_Mary( im,cover,dwt_typ )
%   embed 嵌入操作
%   此处显示详细说明

if length(dwt_typ) == 4
    if dwt_typ == 'haar';
        a=3;b=5;c=3;d=6;
    elseif dwt_typ == 'sym2';
        a=1;b=5;c=4;d=13;
    elseif dwt_typ == 'sym4';
        a=1;b=4;c=5;d=13;
    else
        print('在遍历embed2中求取最优的a,b,c,d取值')
        return
    end
elseif length(dwt_typ) == 3
    if dwt_typ == 'db4';
        a=10;b=3;c=3;d=3;
    elseif dwt_typ == 'db1';
        a=3;b=5;c=3;d=6;
    elseif dwt_typ == 'db2';
        a=1;b=5;c=4;d=13;
    elseif dwt_typ == 'bs3';
        a=1;b=4;c=5;d=13;
    elseif dwt_typ == '9.7';
        a=4;b=4;c=4;d=4;
    else
        print('在遍历embed2中求取最优的a,b,c,d取值')
        return
    end
elseif length(dwt_typ) == 5
    if dwt_typ == 'coif2';
        a=1;b=1;c=1;d=256;
    else
        print('在遍历embed2中求取最优的a,b,c,d取值')
        return
    end
elseif length(dwt_typ) == 6
    if dwt_typ == 'cdf4.4';
        a=1;b=4;c=5;d=13;
    else
        print('在遍历embed2中求取最优的a,b,c,d取值')
        return
    end
elseif length(dwt_typ) == 7
    if dwt_typ == 'bior3.7';
        a=10;b=3;c=3;d=3;
    elseif dwt_typ == 'rbio3.7';
        a=3;b=5;c=3;d=6;
    else
        print('在遍历embed2中求取最优的a,b,c,d取值')
        return
    end
else
    print('在遍历embed2中求取最优的a,b,c,d取值')
    return
end



[m,n] = size(cover);
% 修改封面
max1=250;min1=5;
cover(cover>=max1)=max1;
cover(cover<=min1)=min1;

% cover = ceil(5+245/255*cover);

% 提升的小波变换
cover=double(cover);
LS=liftwave(dwt_typ,'Int2Int');
[CA,CH,CV,CD]=lwt2(cover,LS);

% 嵌入
CA1 = floor(im/(b*c*d)) + floor(CA/a)*a;
CH1 = floor(mod(im,(b*c*d))/(c*d)) + floor(CH/b)*b;
CV1 = floor(mod(im,(c*d))/d) + floor(CV/c)*c;
CD1 = mod(im,d) + floor(CD/d)*d;

% 修改
CA2 = correction(CA,CA1,a);
CH2 = correction(CH,CH1,b);
CV2 = correction(CV,CV1,c);
CD2 = correction(CD,CD1,d);

cip = ilwt2(CA2,CH2,CV2,CD2,LS);

end

function [ cip2 ] = correction( cover,cip,a )
%   CORRECTION 修正
%   此处显示详细说明

tem = cip-cover;
cip2 = cip;
cip2(tem < -a/2) = cip(tem < -a/2) + a;
cip2(tem > a/2) = cip(tem > a/2) - a;

end

