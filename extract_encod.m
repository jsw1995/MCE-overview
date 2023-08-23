function [ rim ] = extract_encod( cip )
%   EXTRACT_ENCOD 此处显示有关此函数的摘要
%   此处显示详细说明

[m,n]=size(cip);
bit_s = ones([0.25*m*n*4,2]);
bit_cip = dec2bin(uint8(cip),8) - '0';

aa = bitxor(bitxor(bit_cip(:,6),bit_cip(:,7)*2),bit_cip(:,8)*3);
aa1 = floor(aa/2);
bb1 = aa - aa1*2;
bit_s(:,1:2)=[bb1,aa1];

% for i=1:m*n
%     aa = bitxor(bitxor(bit_cip(i,6),bit_cip(i,7)*2),bit_cip(i,8)*3);
%     aa1 = floor(aa/2);
%     bb1 = aa - aa1*2;
%     bit_s(i,:)=[bb1,aa1];
% end

bit_s = reshape(bit_s,[0.25*m*n,8]);
rim = reshape(bin2dec(char(bit_s + '0')),[m/2,n/2]);

end

