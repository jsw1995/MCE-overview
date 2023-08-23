clc;clear all;close all;clear;

im = imread('date/5.bmp');
% % ––÷√¬“
% r1 = rand([1,512]);
% r2 = rand([1,512]);
% [~, ind1] = sort(r1);
% [~, ind2] = sort(r1);
% cip1=im(:,ind1);
% cip2=cip1(ind2,:);
% rim1(ind2,:)=cip2;
% rim(:,ind1)=rim1;
% % for i=1:512
% %     cip1(i)=im(ind(i));
% % end
% r3 = uint8(rand(512,512)*255);
% cip3 = bitxor(cip2,r3);
% figure(1)
% imshow(uint8(im))
% figure(2)
% imshow(uint8(cip1))
% figure(3)
% imshow(uint8(cip2))
% figure(4)
% imshow(uint8(cip3))
% figure(5)
% imshow(uint8(rim))

im = double(imresize(im,[256,256]));
cover = double(imread('date/6.bmp'));
key='8d5ab8ba5340fce4420829ad5d12a0e45dacb0858544163d04c1d02b73e3697d';
dwt_typ='db1';

[ tcip, key_pre ] = noise_en1( im, key );
tic
[ cip ] = embed_encod( tcip,cover );
toc
tic
[ rtcip ] = extract_encod( cip );
toc
[ rim ] = noise_den1( rtcip,key_pre );
psnr1 = psnr(double(uint8(rim)),im,255);

figure(1)
imshow(uint8(im))
figure(2)
imshow(uint8(tcip))
figure(3)
imshow(uint8(cip))
figure(4)
imshow(uint8(rim))



% im = imread('date/5.bmp');
% im = double(imresize(im,[256,256]));
% cover = double(imread('date/6.bmp'));
% dwt_typ='haar';
% key='8d5ab8ba5340fce4420829ad5d12a0e45dacb0858544163d04c1d02b73e3697d';
% 
% 
% nosie_type = 1; niose_var=0.00001;
% nosie_type = 2; intens=0.01;
% nosie_type = 3; niose_var=0.00001;
% nosie_type = 4; ss=int8(512*0.1);
% 
% 
% % 2015
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip ] = embed2015( tcip,cover,dwt_typ );
% 
% max_cip=max(max(cip)); min_cip = min(min(cip));
% cip = (cip-min_cip)/(max_cip-min_cip);
% if nosie_type==1;
%     cip = imnoise(cip, 'gaussian' , 0, niose_var );
% elseif nosie_type==2;
%     cip = imnoise(cip, 'salt & pepper' , intens );
% elseif nosie_type==3;
%     cip = imnoise(cip, 'speckle', niose_var );
% else
%     cip(1:ss,1:ss)=0;
% end
% cip = round(cip*(max_cip-min_cip)+min_cip);
% 
% [ rtcip ] = extract2015( cip,dwt_typ );
% [ rim ] = noise_den1( rtcip,key_pre );
% 
% psnr1 = psnr(double(uint8(rim)),im,255);
% ssim1 = ssim(uint8(rim),uint8(im));
% 
% figure(1)
% imshow(uint8(im))
% figure(2)
% imshow(uint8(tcip))
% figure(3)
% imshow(uint8(cip))
% figure(4)
% imshow(uint8(rim))



