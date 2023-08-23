function [ rim ] = extract_Mary( cip,dwt_typ )
%   EXTRACT 提取
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



[m,n] = size(cip);

% 提升的小波变换
cip=double(cip);
LS=liftwave(dwt_typ,'Int2Int');
[CA3,CH3,CV3,CD3]=lwt2(cip,LS);

CA4 = mod(CA3,a);
CH4 = mod(CH3,b);
CV4 = mod(CV3,c);
CD4 = mod(CD3,d);

rim = CA4*(b*c*d) + CH4*(c*d) + CV4*d + CD4;

end

