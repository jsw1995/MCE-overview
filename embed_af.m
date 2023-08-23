function [ cip ] = embed_af( im,cover,t,dwt_typ )
%EMBED_AF 此处显示有关此函数的摘要
%   此处显示详细说明

% cover = ceil(10+235/255*cover);
cover = floor(10+0.9216*cover);

cover=double(cover);
LS=liftwave(dwt_typ,'Int2Int');
[CA,CH,CV,CD]=lwt2(cover,LS);
% 嵌入
CD1 = CD+t*im;
cip = ilwt2(CA,CH,CV,CD1,LS);

cip = round(cip);

end

