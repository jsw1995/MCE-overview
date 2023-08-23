function [ rim ] = extract2015( cip,dwt_typ )
%    EXTRACT2 提取
%   此处显示详细说明

cip=double(cip);
LS=liftwave(dwt_typ,'Int2Int');
[~,~,CV,CD]=lwt2(cip,LS);

rim = CV*10+CD; 

end

