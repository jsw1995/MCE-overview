function [ cip ] = embed_af( im,cover,t,dwt_typ )
%EMBED_AF �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

% cover = ceil(10+235/255*cover);
cover = floor(10+0.9216*cover);

cover=double(cover);
LS=liftwave(dwt_typ,'Int2Int');
[CA,CH,CV,CD]=lwt2(cover,LS);
% Ƕ��
CD1 = CD+t*im;
cip = ilwt2(CA,CH,CV,CD1,LS);

cip = round(cip);

end

