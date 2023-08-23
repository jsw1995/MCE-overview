function [ psnr11,abcd ] = embed( im,cover,dwt_typ )
%EMBED 此处显示有关此函数的摘要
%   遍历找最优a,b,c,d

cover1 = cover;
% 修改封面
max1=250;min1=5;
cover(cover>max1)=max1;
cover(cover<min1)=min1;

% 提升的小波变换
cover=double(cover);
LS=liftwave(dwt_typ,'Int2Int');
[CA,CH,CV,CD]=lwt2(cover,LS);

psnr11 = [];
abcd = ones([4,1000]);
num=0;
for a=0:8
    for b=0:8-a;
        for c=0:8-a-b;
            for d=0:8-a-b-c;
                if a+b+c+d == 8

                    % 嵌入
                    CA2 = floor(im/2^(b+c+d)) + floor(CA/2^a)*2^a;
                    CH2 = floor(mod(im,2^(b+c+d))/2^(c+d)) + floor(CH/2^b)*2^b;
                    CV2 = floor(mod(im,2^(c+d))/2^d) + floor(CV/2^c)*2^c;
                    CD2 = mod(im,2^d) + floor(CD/2^d)*2^d;
                    % 修改
                    CA2 = correction(CA,CA2,a);
                    CH2 = correction(CH,CH2,b);
                    CV2 = correction(CV,CV2,c);
                    CD2 = correction(CD,CD2,d);

                    cip = ilwt2(CA2,CH2,CV2,CD2,LS);
                    psnr1 = psnr(cip,cover1,255);
                    psnr11 = [psnr11,psnr1];
                    num=num+1;
                    abcd(:,num) = [a;b;c;d];
                
                end
            end
        end
    end
end


end

function [ cip2 ] = correction( cover,cip,a )
%   CORRECTION 修正
%   此处显示详细说明

a = 2^a;
tem = cip-cover;
cip2 = cip;
cip2(tem < -a/2) = cip(tem < -a/2) + a;
cip2(tem > a/2) = cip(tem > a/2) - a;

end
