%% 有意义密文综述文献对比
% 类噪声密文为均匀分布类型
clc;clear all;close all;clear;
key='8d5ab8ba5340fce4420829ad5d12a0e45dacb0858544163d04c1d02b73e3697d';

%% 存图
% im = imread('date2/5.bmp');
% % im = double(imresize(im,[256,256]));
% cover = double(imread('date3/6.bmp'));
% dwt_typ='haar';
% 
% psnr11=[];
% ssim11=[];
% 
% imwrite(uint8(cover(230:280,50:100)),'cip1/1.bmp')
% imwrite(uint8(cover),'cip1/2.bmp')
% 
% % 2015
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip ] = embed2015( tcip,cover,dwt_typ );
% [ rtcip ] = extract2015( cip,dwt_typ );
% [ rim ] = noise_den1( rtcip,key_pre );
% imwrite(uint8(cip(230:280,50:100)),'cip1/10.bmp')
% imwrite(uint8(cip),'cip1/20.bmp')
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];


% % 2017
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip ] = embed2017( tcip,cover,dwt_typ );
% [ rtcip ] = extract2017( cip,cover,dwt_typ );
% [ rim ] = noise_den1( rtcip,key_pre );
% imwrite(uint8(cip(230:280,50:100)),'cip1/11.bmp')
% imwrite(uint8(cip),'cip1/21.bmp')
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% 
% % dwt_lsb
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip,cover2 ] = embed_dwt_lsb( tcip,cover,dwt_typ );
% [ rtcip ] = extract_dwt_lsb( cip,dwt_typ );
% [ rim ] = noise_den1( rtcip,key_pre );
% imwrite(uint8(cip(230:280,50:100)),'cip1/12.bmp')
% imwrite(uint8(cip),'cip1/22.bmp')
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% % dwt_2k
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip ] = embed_dwt_2k( tcip,cover,dwt_typ );
% [ rtcip ] = extract_dwt_2k( cip,dwt_typ );
% [ rim ] = noise_den1( rtcip,key_pre );
% imwrite(uint8(cip(230:280,50:100)),'cip1/13.bmp')
% imwrite(uint8(cip),'cip1/23.bmp')
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% % Mary 分解
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip ] = embed_Mary( tcip,cover,dwt_typ );
% [ rtcip ] = extract_Mary( cip,dwt_typ );
% [ rim ] = noise_den1( rtcip,key_pre );
% 
% imwrite(uint8(cip(230:280,50:100)),'cip1/14.bmp')
% imwrite(uint8(cip),'cip1/24.bmp')
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% % 贝塞尔曲线
% t=0.2;
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip ] = embed_bezi( tcip,cover,t,dwt_typ );
% [ rtcip ] = extract_bezi( cip,cover,t,dwt_typ );
% [ rim ] = noise_den1( rtcip,key_pre );
% imwrite(uint8(cip(230:280,50:100)),'cip1/15.bmp')
% imwrite(uint8(cip),'cip1/25.bmp')
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% % af
% t=0.2;
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip ] = embed_af( tcip,cover,t,dwt_typ );
% [ rtcip ] = extract_af( cip,cover,t,dwt_typ );
% [ rim ] = noise_den1( rtcip,key_pre );
% imwrite(uint8(cip(230:280,50:100)),'cip1/115.bmp')
% imwrite(uint8(cip),'cip1/225.bmp')
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% figure(1)
% imshow(uint8(im))
% figure(2)
% imshow(uint8(tcip))
% figure(3)
% imshow(uint8(cip))
% 
% figure(11)
% imshow(uint8(cip(230:280,50:100)))
% 
% figure(4)
% imshow(uint8(rim))
% 

