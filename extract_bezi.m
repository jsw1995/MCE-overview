function [ rim ] = extract_bezi( cip,cover,t,dwt_typ )
%EXTRACT_BEZI �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��


[~,~,~,sph]=dwt2(cip,dwt_typ);
[~,~,~,hh]=dwt2(cover,dwt_typ);
rim = (sph(1:256,1:256)-(1-t)*hh(1:256,1:256))/t;
rim = double(uint8(rim));

end

