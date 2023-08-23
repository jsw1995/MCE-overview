function [ rim ] = extract_af( cip,cover,t,dwt_typ )
%EXTRACT_AF 此处显示有关此函数的摘要
%   此处显示详细说明

% cover = ceil(10+235/255*cover);
cover = floor(10+0.9216*cover);

LS=liftwave(dwt_typ,'Int2Int');
[~,~,~,CD]=lwt2(cover,LS);
[~,~,~,CD1]=lwt2(cip,LS);

rim = double(uint8( (CD1-CD) / t ));

end