% svd
% t=0.2;
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip ] = embed_svd( tcip,cover,t,dwt_typ );
% [ rtcip ] = extract_svd( cip,cover,t,dwt_typ );
% [ rim ] = noise_den1( rtcip,key_pre );
% imwrite(uint8(cip(230:280,50:100)),'cip1/16.bmp')
% imwrite(uint8(cip),'cip1/26.bmp')
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% 
% % lsb
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip ] = embed_lsb( tcip,cover );
% [ rtcip ] = extract_lsb( cip );
% [ rim ] = noise_den1( rtcip,key_pre );
% imwrite(uint8(cip(230:280,50:100)),'cip1/17.bmp')
% imwrite(uint8(cip),'cip1/27.bmp')
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% % lsb+2k
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip ] = embed_lsb_2k( tcip,cover );
% [ rtcip ] = extract_lsb_2k( cip );
% [ rim ] = noise_den1( rtcip,key_pre );
% imwrite(uint8(cip(230:280,50:100)),'cip1/18.bmp')
% imwrite(uint8(cip),'cip1/28.bmp')
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% % 矩阵编码
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip ] = embed_encod( tcip,cover );
% [ rtcip ] = extract_encod( cip );
% [ rim ] = noise_den1( rtcip,key_pre );
% imwrite(uint8(cip(230:280,50:100)),'cip1/19.bmp')
% imwrite(uint8(cip),'cip1/29.bmp')
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];



%% 190次循环

