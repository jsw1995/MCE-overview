
%% 有意义密文综述文献对比
% 类噪声密文为类高斯分布类型
clc;clear all;close all;clear;
key='8d5ab8ba5340fce4420829ad5d12a0e45dacb0858544163d04c1d02b73e3697d';
%% 190次循环

dwt_typ='haar';
path_file = 'date\';
fileExt = '*.bmp';  %待读取图像的后缀名
%获取所有路径
plain_files = dir(fullfile(path_file,fileExt)); 
plain_len1 = size(plain_files,1);

% for i=1:plain_len1;
%    fileName = strcat(path1,plain_files(i).name); 
%    eval(['plaint',num2str(i),'=','imread(fileName)',';'])
% end

psnr11=ones(plain_len1*(plain_len1-1),11);
ssim11=ones(plain_len1*(plain_len1-1),11);
ncc11=ones(plain_len1*(plain_len1-1),11);
num = 0;
for i=1:plain_len1
    cover = double(imread(strcat(path_file,plain_files(i).name)));
    for j=1:plain_len1
        if i ~= j
            num = num+1;
            im = double(imread(strcat(path_file,plain_files(j).name)));
            [ tcip,dnkey,min_p3,max_p3,cr ] = noise_en2( im,key );

            % 2015
            [ cip ] = embed2015( tcip,cover,dwt_typ );

            psnr1 = psnr(double(uint8(cip)),cover,255);
            ssim1 = ssim(uint8(cip),uint8(cover));
            ncc1 = NCC(uint8(cip),uint8(cover));
            psnr11(num,1) = psnr1;
            ssim11(num,1) = ssim1;
            ncc11(num,1) = ncc1;

            % 2017
%             [ tcip,dnkey,min_p3,max_p3,cr ] = noise_en2( im,key );
            [ cip ] = embed2017( tcip,cover,dwt_typ );

            psnr1 = psnr(double(uint8(cip)),cover,255);
            ssim1 = ssim(uint8(cip),uint8(cover));
            ncc1 = NCC(uint8(cip),uint8(cover));
            psnr11(num,2) = psnr1;
            ssim11(num,2) = ssim1;
            ncc11(num,2) = ncc1;
            
            % dwt_lsb
%             [ tcip,dnkey,min_p3,max_p3,cr ] = noise_en2( im,key );
            [ cip,cover2 ] = embed_dwt_lsb( tcip,cover,dwt_typ );

            psnr1 = psnr(double(uint8(cip)),cover,255);
            ssim1 = ssim(uint8(cip),uint8(cover));
            ncc1 = NCC(uint8(cip),uint8(cover));
            psnr11(num,3) = psnr1;
            ssim11(num,3) = ssim1;
            ncc11(num,3) = ncc1;

            % dwt_2k
%             [ tcip,dnkey,min_p3,max_p3,cr ] = noise_en2( im,key );
            [ cip ] = embed_dwt_2k( tcip,cover,dwt_typ );

            psnr1 = psnr(double(uint8(cip)),cover,255);
            ssim1 = ssim(uint8(cip),uint8(cover));
            ncc1 = NCC(uint8(cip),uint8(cover));
            psnr11(num,4) = psnr1;
            ssim11(num,4) = ssim1;
            ncc11(num,4) = ncc1;

            % Mary 分解
%             [ tcip,dnkey,min_p3,max_p3,cr ] = noise_en2( im,key );
            [ cip ] = embed_Mary( tcip,cover,dwt_typ );

            psnr1 = psnr(double(uint8(cip)),cover,255);
            ssim1 = ssim(uint8(cip),uint8(cover));
            ncc1 = NCC(uint8(cip),uint8(cover));
            psnr11(num,5) = psnr1;
            ssim11(num,5) = ssim1;
            ncc11(num,5) = ncc1;

            % 贝塞尔曲线
            t=0.2;
%             [ tcip,dnkey,min_p3,max_p3,cr ] = noise_en2( im,key );
            [ cip ] = embed_bezi( tcip,cover,t,dwt_typ );

            psnr1 = psnr(double(uint8(cip)),cover,255);
            ssim1 = ssim(uint8(cip),uint8(cover));
            ncc1 = NCC(uint8(cip),uint8(cover));
            psnr11(num,6) = psnr1;
            ssim11(num,6) = ssim1;
            ncc11(num,6) = ncc1;
            
            % af
            t=0.2;
%             [ tcip, key_pre ] = noise_en1( im, key );
            [ cip ] = embed_af( tcip,cover,t,dwt_typ );

            psnr1 = psnr(double(uint8(cip)),cover,255);
            ssim1 = ssim(uint8(cip),uint8(cover));
            ncc1 = NCC(uint8(cip),uint8(cover));
            psnr11(num,7) = psnr1;
            ssim11(num,7) = ssim1;
            ncc11(num,7) = ncc1;

            % svd
            t=0.25;
%             [ tcip,dnkey,min_p3,max_p3,cr ] = noise_en2( im,key );
            [ cip ] = embed_svd( tcip,cover,t,dwt_typ );

            psnr1 = psnr(double(uint8(cip)),cover,255);
            ssim1 = ssim(uint8(cip),uint8(cover));
            ncc1 = NCC(uint8(cip),uint8(cover));
            psnr11(num,8) = psnr1;
            ssim11(num,8) = ssim1;
            ncc11(num,8) = ncc1;

            % lsb
%             [ tcip,dnkey,min_p3,max_p3,cr ] = noise_en2( im,key );
            [ cip ] = embed_lsb( tcip,cover );

            psnr1 = psnr(double(uint8(cip)),cover,255);
            ssim1 = ssim(uint8(cip),uint8(cover));
            ncc1 = NCC(uint8(cip),uint8(cover));
            psnr11(num,9) = psnr1;
            ssim11(num,9) = ssim1;
            ncc11(num,9) = ncc1;

            % lsb+2k
%             [ tcip,dnkey,min_p3,max_p3,cr ] = noise_en2( im,key );
            [ cip ] = embed_lsb_2k( tcip,cover );

            psnr1 = psnr(double(uint8(cip)),cover,255);
            ssim1 = ssim(uint8(cip),uint8(cover));
            ncc1 = NCC(uint8(cip),uint8(cover));
            psnr11(num,10) = psnr1;
            ssim11(num,10) = ssim1;
            ncc11(num,10) = ncc1;

            % 矩阵编码
%             [ tcip,dnkey,min_p3,max_p3,cr ] = noise_en2( im,key );
            [ cip ] = embed_encod( tcip,cover );

            psnr1 = psnr(double(uint8(cip)),cover,255);
            ssim1 = ssim(uint8(cip),uint8(cover));
            ncc1 = NCC(uint8(cip),uint8(cover));
            psnr11(num,11) = psnr1;
            ssim11(num,11) = ssim1;
            ncc11(num,11) = ncc1;
            
        end
    end
end
psnr2 = mean(psnr11,1);
ssim2 = mean(ssim11,1);
ncc2 = mean(ncc11,1);
