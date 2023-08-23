function [ cip ] = embed_svd2( im,cover,dwt_typ )
%   EMBED_SVD 此处显示有关此函数的摘要
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

max1=249;min1=6;
cover(cover>=max1)=max1;
cover(cover<=min1)=min1;
cover=double(cover);
LS=liftwave(dwt_typ,'Int2Int');

[CA,CH,CV,CD]=lwt2(cover,LS);
% 嵌入
[U1,S1,V1]=svd(CA);
[U2,S2,V2]=svd(CH);
[U3,S3,V3]=svd(CV);
[U4,S4,V4]=svd(CD);

CA4 = floor(im/(b*c*d));
CH4 = floor(mod(im,(b*c*d))/(c*d));
CV4 = floor(mod(im,(c*d))/d);
CD4 = mod(im,d);

S11 = CA4 + floor(S1/a)*a + mod(S1,1);
S21 = CH4 + floor(S2/b)*b + mod(S2,1);
S31 = CV4 + floor(S3/c)*c + mod(S3,1);
S41 = CD4 + floor(S4/d)*d + mod(S4,1);

S11 = correction( S1,S11,a );
S21 = correction( S2,S21,b );
S31 = correction( S3,S31,c );
S41 = correction( S4,S41,d );

% CA1 = round(U1*S11*V1');
% CH1 = round(U2*S21*V2');
% CV1 = round(U3*S31*V3');
% CD1 = round(U4*S41*V4');

CA1 = U1*S11*V1';
CH1 = U2*S21*V2';
CV1 = U3*S31*V3';
CD1 = U4*S41*V4';

cip = ilwt2(CA1,CH1,CV1,CD1,LS);

end

function [ cip2 ] = correction( cover,cip,a )
%   CORRECTION 修正
%   此处显示详细说明

tem = cip-cover;
cip2 = cip;
cip2(tem < -a/2) = cip(tem < -a/2) + a;
cip2(tem > a/2) = cip(tem > a/2) - a;

end