% dwt_typ='sym2';   %%%%%%%%%%%
% path_file = 'date\';
% fileExt = '*.bmp';  %待读取图像的后缀名
% %获取所有路径
% plain_files = dir(fullfile(path_file,fileExt)); 
% plain_len1 = size(plain_files,1);
% 
% psnr11=ones(plain_len1*(plain_len1-1),11);
% ssim11=ones(plain_len1*(plain_len1-1),11);
% ncc11=ones(plain_len1*(plain_len1-1),11);
% num = 0;
% for i=1:plain_len1
%     cover = double(imread(strcat(path_file,plain_files(i).name)));
%     for j=1:plain_len1
%         if i ~= j
%             num = num+1;
%             im = imread(strcat(path_file,plain_files(j).name));
%             im = double(imresize(im,[256,256]));
% 
%             % 2015
%             [ tcip, key_pre ] = noise_en1( im, key );
%             [ cip ] = embed2015( tcip,cover,dwt_typ );
%             
%             imwrite(uint8(cip),['cip110/',num2str(num),'.bmp'])
% 
%             psnr1 = psnr(double(uint8(cip)),cover,255);
%             ssim1 = ssim(uint8(cip),uint8(cover));
%             ncc1 = NCC(uint8(cip),uint8(cover));
%             psnr11(num,1) = psnr1;
%             ssim11(num,1) = ssim1;
%             ncc11(num,1) = ncc1;
% 
%             % 2017
%             [ tcip, key_pre ] = noise_en1( im, key );
%             [ cip ] = embed2017( tcip,cover,dwt_typ );
%             
%             imwrite(uint8(cip),['cip111/',num2str(num),'.bmp'])
% 
%             psnr1 = psnr(double(uint8(cip)),cover,255);
%             ssim1 = ssim(uint8(cip),uint8(cover));
%             ncc1 = NCC(uint8(cip),uint8(cover));
%             psnr11(num,2) = psnr1;
%             ssim11(num,2) = ssim1;
%             ncc11(num,2) = ncc1;
%             
%             % dwt_lsb
%             [ tcip, key_pre ] = noise_en1( im, key );
%             [ cip,cover2 ] = embed_dwt_lsb( tcip,cover,dwt_typ );
%             
%             imwrite(uint8(cip),['cip112/',num2str(num),'.bmp'])
% 
%             psnr1 = psnr(double(uint8(cip)),cover,255);
%             ssim1 = ssim(uint8(cip),uint8(cover));
%             ncc1 = NCC(uint8(cip),uint8(cover));
%             psnr11(num,3) = psnr1;
%             ssim11(num,3) = ssim1;
%             ncc11(num,3) = ncc1;
% 
%             % dwt_2k
%             [ tcip, key_pre ] = noise_en1( im, key );
%             [ cip ] = embed_dwt_2k( tcip,cover,dwt_typ );
%             
%             imwrite(uint8(cip),['cip113/',num2str(num),'.bmp'])
% 
%             psnr1 = psnr(double(uint8(cip)),cover,255);
%             ssim1 = ssim(uint8(cip),uint8(cover));
%             ncc1 = NCC(uint8(cip),uint8(cover));
%             psnr11(num,4) = psnr1;
%             ssim11(num,4) = ssim1;
%             ncc11(num,4) = ncc1;
% 
%             % Mary 分解
%             [ tcip, key_pre ] = noise_en1( im, key );
%             [ cip ] = embed_Mary( tcip,cover,dwt_typ );
%             
%             imwrite(uint8(cip),['cip114/',num2str(num),'.bmp'])
% 
%             psnr1 = psnr(double(uint8(cip)),cover,255);
%             ssim1 = ssim(uint8(cip),uint8(cover));
%             ncc1 = NCC(uint8(cip),uint8(cover));
%             psnr11(num,5) = psnr1;
%             ssim11(num,5) = ssim1;
%             ncc11(num,5) = ncc1;
% 
%             % 贝塞尔曲线
%             t=0.2;
%             [ tcip, key_pre ] = noise_en1( im, key );
%             [ cip ] = embed_bezi( tcip,cover,t,dwt_typ );
%             
%             imwrite(uint8(cip),['cip115/',num2str(num),'.bmp'])
% 
%             psnr1 = psnr(double(uint8(cip)),cover,255);
%             ssim1 = ssim(uint8(cip),uint8(cover));
%             ncc1 = NCC(uint8(cip),uint8(cover));
%             psnr11(num,6) = psnr1;
%             ssim11(num,6) = ssim1;
%             ncc11(num,6) = ncc1;
%             
%             % af
%             t=0.2;
%             [ tcip, key_pre ] = noise_en1( im, key );
%             [ cip ] = embed_af( tcip,cover,t,dwt_typ );
%             
%             imwrite(uint8(cip),['cip116/',num2str(num),'.bmp'])
% 
%             psnr1 = psnr(double(uint8(cip)),cover,255);
%             ssim1 = ssim(uint8(cip),uint8(cover));
%             ncc1 = NCC(uint8(cip),uint8(cover));
%             psnr11(num,7) = psnr1;
%             ssim11(num,7) = ssim1;
%             ncc11(num,7) = ncc1;
% 
%             % svd
%             t=0.2;
%             [ tcip, key_pre ] = noise_en1( im, key );
%             [ cip ] = embed_svd( tcip,cover,t,dwt_typ );
%             
%             imwrite(uint8(cip),['cip117/',num2str(num),'.bmp'])
% 
%             psnr1 = psnr(double(uint8(cip)),cover,255);
%             ssim1 = ssim(uint8(cip),uint8(cover));
%             ncc1 = NCC(uint8(cip),uint8(cover));
%             psnr11(num,8) = psnr1;
%             ssim11(num,8) = ssim1;
%             ncc11(num,8) = ncc1;
% 
%             % lsb
%             [ tcip, key_pre ] = noise_en1( im, key );
%             [ cip ] = embed_lsb( tcip,cover );
%             
%             imwrite(uint8(cip),['cip118/',num2str(num),'.bmp'])
% 
%             psnr1 = psnr(double(uint8(cip)),cover,255);
%             ssim1 = ssim(uint8(cip),uint8(cover));
%             ncc1 = NCC(uint8(cip),uint8(cover));
%             psnr11(num,9) = psnr1;
%             ssim11(num,9) = ssim1;
%             ncc11(num,9) = ncc1;
% 
%             % lsb+2k
%             [ tcip, key_pre ] = noise_en1( im, key );
%             [ cip ] = embed_lsb_2k( tcip,cover );
%             
%             imwrite(uint8(cip),['cip119/',num2str(num),'.bmp'])
% 
%             psnr1 = psnr(double(uint8(cip)),cover,255);
%             ssim1 = ssim(uint8(cip),uint8(cover));
%             ncc1 = NCC(uint8(cip),uint8(cover));
%             psnr11(num,10) = psnr1;
%             ssim11(num,10) = ssim1;
%             ncc11(num,10) = ncc1;
% 
%             % 矩阵编码
%             [ tcip, key_pre ] = noise_en1( im, key );
%             [ cip ] = embed_encod( tcip,cover );
%             
%             imwrite(uint8(cip),['cip120/',num2str(num),'.bmp'])
% 
%             psnr1 = psnr(double(uint8(cip)),cover,255);
%             ssim1 = ssim(uint8(cip),uint8(cover));
%             ncc1 = NCC(uint8(cip),uint8(cover));
%             psnr11(num,11) = psnr1;
%             ssim11(num,11) = ssim1;
%             ncc11(num,11) = ncc1;
%             
%         end
%     end
% end
% psnr2 = mean(psnr11,1);
% ssim2 = mean(ssim11,1);
% ncc2 = mean(ncc11,1);

