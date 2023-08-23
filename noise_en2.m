function [ cip,dnkey,min_p3,max_p3,cr ] = noise_en2( im,key )
%ENCRYPTION 此处显示有关此函数的摘要
%   此处显示详细说明
[m,n]=size(im);
% 动态密钥生成
dnkey = dkey( im,key );
% fourr1=dnkey(1);fourr2=dnkey(2);fourr3=dnkey(3);fourr4=dnkey(4);

catx0=dnkey(5);caty0=dnkey(6);catz0=dnkey(7);
cr = 0.5;
% 离散化
p1 = dct2(im);
% 压缩
[ x,y,z ] = CAT( catx0,caty0,catz0,cr*m*m );
x = reshape(1-2*x,[cr*m,m]);
y = reshape(1-2*y,[cr*m,m]);
fai1 = sqrt(2/(cr*m))*x;
fai2 = sqrt(2/(cr*m))*y;
fai1(:, 1:cr * m) =fai1(:, 1:cr * m) * 100;
fai1 = orth(fai1')';
fai2(:, 1:cr * n) = fai2(:, 1:cr * n) * 100;
fai2 = orth(fai2')';
p2 = fai1*p1*fai2';
% 置乱
p3 = scrambling( p2,z );
% 量化
min_p3 = min(min(p3));
max_p3 = max(max(p3));
cip = round((p3-min_p3)/(max_p3-min_p3)*255);
% cip = (p3-min_p3)/(max_p3-min_p3)*255;

end

function [ dnkey ] = dkey( p,key )
%   DKEY 动态密钥生成
%   p明文，key动态密钥 

x = ones(1,256);
sha_p = SHA(p,'SHA-256');
for i=1:32  %hex2dec只能到2^52，所以运用循环每8位来一次，也可以其他位数
    tem = ones(1,8);
    sn = dec2bin(hex2dec(sha_p((i-1)*2+1:(i-1)*2+2)),8);   
    kn = dec2bin(hex2dec(key((i-1)*2+1:(i-1)*2+2)),8);
    tem(sn==kn) = 0;
    x((i-1)*8+1:(i-1)*8+8) = tem;
end

fourr1=0;fourr2=0;fourr3=0;fourr4=0;
% for i=1:52
%     fourr1 = fourr1 + x(i)*2^(-i);
%     fourr2 = fourr2 + x(i+52)*2^(-i);
%     fourr3 = fourr3 + x(i+104)*2^(-i);
%     fourr4 = fourr4 + x(i+156)*2^(-i);
% end

catx0=0;caty0=0;catz0=0;
for i = 1:16
    catx0=catx0+x(i+208)*2^(-i);
    caty0=caty0+x(i+224)*2^(-i);
    catz0=catz0+x(i+240)*2^(-i);
end

dnkey = [fourr1,fourr2,fourr3,fourr4,catx0,caty0,catz0];

end

function h = SHA(inp,meth)
% HASH - Convert an input variable into a message digest using any of
%        several common hash algorithms
%
% USAGE: h = hash(inp,'meth')
%
% inp  = input variable, of any of the following classes:
%        char, uint8, logical, double, single, int8, uint8,
%        int16, uint16, int32, uint32, int64, uint64
% h    = hash digest output, in hexadecimal notation
% meth = hash algorithm, which is one of the following:
%        MD2, MD5, SHA-1, SHA-256, SHA-384, or SHA-512
%
% NOTES: (1) If the input is a string or uint8 variable, it is hashed
%            as usual for a byte stream. Other classes are converted into
%            their byte-stream values. In other words, the hash of the
%            following will be identical:
%                     'abc'
%                     uint8('abc')
%                     char([97 98 99])
%            The hash of the follwing will be different from the above,
%            because class "double" uses eight byte elements:
%                     double('abc')
%                     [97 98 99]
%            You can avoid this issue by making sure that your inputs
%            are strings or uint8 arrays.
%        (2) The name of the hash algorithm may be specified in lowercase
%            and/or without the hyphen, if desired. For example,
%            h=hash('my text to hash','sha256');
%        (3) Carefully tested, but no warranty. Use at your own risk.
%        (4) Michael Kleder, Nov 2005
%
% EXAMPLE:
%
% algs={'MD2','MD5','SHA-1','SHA-256','SHA-384','SHA-512'};
% for n=1:6
%     h=hash('my sample text',algs{n});
%     disp([algs{n} ' (' num2str(length(h)*4) ' bits):'])
%     disp(h)
% end

inp=inp(:);
% convert strings and logicals into uint8 format
if ischar(inp) || islogical(inp)
    inp=uint8(inp);
else % convert everything else into uint8 format without loss of data
    inp=typecast(inp,'uint8');
end

% verify hash method, with some syntactical forgiveness:
meth=upper(meth);
switch meth
    case 'SHA1'
        meth='SHA-1';
    case 'SHA256'
        meth='SHA-256';
    case 'SHA384'
        meth='SHA-384';
    case 'SHA512'
        meth='SHA-512';
    otherwise
end
algs={'MD2','MD5','SHA-1','SHA-256','SHA-384','SHA-512'};
if isempty(strcmp(algs,meth))
    error(['Hash algorithm must be ' ...
        'MD2, MD5, SHA-1, SHA-256, SHA-384, or SHA-512']);
end

% create hash
x=java.security.MessageDigest.getInstance(meth);
x.update(inp);
h=typecast(x.digest,'uint8');
h=dec2hex(h)';
if(size(h,1))==1 % remote possibility: all hash bytes  128, so pad:
    h=[repmat('0',[1 size(h,2)]);h];
end
h=lower(h(:)');
clear x
return
end

function [ x,y,z ] = CAT( x0,y0,z0,l )
%   3DCAT 此处显示有关此函数的摘要
%   

x = ones(1,l);
y = ones(1,l);
z = ones(1,l);
x(1) = x0;
y(1) = y0;
z(1) = z0;

for i=1:l+1000
    x(i+1)=mod(4.1*x(i)+1.2*y(i)+5.3*z(i),1);
    y(i+1)=mod(15.4*x(i)+4.5*y(i)+17.6*z(i),1);
    z(i+1)=mod(9.7*x(i)+2.8*y(i)+12.9*z(i),1);
end

x = x(1001:l+1000);
y = y(1001:l+1000);
z = z(1001:l+1000);

end

function [ cip ] = scrambling( im,r )
%   scrambling 置乱
%   此处显示详细说明

[m,n]=size(im);
t1=reshape(im,1,m*n);
[~, ind] = sort(r(1:m*n));

t2 = t1;
for i=1:m*n
    t2(i)=t1(ind(i));
end

cip = reshape(t2,m,n);

end


