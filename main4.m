%%
%对比封面不同的规划方式的不同
%用2015与mary两个作为实验对象
%记得在两个嵌入函数中进行修改封面规划方式
%% 密文质量
% clc;clear all;close all;clear;
% key='8d5ab8ba5340fce4420829ad5d12a0e45dacb0858544163d04c1d02b73e3697d';
% dwt_typ='haar';
% path_file = 'date\';
% fileExt = '*.bmp';  %待读取图像的后缀名
% %获取所有路径
% plain_files = dir(fullfile(path_file,fileExt)); 
% plain_len1 = size(plain_files,1);
% 
% psnr11=ones(plain_len1*(plain_len1-1),2);
% ssim11=ones(plain_len1*(plain_len1-1),2);
% ncc11=ones(plain_len1*(plain_len1-1),2);
% num = 0;
% for i=1:plain_len1
%     cover = double(imread(strcat(path_file,plain_files(i).name)));
%     for j=1:plain_len1
%         if i ~= j
%             num = num+1;
%             im = imread(strcat(path_file,plain_files(j).name));
%             im = double(imresize(im,[256,256]));
%             [ tcip, key_pre ] = noise_en1( im, key );
% 
%             % 2015
%             [ cip ] = embed2015( tcip,cover,dwt_typ );
%            
% 
%             psnr1 = psnr(double(uint8(cip)),cover,255);
%             ssim1 = ssim(uint8(cip),uint8(cover));
%             ncc1 = NCC(uint8(cip),uint8(cover));
%             psnr11(num,1) = psnr1;
%             ssim11(num,1) = ssim1;
%             ncc11(num,1) = ncc1;
% 
% 
%             % Mary 分解
%             [ cip ] = embed_Mary( tcip,cover,dwt_typ );
%             
% 
%             psnr1 = psnr(double(uint8(cip)),cover,255);
%             ssim1 = ssim(uint8(cip),uint8(cover));
%             ncc1 = NCC(uint8(cip),uint8(cover));
%             psnr11(num,2) = psnr1;
%             ssim11(num,2) = ssim1;
%             ncc11(num,2) = ncc1;
%         end
%     end
% end
% psnr2 = mean(psnr11,1);
% ssim2 = mean(ssim11,1);
% ncc2 = mean(ncc11,1);
%% 隐写分析
clc;clear all;close all;clear;
key='8d5ab8ba5340fce4420829ad5d12a0e45dacb0858544163d04c1d02b73e3697d';
%% 190次循环

% dwt_typ='haar';
% 
% plain_file = 'date2\';
% fileExt = '*.bmp';  %待读取图像的后缀名
% plain_files = dir(fullfile(plain_file,fileExt)); 
% plain_len = size(plain_files,1);
% 
% num = 0;
% rng(0)
% r1 = randi(plain_len,200,1);  
% r2 = randi(plain_len,200,1);
% 
% for i=1:200
%     
%     im = imread(strcat(plain_file,plain_files(r1(i)).name));
%     cover = double(imread(strcat(plain_file,plain_files(r2(i)).name)));
%     [ tcip, key_pre ] = noise_en1( double(imresize(im,[256,256])),key );
%     num = num+1;
%     
% %     imwrite(uint8(cover),strcat(strcat('date22/',num2str(num)),'.bmp'))
%     
%     % 2015
%     [ cip ] = embed2015( tcip,cover,dwt_typ );
%     imwrite(uint8(cip),strcat(strcat('cip1100/',num2str(num)),'.bmp'))
% 
%     % Mary 分解
%     [ cip ] = embed_Mary( tcip,cover,dwt_typ );
%     imwrite(uint8(cip),strcat(strcat('cip1144/',num2str(num)),'.bmp'))
% 
% end


aa = ones([400,1]);
aa(201:400)=0;

b = csvread ('date2/date.csv',2,3);

a1 = csvread ('cip1100/cip1100.csv',2,3);
out1 = [a1(:,5);b(:,5)];
a2 = csvread ('cip1144/cip1144.csv',2,3);
out2 = [a2(:,5);b(:,5)];

[b1]=AUC(aa,out1);
[b2]=AUC(aa,out2);

