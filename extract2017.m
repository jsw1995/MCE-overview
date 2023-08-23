function [ rim ] = extract2017( cip,cover,dwt_typ )
%EXTRACT2017 此处显示有关此函数的摘要
%   此处显示详细说明

cover = ceil(10+235/255*cover);

cip=double(cip);
LS=liftwave(dwt_typ,'Int2Int');
[~,CH,CV,CD]=lwt2(cover,LS);
[~,CH2,CV2,CD2]=lwt2(cip,LS);

CH1 = CH2-CH;
CV1 = CV2-CV;
CD1 = CD2-CD;

rim = CH1*100 + CV1*10 + CD1; 

end

