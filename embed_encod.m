function [ cip ] = embed_encod( im,cover )
%EMBED_ENCOD 此处显示有关此函数的摘要
%   此处显示详细说明

[m,n]=size(cover);

bit_s = reshape(dec2bin(im,8),[0.25*m*n*4,2])- '0';  % - '0' 将char转为double数据
bit_cover = dec2bin(uint8(cover),8)- '0';

aa = bitxor(bitxor(bit_cover(:,6),bit_cover(:,7)*2),bit_cover(:,8)*3);
bb = bitxor(aa,(bit_s(:,1)+bit_s(:,2)*2));
% bit_cover(bb ~= 0,bb+5) = bitxor(bit_cover(bb ~= 0,bb+5),1);

for i=1:m*n
    if bb(i) ~= 0
        bit_cover(i,bb(i)+5) = bitxor(bit_cover(i,bb(i)+5),1);
    end
end


% for i=1:m*n
%     aa = bitxor(bitxor(bit_cover(i,6),bit_cover(i,7)*2),bit_cover(i,8)*3);
%     bb = bitxor(aa,(bit_s(i,1)+bit_s(i,2)*2));
%     if bb ~= 0
%         bit_cover(i,bb+5) = bitxor(bit_cover(i,bb+5),1);
%     end
% end

cip = reshape(bin2dec(char(bit_cover + '0')),[m,n]);

end

