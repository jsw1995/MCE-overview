function [ rim ] = noise_den2( cip,dnkey,min_p3,max_p3,cr )
%   DENCRYPTION 此处显示有关此函数的摘要
%   此处显示详细说明

[m,n]=size(cip);
m=m/cr;n=n/cr;
% 密钥
% fourr1=dnkey(1);fourr2=dnkey(2);fourr3=dnkey(3);fourr4=dnkey(4);
catx0=dnkey(5);caty0=dnkey(6);catz0=dnkey(7);

% 反向量化
p3 = cip/255 * (max_p3-min_p3) + min_p3;
% 反向置乱
[ x,y,z ] = CAT( catx0,caty0,catz0,cr*m*m );
p2 = dscrambling( p3,z );
% 重构
x = reshape(1-2*x,[cr*m,m]);
y = reshape(1-2*y,[cr*m,m]);
fai1 = sqrt(2/(cr*m))*x;
fai2 = sqrt(2/(cr*m))*y;
fai1(:, 1:uint16(cr * m)) =fai1(:, 1:uint16(cr * m)) * 100;
fai1 = orth(fai1')';
fai2(:, 1:uint16(cr * n)) = fai2(:, 1:uint16(cr * n)) * 100;
fai2 = orth(fai2')';
p1 = sl0_2d( p2,fai1,fai2' );
% 小波逆变换
rim = idct2(p1);

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


function [ rim ] = dscrambling( cip,r )
%   DSCRAMBLING 解置乱
%   此处显示详细说明

[m,n]=size(cip);
t1=reshape(cip,1,m*n);
[~, ind] = sort(r(1:m*n));

t2=t1;
for i=1:m*n
    t2(ind(i))=t1(i);
end

rim = reshape(t2,m,n);

end

function [ rim ] = sl0_2d( y,A,B )
%   SL0_2D 此处显示有关此函数的摘要
%   此处显示详细说明

sigma_min = 0.001;  % 0.1
sigma_decrease_factor = 0.02;  % 0.02
L = 4;

A_pinv = pinv(A);
B_pinv = pinv(B);

s = A_pinv * y * B_pinv;

sigma = 2 * max(max(abs(s)));

while sigma>sigma_min

    for i =1:L
        delta = -(sigma^2 * s)./(sigma^2 + s.^2);
        s = s + delta;
        s = s - A_pinv * (A * s * B - y) * B_pinv;
    end
    
    sigma = sigma*sigma_decrease_factor;
    
end

rim = s;

end
