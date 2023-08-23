function [ cip ] = embed2015( im,cover,dwt_typ )
%   EMBED2 �������ƪ����15��
%   �˴���ʾ��ϸ˵��

% �޸ķ���
max1=245;min1=10;
cover(cover>=max1)=max1;
cover(cover<=min1)=min1;

% cover = ceil(10+235/255*cover);

cover=double(cover);
LS=liftwave(dwt_typ,'Int2Int');
[CA,CH,~,~]=lwt2(cover,LS);
% Ƕ��
CV = floor(im/10);
CD = mod(im,10);
cip = ilwt2(CA,CH,CV,CD,LS);

end

