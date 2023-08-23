function [ psnr11,abcd ] = embed2( im,cover,dwt_typ )
%EMBED2 此处显示有关此函数的摘要
%   此处显示详细说明

cover1 = cover;
% 修改封面
max1=250;min1=5;
cover(cover>=max1)=max1;
cover(cover<=min1)=min1;

% 提升的小波变换
cover=double(cover);
LS=liftwave(dwt_typ,'Int2Int');
[CA,CH,CV,CD]=lwt2(cover,LS);

psnr11 = [];
abcd = ones([4,1000]);
num=0;

for a=1:25;
    for b=1:25;
        for c=1:25;
            for d=1:25;
                tem = a*b*c*d;
                if tem>255 && tem<400
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

tem = cip-cover;
cip2 = cip;
cip2(tem < -a/2) = cip(tem < -a/2) + a;
cip2(tem > a/2) = cip(tem > a/2) - a;

end
