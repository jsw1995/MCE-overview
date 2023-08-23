function [ rim ] = extract_svd2( cip,cover,dwt_typ )
%   EXTRACT_SVD 此处显示有关此函数的摘要
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
[CA1,CH1,CV1,CD1]=lwt2(cip,LS);

[U1,S1,V1]=svd(CA);
[U11,S11,V11]=svd(CA1);
[U2,S2,V2]=svd(CH);
[U21,S21,V21]=svd(CH1);
[U3,S3,V3]=svd(CV);
[U31,S31,V31]=svd(CV1);
[U4,S4,V4]=svd(CD);
[U41,S41,V41]=svd(CD1);

US1 = U1'*U11;VS1 = V1'*V11;
US2 = U2'*U21;VS2 = V2'*V21;
US3 = U3'*U31;VS3 = V3'*V31;
US4 = U4'*U41;VS4 = V4'*V41;

S11 = US1*S11*VS1';
S21 = US2*S21*VS2';
S31 = US3*S31*VS3';
S41 = US4*S41*VS4';

% CA4 = round( S11 - (floor(S1/a)*a + mod(S1,1)) );
% CH4 = round( S21 - (floor(S2/b)*b + mod(S2,1)) );
% CV4 = round( S31 - (floor(S3/c)*c + mod(S3,1)) );
% CD4 = round( S41 - (floor(S4/d)*d + mod(S4,1)) );

CA4 =  round( mod(abs(S11-mod(S1,1)),a) );
CH4 =  round( mod(abs(S21-mod(S2,1)),b) );
CV4 =  round( mod(abs(S31-mod(S3,1)),c) );
CD4 =  round( mod(abs(S41-mod(S4,1)),d) );

rim = CA4*(b*c*d) + CH4*(c*d) + CV4*d + CD4;

end