%% 权重系数对密文与解密质量影响

% dwt_typ='haar';
% path_file = 'date\';
% fileExt = '*.bmp';  %待读取图像的后缀名
% %获取所有路径
% plain_files = dir(fullfile(path_file,fileExt)); 
% plain_len1 = size(plain_files,1);
% 
% psnr11=ones(plain_len1*(plain_len1-1),16);
% psnr12=ones(plain_len1*(plain_len1-1),16);
% 
% psnr21=ones(plain_len1*(plain_len1-1),16);
% psnr22=ones(plain_len1*(plain_len1-1),16);
% 
% psnr31=ones(plain_len1*(plain_len1-1),16);
% psnr32=ones(plain_len1*(plain_len1-1),16);
% 
% num1 = 0;
% for t=0.05:0.05:0.8
%     num1=num1+1;
%     num2 = 0;
%     for i=1:plain_len1
%         cover = double(imread(strcat(path_file,plain_files(i).name)));
%         for j=1:plain_len1
%             if i ~= j
%                 num2 = num2+1;
%                 im = imread(strcat(path_file,plain_files(j).name));
%                 im = double(imresize(im,[256,256]));
% 
%                 % 贝塞尔曲线
%                 [ tcip, key_pre ] = noise_en1( im, key );
%                 [ cip ] = embed_bezi( tcip,cover,t,dwt_typ );
%                 [ rtcip ] = extract_bezi( cip,cover,t,dwt_typ );
%                 [ rim ] = noise_den1( rtcip,key_pre );
%                 
%                 psnr1 = psnr(double(uint8(cip)),cover,255);
%                 psnr2 = psnr(double(uint8(rim)),im,255);
%                 psnr11(num2,num1) = psnr1;
%                 psnr12(num2,num1) = psnr2;
% 
% 
%                 % af
%                 [ tcip, key_pre ] = noise_en1( im, key );
%                 [ cip ] = embed_af( tcip,cover,t,dwt_typ );
%                 [ rtcip ] = extract_af( cip,cover,t,dwt_typ );
%                 [ rim ] = noise_den1( rtcip,key_pre );
%                 
%                 psnr1 = psnr(double(uint8(cip)),cover,255);
%                 psnr2 = psnr(double(uint8(rim)),im,255);
%                 psnr21(num2,num1) = psnr1;
%                 psnr22(num2,num1) = psnr2;
% 
%                 % svd
%                 [ tcip, key_pre ] = noise_en1( im, key );
%                 [ cip ] = embed_svd( tcip,cover,t,dwt_typ );
%                 [ rtcip ] = extract_svd( cip,cover,t,dwt_typ );
%                 [ rim ] = noise_den1( rtcip,key_pre );
% 
%                 psnr1 = psnr(double(uint8(cip)),cover,255);
%                 psnr2 = psnr(double(uint8(rim)),im,255);
%                 psnr31(num2,num1) = psnr1;
%                 psnr32(num2,num1) = psnr2;
% 
%             end
%         end
%     end
% end
% 
% psnr11 = mean(psnr11,1);
% psnr12 = mean(psnr12,1);
% psnr21 = mean(psnr21,1);
% psnr22 = mean(psnr22,1);
% psnr31 = mean(psnr31,1);
% psnr32 = mean(psnr32,1);
% 
% figure(1)
% plot([0.05:0.05:0.8],psnr11,'yo-.');hold on
% plot([0.05:0.05:0.8],psnr21,'m+-.');hold on
% plot([0.05:0.05:0.8],psnr31,'c*-.');hold on
% legend('[65]','[66]','[70]');
% xlabel('t')
% ylabel('PSNR(dB)')
% 
% figure(2)
% plot([0.05:0.05:0.8],psnr12,'yo-.');hold on
% plot([0.05:0.05:0.8],psnr22,'m+-.');hold on
% plot([0.05:0.05:0.8],psnr32,'c*-.');hold on
% legend('[65]','[66]','[70]');
% xlabel('t')
% ylabel('PSNR(dB)')

%% 隐写分析
aa = ones([400,1]);
aa(201:400)=0;

