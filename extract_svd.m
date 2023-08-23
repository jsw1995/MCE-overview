function [ rim ] = extract_svd( cip,cover,t,dwt_typ )
%   EXTRACT_SVD 此处显示有关此函数的摘要
%   此处显示详细说明

% cover = ceil(10+235/255*cover);
cover = floor(10+0.9216*cover);

LS=liftwave(dwt_typ,'Int2Int');
[~,~,~,CD]=lwt2(cover,LS);
[~,~,~,CD1]=lwt2(cip,LS);

[U,S,V]=svd(CD);
[U1,S1,V1]=svd(CD1);

US = U'*U1;
VS = V'*V1;

rim = double(uint8( ((US*S1*VS')-S) / t ));

end

