function [ rim ] = extract_lsb_2k( cip )
%EXTRACT_LSB_2K �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

[m,n]=size(cip);

CA = cip(1:m/2,1:n/2);
CH = cip(m/2+1:m,1:n/2);
CV = cip(1:m/2,n/2+1:n);
CD = cip(m/2+1:m,n/2+1:n);

rim = mod(CA,4)*(4*4*4) + mod(CH,4)*(4*4) + mod(CV,4)*4 + mod(CD,4);

end