b = csvread ('date2/date.csv',2,3);

a1 = csvread ('cip110/cip110.csv',2,3);
out1 = [a1(:,5);b(:,5)];
a2 = csvread ('cip111/cip111.csv',2,3);
out2 = [a2(:,5);b(:,5)];
a3 = csvread ('cip112/cip112.csv',2,3);
out3 = [a3(:,5);b(:,5)];
a4 = csvread ('cip113/cip113.csv',2,3);
out4 = [a4(:,5);b(:,5)];
a5 = csvread ('cip114/cip114.csv',2,3);
out5 = [a5(:,5);b(:,5)];
a6 = csvread ('cip115/cip115.csv',2,3);
out6 = [a6(:,5);b(:,5)];
a7 = csvread ('cip116/cip116.csv',2,3);
out7 = [a7(:,5);b(:,5)];
a8 = csvread ('cip117/cip117.csv',2,3);
out8 = [a8(:,5);b(:,5)];
a9 = csvread ('cip118/cip118.csv',2,3);
out9 = [a9(:,5);b(:,5)];
a10 = csvread ('cip119/cip119.csv',2,3);
out10 = [a10(:,5);b(:,5)];
a11 = csvread ('cip120/cip120.csv',2,3);
out11 = [a11(:,5);b(:,5)];

aa = [aa,aa,aa,aa,aa,aa,aa,aa,aa,aa,aa];
out = [out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11];

[b1]=AUC(aa,out1);
[b2]=AUC(aa,out2);
[b3]=AUC(aa,out3);
[b4]=AUC(aa,out4);
[b5]=AUC(aa,out5);
[b6]=AUC(aa,out6);
[b7]=AUC(aa,out7);
[b8]=AUC(aa,out8);
[b9]=AUC(aa,out9);
[b10]=AUC(aa,out10);
[b11]=AUC(aa,out11);

figure(1)
plotroc(aa',out')

figure(2)
plotroc(aa',out')
legend(['Ref[6] AUC=',num2str(b1)],['Ref[50] AUC=',num2str(b2)],['Ref[51] AUC=',num2str(b3)],['Ref[59] AUC=',num2str(b4)],['Ref[60] AUC=',num2str(b5)],['Ref[65] AUC=',num2str(b6)],['Ref[66] AUC=',num2str(b7)],['Ref[70] AUC=',num2str(b8)],['Ref[24] AUC=',num2str(b9)],['Ref[25] AUC=',num2str(b10)],['Ref[26] AUC=',num2str(b11)]);


%% 鲁棒性

