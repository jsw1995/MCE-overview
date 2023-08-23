function [ cip, key_pre ] = noise_en1( p, key )
%   NOISE_EN 此处显示有关此函数的摘要
%   分解基为4、4、4、4的类噪声加密

[m,n] = size(p);

key = SHA(key,'SHA-256');
key_pre = dkey( p,key );

p_min = key_pre(1);
a = key_pre(2);b = key_pre(3);c = key_pre(4);d = key_pre(5);
p1 = p-p_min;
ma = floor(p1/(b*c*d));
mb = floor(mod(p1,(b*c*d))/(c*d));
mc = floor(mod(p1,(c*d))/d);
md = mod(p1,d);
x0 = key_pre(6);y0 = key_pre(7);z0 = key_pre(8);w0 = key_pre(9);

[x,y,z,w] = DCSLE(x0,y0,z0,w0,m*n);
[~, x_sort] = sort(x);
[~, y_sort] = sort(y);
[~, z_sort] = sort(z);
[~, w_sort] = sort(w);
% 置乱
ma1 = scrambling( ma,x_sort );
mb1 = scrambling( mb,y_sort );
mc1 = scrambling( mc,z_sort );
md1 = scrambling( md,w_sort );
% 置换
ma2 = mod(ma1+reshape(x_sort,m,n),a);
mb2 = mod(mb1+reshape(y_sort,m,n),b);
mc2 = mod(mc1+reshape(z_sort,m,n),c);
md2 = mod(md1+reshape(w_sort,m,n),d);

cip = ma2*(b*c*d) + mb2*(c*d) + mc2*d + md2;

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

function key_pre = dkey( p,key )
%   DKEY 动态密钥生成
%   p明文，key动态密钥 

% 这里为了统一对比，类噪声密文都为1到255均匀分布基底都变为4,最值默认为0和255
% pmin = min(min(p));
% pmax = max(max(p));
% pgap = pmax-pmin+1;

% if pgap>=253
%     a=3;b=5;c=3;d=6;
% elseif 217<=pgap<=252
%     a=3;b=4;c=3;d=7;
% elseif 190<=pgap<=216
%     a=3;b=4;c=3;d=6;
% elseif 163<=pgap<=189
%     a=3;b=3;c=3;d=7;    
% elseif 2<=pgap<=162
%     a=3;b=3;c=3;d=6;
% else
%     a=1;b=1;c=1;d=2;
% end


pmin = 0;
a=4;b=4;c=4;d=4;

x = ones(1,256);
sha_p = SHA(p,'SHA-256');
for i=1:32  %hex2dec只能到2^52，所以运用循环每8位来一次，也可以其他位数
    tem = ones(1,8);
    sn = dec2bin(hex2dec(sha_p((i-1)*2+1:(i-1)*2+2)),8);   
    kn = dec2bin(hex2dec(key((i-1)*2+1:(i-1)*2+2)),8);
    tem(sn==kn) = 0;
    x((i-1)*8+1:(i-1)*8+8) = tem;
end

fouro1=0;fouro2=0;fouro3=0;fouro4=0;
for i = 1:52
    fouro1=fouro1+x(i)*2^(-i);
    fouro2=fouro2+x(i+52)*2^(-i);
    fouro3=fouro3+x(i+104)*2^(-i);
    fouro4=fouro4+x(i+156)*2^(-i);
end

fourm1=0;fourm2=0;fourm3=0;fourm4=0;
for i = 1:12
    fourm1=fourm1+x(i+208)*2^(-i);
    fourm2=fourm2+x(i+220)*2^(-i);
    fourm3=fourm3+x(i+232)*2^(-i);
    fourm4=fourm4+x(i+244)*2^(-i);
end

four1=mod(fouro1*fourm1,1);
four2=mod(fouro2*fourm2,1);
four3=mod(fouro3*fourm3,1);
four4=mod(fouro4*fourm4,1);

key_pre = [ pmin,a,b,c,d,four1,four2,four3,four4 ];

end

function [ x1,x2,x3,x4 ] = DCSLE( x10,x20,x30,x40,L )
%   DCSLE四维离散混沌
%   此处显示详细说明

x1 = [];x2= [];x3 = [];x4=[];
x1(1)=x10;x2(1)=x20;x3(1)=x30;x4(1)=x40;

for i=1:L+1000
    x1(i+1)=sin(x4(i))+sin(x1(i)*x3(i)+x1(i)+x2(i));
    x2(i+1)=sin(x2(i))-sin(x1(i));
    x3(i+1)=sin(x1(i))+sin(x1(i)*x3(i));
    x4(i+1)=2*sin(x2(i)+x4(i));
end

x1=x1(1001:L+1000);
x2=x2(1001:L+1000);
x3=x3(1001:L+1000);
x4=x4(1001:L+1000);

end

function [ cip ] = scrambling( im,r )
%   scrambling 置乱
%   此处显示详细说明

[m,n]=size(im);
t1=reshape(im,1,m*n);
% [~, ind] = sort(r(1:m*n));

for i=1:m*n
    t2(i)=t1(r(i));
end

cip = reshape(t2,m,n);

end
