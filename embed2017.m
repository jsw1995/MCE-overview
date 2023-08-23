function [ cip ] = embed2017( im,cover,dwt_typ )
%   EMBED2017 此处显示有关此函数的摘要
%   此处显示详细说明

cover = ceil(10+235/255*cover);

cover=double(cover);
LS=liftwave(dwt_typ,'Int2Int');
[CA,CH,CV,CD]=lwt2(cover,LS);

CH1 = floor(im/100);
CV1 = floor(mod(im,100)/10);
CD1 = mod(im,10);

% 嵌入
CH2 = CH1 + CH;
CV2 = CV1 + CV;
CD2 = CD1 + CD;

cip = ilwt2(CA,CH2,CV2,CD2,LS);

end