% im = imread('date/5.bmp');
% im = double(imresize(im,[256,256]));
% cover = double(imread('date/6.bmp'));
% dwt_typ='haar';
% 
% psnr11=[];
% ssim11=[];
% 
% % nosie_type = 1; niose_var=0.00001;
% % nosie_type = 2; intens=0.1;
% % nosie_type = 3; niose_var=0.000025;
% nosie_type = 4; ss=64;
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
%     cip(256-ss:256+ss,256-ss:256+ss)=0;
% end
% cip = round(cip*(max_cip-min_cip)+min_cip);
% 
% [ rtcip ] = extract2015( cip,dwt_typ );
% [ rim ] = noise_den1( rtcip,key_pre );
% imwrite(uint8(rim),'rim1/20.bmp')
% 
% psnr1 = psnr(double(uint8(rim)),im,255);
% ssim1 = ssim(uint8(rim),uint8(im));
% 
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% 
% % 2017
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip ] = embed2017( tcip,cover,dwt_typ );
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
%     cip(256-ss:256+ss,256-ss:256+ss)=0;
% end
% cip = round(cip*(max_cip-min_cip)+min_cip);
% 
% [ rtcip ] = extract2017( cip,cover,dwt_typ );
% [ rim ] = noise_den1( rtcip,key_pre );
% 
% imwrite(uint8(rim),'rim1/21.bmp')
% 
% psnr1 = psnr(double(uint8(rim)),im,255);
% ssim1 = ssim(uint8(rim),uint8(im));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% 
% % dwt_lsb
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip,cover2 ] = embed_dwt_lsb( tcip,cover,dwt_typ );
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
%     cip(256-ss:256+ss,256-ss:256+ss)=0;
% end
% cip = round(cip*(max_cip-min_cip)+min_cip);
% 
% [ rtcip ] = extract_dwt_lsb( cip,dwt_typ );
% [ rim ] = noise_den1( rtcip,key_pre );
% 
% imwrite(uint8(rim),'rim1/22.bmp')
% 
% psnr1 = psnr(double(uint8(rim)),im,255);
% ssim1 = ssim(uint8(rim),uint8(im));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% % dwt_2k
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip ] = embed_dwt_2k( tcip,cover,dwt_typ );
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
%     cip(256-ss:256+ss,256-ss:256+ss)=0;
% end
% cip = round(cip*(max_cip-min_cip)+min_cip);
% 
% [ rtcip ] = extract_dwt_2k( cip,dwt_typ );
% [ rim ] = noise_den1( rtcip,key_pre );
% 
% imwrite(uint8(rim),'rim1/23.bmp')
% 
% psnr1 = psnr(double(uint8(rim)),im,255);
% ssim1 = ssim(uint8(rim),uint8(im));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% % Mary 分解
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip ] = embed_Mary( tcip,cover,dwt_typ );
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
%     cip(256-ss:256+ss,256-ss:256+ss)=0;
% end
% cip = round(cip*(max_cip-min_cip)+min_cip);
% 
% [ rtcip ] = extract_Mary( cip,dwt_typ );
% [ rim ] = noise_den1( rtcip,key_pre );
% 
% imwrite(uint8(rim),'rim1/24.bmp')
% 
% psnr1 = psnr(double(uint8(rim)),im,255);
% ssim1 = ssim(uint8(rim),uint8(im));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% % 贝塞尔曲线
% t=0.2;
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip ] = embed_bezi( tcip,cover,t,dwt_typ );
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
%     cip(256-ss:256+ss,256-ss:256+ss)=0;
% end
% cip = round(cip*(max_cip-min_cip)+min_cip);
% 
% [ rtcip ] = extract_bezi( cip,cover,t,dwt_typ );
% [ rim ] = noise_den1( rtcip,key_pre );
% 
% imwrite(uint8(rim),'rim1/25.bmp')
% 
% psnr1 = psnr(double(uint8(rim)),im,255);
% ssim1 = ssim(uint8(rim),uint8(im));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% % af
% t=0.2;
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip ] = embed_af( tcip,cover,t,dwt_typ );
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
%     cip(256-ss:256+ss,256-ss:256+ss)=0;
% end
% cip = round(cip*(max_cip-min_cip)+min_cip);
% 
% [ rtcip ] = extract_af( cip,cover,t,dwt_typ );
% [ rim ] = noise_den1( rtcip,key_pre );
% 
% imwrite(uint8(rim),'rim1/26.bmp')
% 
% psnr1 = psnr(double(uint8(rim)),im,255);
% ssim1 = ssim(uint8(rim),uint8(im));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% 
% % svd
% t=0.2;
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip ] = embed_svd( tcip,cover,t,dwt_typ );
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
%     cip(256-ss:256+ss,256-ss:256+ss)=0;
% end
% cip = round(cip*(max_cip-min_cip)+min_cip);
% 
% [ rtcip ] = extract_svd( cip,cover,t,dwt_typ );
% [ rim ] = noise_den1( rtcip,key_pre );
% 
% imwrite(uint8(rim),'rim1/27.bmp')
% 
% psnr1 = psnr(double(uint8(rim)),im,255);
% ssim1 = ssim(uint8(rim),uint8(im));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% 
% % lsb
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip ] = embed_lsb( tcip,cover );
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
%     cip(256-ss:256+ss,256-ss:256+ss)=0;
% end
% cip = round(cip*(max_cip-min_cip)+min_cip);
% 
% [ rtcip ] = extract_lsb( cip );
% [ rim ] = noise_den1( rtcip,key_pre );
% 
% imwrite(uint8(rim),'rim1/28.bmp')
% 
% psnr1 = psnr(double(uint8(rim)),im,255);
% ssim1 = ssim(uint8(rim),uint8(im));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% % lsb+2k
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip ] = embed_lsb_2k( tcip,cover );
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
%     cip(256-ss:256+ss,256-ss:256+ss)=0;
% end
% cip = round(cip*(max_cip-min_cip)+min_cip);
% 
% [ rtcip ] = extract_lsb_2k( cip );
% [ rim ] = noise_den1( rtcip,key_pre );
% 
% imwrite(uint8(rim),'rim1/29.bmp')
% 
% psnr1 = psnr(double(uint8(rim)),im,255);
% ssim1 = ssim(uint8(rim),uint8(im));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% % 矩阵编码
% [ tcip, key_pre ] = noise_en1( im, key );
% [ cip ] = embed_encod( tcip,cover );
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
%     cip(256-ss:256+ss,256-ss:256+ss)=0;
% end
% cip = round(cip*(max_cip-min_cip)+min_cip);
% 
% [ rtcip ] = extract_encod( cip );
% [ rim ] = noise_den1( rtcip,key_pre );
% 
% imwrite(uint8(rim),'rim1/30.bmp')
% 
% psnr1 = psnr(double(uint8(rim)),im,255);
% ssim1 = ssim(uint8(rim),uint8(im));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% 
% figure(1)
% imshow(uint8(im))
% figure(2)
% imshow(uint8(tcip))
% figure(3)
% imshow(uint8(cip))
% figure(4)
% imshow(uint8(rim))

