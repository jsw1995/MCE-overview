function [ rim ] = extract_dwt_lsb( cip,dwt_typ )
%EXTRACT_DWT_LSB 此处显示有关此函数的摘要
%   此处显示详细说明


cip=double(cip);
LS=liftwave(dwt_typ,'Int2Int');
[~,CH2,CV2,CD2]=lwt2(cip,LS);

CH1 = mod(CH2,2^3);
CV1 = mod(CV2,2^3);
CD1 = mod(CD2,2^2);

rim = CH1*2^5 + CV1*2^2 + CD1; 

end

