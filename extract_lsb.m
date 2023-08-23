function [ rim ] = extract_lsb( cip )
%   EXTRACT_LSB 此处显示有关此函数的摘要
%   此处显示详细说明

[m,n]=size(cip);
CA = cip(1:m/2,1:n/2);
CH = cip(m/2+1:m,1:n/2);
CV = cip(1:m/2,n/2+1:n);
CD = cip(m/2+1:m,n/2+1:n);

CA2 = mod(CA,2^2);
CH2 = mod(CH,2^2);
CV2 = mod(CV,2^2);
CD2 = mod(CD,2^2);

rim =  CA2*2^6 + CH2*2^4 + CV2*2^2 + CD2;
rim = reshape(rim,[m/2,n/2]);

end

