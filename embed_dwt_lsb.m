function [ cip,cover ] = embed_dwt_lsb( im,cover,dwt_typ )
%   EMBED_DWT_LSB 此处显示有关此函数的摘要
%   An algorithm for encryption of secret images into meaningful images

cover = ceil(10+235/255*cover);

cover=double(cover);
LS=liftwave(dwt_typ,'Int2Int');
[CA,CH,CV,CD]=lwt2(cover,LS);

CH1 = floor(im/2^5);
CV1 = floor(mod(im,2^5)/2^2);
CD1 = mod(im,2^2);

% 嵌入
CH2 = CH1 + floor(CH/2^3)*2^3;
CV2 = CV1 + floor(CV/2^3)*2^3;
CD2 = CD1 + floor(CD/2^2)*2^2;

cip = ilwt2(CA,CH2,CV2,CD2,LS);

end

