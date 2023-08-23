function [ rp ] = noise_den1( cip,key_pre )
%NOISE_DEN1 此处显示有关此函数的摘要
%   此处显示详细说明

[m,n]=size(cip);
p_min = key_pre(1);
a = key_pre(2);b = key_pre(3);c = key_pre(4);d = key_pre(5);
ma = floor(cip/(b*c*d));
mb = floor(mod(cip,(b*c*d))/(c*d));
mc = floor(mod(cip,(c*d))/d);
md = mod(cip,d);

x0 = key_pre(6);y0 = key_pre(7);z0 = key_pre(8);w0 = key_pre(9);
[x,y,z,w] = DCSLE(x0,y0,z0,w0,m*n);
[~, x_sort] = sort(x);
[~, y_sort] = sort(y);
[~, z_sort] = sort(z);
[~, w_sort] = sort(w);
% 解置换
ma1 = mod(ma - reshape(x_sort,m,n),a);
mb1 = mod(mb - reshape(y_sort,m,n),b);
mc1 = mod(mc - reshape(z_sort,m,n),c);
md1 = mod(md - reshape(w_sort,m,n),d);
% 解置乱
ma2 = dscrambling( ma1,x_sort );
mb2 = dscrambling( mb1,y_sort );
mc2 = dscrambling( mc1,z_sort );
md2 = dscrambling( md1,w_sort );

rp1 = ma2*(b*c*d) + mb2*(c*d) + mc2*d + md2;
rp = rp1 + p_min;

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

function [ rim ] = dscrambling( cip,r )
%   DSCRAMBLING 解置乱
%   此处显示详细说明

[m,n]=size(cip);
t1=reshape(cip,1,m*n);
% [~, ind] = sort(r(1:m*n));

for i=1:m*n
    t2(r(i))=t1(i);
end

rim = reshape(t2,m,n);

end
