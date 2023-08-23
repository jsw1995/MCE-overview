function [ cip ] = embed_svd( im,cover,t,dwt_typ )
%   EMBED_SVD �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

% cover = ceil(10+235/255*cover);
cover = floor(10+0.9216*cover);

cover=double(cover);
LS=liftwave(dwt_typ,'Int2Int');
[CA,CH,CV,CD]=lwt2(cover,LS);
% Ƕ��
[U,S,V]=svd(CD);
S1 = S + t*im;
CD1 = round(U*S1*V');
% CD1 = U*S1*V';
cip = ilwt2(CA,CH,CV,CD1,LS);

end