%% 密文质量与鲁棒性关系
% 
% a = [17.7357 9.6563	13.4177	10.5213	11.0519	20.3072	18.9317	18.2398	12.0687	12.0313	9.9181];
% b = [27.4847 34.2003 34.3406 45.1109	45.3003	25.9400	30.2817	30.3032	44.5323	46.3553	40.9323];
% % c1 = ['Ref[5]','Ref[37]','Ref[39]','Ref[42]','Ref[43]','Ref[46]','Ref[47]','Ref[49]','Ref[23]','Ref[24]','Ref[25]'];
% c = 1:1:11;
% figure(1)
% plot(c,a,'* -');hold on
% plot(c,b,'+ -');
% legend('Robustness','Ciphertext quality')
% ylabel('PSNR(dB)')
% set(gca,'xticklabel',{'Ref[6]','Ref[50]','Ref[51]','Ref[59]','Ref[60]','Ref[65]','Ref[66]','Ref[70]','Ref[24]','Ref[25]','Ref[26]'})


%% 加解密时间
% im = imread('date/5.bmp');
% im = double(imresize(im,[256,256]));
% cover = double(imread('date/6.bmp'));
% 
% % im = double(imread('date/5.bmp'));
% % cover = imread('date/6.bmp');
% % cover = double(imresize(cover,[1024,1024]));
% 
% dwt_typ='haar';
% times = ones([2,11]);
% tct=30;
% 
% % 2015
% [ tcip, key_pre ] = noise_en1( im, key );
% t1=clock;
% for i=1:tct
% [ cip ] = embed2015( tcip,cover,dwt_typ );
% end
% t2=clock;
% for i=1:tct
% [ rtcip ] = extract2015( cip,dwt_typ );
% end
% t3=clock;
% [ rim ] = noise_den1( rtcip,key_pre );
% times(1,1)=etime(t2,t1);
% times(2,1)=etime(t3,t2);
% 
% 
% % 2017
% [ tcip, key_pre ] = noise_en1( im, key );
% t1=clock;
% for i=1:tct
% [ cip ] = embed2017( tcip,cover,dwt_typ );
% end
% t2=clock;
% for i=1:tct
% [ rtcip ] = extract2017( cip,cover,dwt_typ );
% end
% t3=clock;
% [ rim ] = noise_den1( rtcip,key_pre );
% times(1,2)=etime(t2,t1);
% times(2,2)=etime(t3,t2);
% 
% 
% % dwt_lsb
% [ tcip, key_pre ] = noise_en1( im, key );
% t1=clock;
% for i=1:tct
% [ cip,cover2 ] = embed_dwt_lsb( tcip,cover,dwt_typ );
% end
% t2=clock;
% for i=1:tct
% [ rtcip ] = extract_dwt_lsb( cip,dwt_typ );
% end
% t3=clock;
% [ rim ] = noise_den1( rtcip,key_pre );
% times(1,3)=etime(t2,t1);
% times(2,3)=etime(t3,t2);
% 
% % dwt_2k
% [ tcip, key_pre ] = noise_en1( im, key );
% t1=clock;
% for i=1:tct
% [ cip ] = embed_dwt_2k( tcip,cover,dwt_typ );
% end
% t2=clock;
% for i=1:tct
% [ rtcip ] = extract_dwt_2k( cip,dwt_typ );
% end
% t3=clock;
% [ rim ] = noise_den1( rtcip,key_pre );
% times(1,4)=etime(t2,t1);
% times(2,4)=etime(t3,t2);
% 
% % Mary 分解
% [ tcip, key_pre ] = noise_en1( im, key );
% t1=clock;
% for i=1:tct
% [ cip ] = embed_Mary( tcip,cover,dwt_typ );
% end
% t2=clock;
% for i=1:tct
% [ rtcip ] = extract_Mary( cip,dwt_typ );
% end
% t3=clock;
% [ rim ] = noise_den1( rtcip,key_pre );
% times(1,5)=etime(t2,t1);
% times(2,5)=etime(t3,t2);
% 
% % 贝塞尔曲线
% t=0.2;
% [ tcip, key_pre ] = noise_en1( im, key );
% t1=clock;
% for i=1:tct
% [ cip ] = embed_bezi( tcip,cover,t,dwt_typ );
% end
% t2=clock;
% for i=1:tct
% [ rtcip ] = extract_bezi( cip,cover,t,dwt_typ );
% end
% t3=clock;
% [ rim ] = noise_den1( rtcip,key_pre );
% times(1,6)=etime(t2,t1);
% times(2,6)=etime(t3,t2);
% 
% % af
% t=0.2;
% [ tcip, key_pre ] = noise_en1( im, key );
% t1=clock;
% for i=1:tct
% [ cip ] = embed_af( tcip,cover,t,dwt_typ );
% end
% t2=clock;
% for i=1:tct
% [ rtcip ] = extract_af( cip,cover,t,dwt_typ );
% end
% t3=clock;
% [ rim ] = noise_den1( rtcip,key_pre );
% times(1,7)=etime(t2,t1);
% times(2,7)=etime(t3,t2);
% 
% 
% %svd
% t=0.2;
% [ tcip, key_pre ] = noise_en1( im, key );
% t1=clock;
% for i=1:tct
% [ cip ] = embed_svd( tcip,cover,t,dwt_typ );
% end
% t2=clock;
% for i=1:tct
% [ rtcip ] = extract_svd( cip,cover,t,dwt_typ );
% end
% t3=clock;
% [ rim ] = noise_den1( rtcip,key_pre );
% times(1,8)=etime(t2,t1);
% times(2,8)=etime(t3,t2);
% 
% % lsb
% [ tcip, key_pre ] = noise_en1( im, key );
% t1=clock;
% for i=1:tct
% [ cip ] = embed_lsb( tcip,cover );
% end
% t2=clock;
% for i=1:tct
% [ rtcip ] = extract_lsb( cip );
% end
% t3=clock;
% [ rim ] = noise_den1( rtcip,key_pre );
% times(1,9)=etime(t2,t1);
% times(2,9)=etime(t3,t2);
% 
% % lsb+2k
% [ tcip, key_pre ] = noise_en1( im, key );
% t1=clock;
% for i=1:tct
% [ cip ] = embed_lsb_2k( tcip,cover );
% end
% t2=clock;
% for i=1:tct
% [ rtcip ] = extract_lsb_2k( cip );
% end
% t3=clock;
% [ rim ] = noise_den1( rtcip,key_pre );
% times(1,10)=etime(t2,t1);
% times(2,10)=etime(t3,t2);
% 
% % 矩阵编码
% [ tcip, key_pre ] = noise_en1( im, key );
% t1=clock;
% for i=1:tct
% [ cip ] = embed_encod( tcip,cover );
% end
% t2=clock;
% for i=1:tct
% [ rtcip ] = extract_encod( cip );
% end
% t3=clock;
% [ rim ] = noise_den1( rtcip,key_pre );
% times(1,11)=etime(t2,t1);
% times(2,11)=etime(t3,t2);
% times=times/tct;
% 
% figure(1)
% imshow(uint8(im))
% figure(2)
% imshow(uint8(tcip))
% figure(3)
% imshow(uint8(cip))
% figure(4)
% imshow(uint8(rim))

