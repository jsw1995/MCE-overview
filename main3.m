
%% 有意义密文综述文献对比
clc;clear all;close all;clear;
key='8d5ab8ba5340fce4420829ad5d12a0e45dacb0858544163d04c1d02b73e3697d';
%% 190次循环

dwt_typ='haar';

plain_file = 'boss\BOSSbase_1.01\';
fileExt = '*.pgm';  %待读取图像的后缀名
plain_files = dir(fullfile(plain_file,fileExt)); 
plain_len = size(plain_files,1);

% cover_file = 'date3\';
% fileExt = '*.pgm';  %待读取图像的后缀名
% cover_files = dir(fullfile(cover_file,fileExt)); 
% cover_len = size(cover_files,1);

psnr11=ones(200,11);
ssim11=ones(200,11);
ncc11=ones(200,11);
num = 0;
rng(0)
r1 = randi(plain_len,200,1);  %一万张图片随机选两张出现一样的概率极少这里不做判断，当然也可以进行判断再取值
r2 = randi(plain_len,200,1);

for i=1:200
    
    im = imread(strcat(plain_file,plain_files(r1(i)).name));
    cover = double(imread(strcat(plain_file,plain_files(r2(i)).name)));
    [ tcip, key_pre ] = noise_en1( double(imresize(im,[256,256])),key );
%     [ tcip,dnkey,min_p3,max_p3,cr ] = noise_en2( double(im),key );
    num = num+1;
    
    imwrite(uint8(cover),strcat(strcat('date2/',num2str(num)),'.bmp'))
    
    % 2015
    [ cip ] = embed2015( tcip,cover,dwt_typ );
    imwrite(uint8(cip),strcat(strcat('cip110/',num2str(num)),'.bmp'))

    psnr1 = psnr(double(uint8(cip)),cover,255);
    ssim1 = ssim(uint8(cip),uint8(cover));
    ncc1 = NCC(uint8(cip),uint8(cover));
    psnr11(num,1) = psnr1;
    ssim11(num,1) = ssim1;
    ncc11(num,1) = ncc1;

    % 2017
    [ cip ] = embed2017( tcip,cover,dwt_typ );
    imwrite(uint8(cip),strcat(strcat('cip111/',num2str(num)),'.bmp'))


    psnr1 = psnr(double(uint8(cip)),cover,255);
    ssim1 = ssim(uint8(cip),uint8(cover));
    ncc1 = NCC(uint8(cip),uint8(cover));
    psnr11(num,2) = psnr1;
    ssim11(num,2) = ssim1;
    ncc11(num,2) = ncc1;

    % dwt_lsb
    [ cip,cover2 ] = embed_dwt_lsb( tcip,cover,dwt_typ );
    imwrite(uint8(cip),strcat(strcat('cip112/',num2str(num)),'.bmp'))


    psnr1 = psnr(double(uint8(cip)),cover,255);
    ssim1 = ssim(uint8(cip),uint8(cover));
    ncc1 = NCC(uint8(cip),uint8(cover));
    psnr11(num,3) = psnr1;
    ssim11(num,3) = ssim1;
    ncc11(num,3) = ncc1;

    % dwt_2k
    [ cip ] = embed_dwt_2k( tcip,cover,dwt_typ );
    imwrite(uint8(cip),strcat(strcat('cip113/',num2str(num)),'.bmp'))


    psnr1 = psnr(double(uint8(cip)),cover,255);
    ssim1 = ssim(uint8(cip),uint8(cover));
    ncc1 = NCC(uint8(cip),uint8(cover));
    psnr11(num,4) = psnr1;
    ssim11(num,4) = ssim1;
    ncc11(num,4) = ncc1;

    % Mary 分解
    [ cip ] = embed_Mary( tcip,cover,dwt_typ );
    imwrite(uint8(cip),strcat(strcat('cip114/',num2str(num)),'.bmp'))


    psnr1 = psnr(double(uint8(cip)),cover,255);
    ssim1 = ssim(uint8(cip),uint8(cover));
    ncc1 = NCC(uint8(cip),uint8(cover));
    psnr11(num,5) = psnr1;
    ssim11(num,5) = ssim1;
    ncc11(num,5) = ncc1;

    % 贝塞尔曲线
    t=0.2;
    [ cip ] = embed_bezi( tcip,cover,t,dwt_typ );
    imwrite(uint8(cip),strcat(strcat('cip115/',num2str(num)),'.bmp'))


    psnr1 = psnr(double(uint8(cip)),cover,255);
    ssim1 = ssim(uint8(cip),uint8(cover));
    ncc1 = NCC(uint8(cip),uint8(cover));
    psnr11(num,6) = psnr1;
    ssim11(num,6) = ssim1;
    ncc11(num,6) = ncc1;

    % af
    t=0.2;
    [ cip ] = embed_af( tcip,cover,t,dwt_typ );
    imwrite(uint8(cip),strcat(strcat('cip116/',num2str(num)),'.bmp'))


    psnr1 = psnr(double(uint8(cip)),cover,255);
    ssim1 = ssim(uint8(cip),uint8(cover));
    ncc1 = NCC(uint8(cip),uint8(cover));
    psnr11(num,7) = psnr1;
    ssim11(num,7) = ssim1;
    ncc11(num,7) = ncc1;

    % svd
    t=0.25;
    [ cip ] = embed_svd( tcip,cover,t,dwt_typ );
    imwrite(uint8(cip),strcat(strcat('cip117/',num2str(num)),'.bmp'))


    psnr1 = psnr(double(uint8(cip)),cover,255);
    ssim1 = ssim(uint8(cip),uint8(cover));
    ncc1 = NCC(uint8(cip),uint8(cover));
    psnr11(num,8) = psnr1;
    ssim11(num,8) = ssim1;
    ncc11(num,8) = ncc1;

    % lsb
    [ cip ] = embed_lsb( tcip,cover );
    imwrite(uint8(cip),strcat(strcat('cip118/',num2str(num)),'.bmp'))


    psnr1 = psnr(double(uint8(cip)),cover,255);
    ssim1 = ssim(uint8(cip),uint8(cover));
    ncc1 = NCC(uint8(cip),uint8(cover));
    psnr11(num,9) = psnr1;
    ssim11(num,9) = ssim1;
    ncc11(num,9) = ncc1;

    % lsb+2k
    [ cip ] = embed_lsb_2k( tcip,cover );
    imwrite(uint8(cip),strcat(strcat('cip119/',num2str(num)),'.bmp'))


    psnr1 = psnr(double(uint8(cip)),cover,255);
    ssim1 = ssim(uint8(cip),uint8(cover));
    ncc1 = NCC(uint8(cip),uint8(cover));
    psnr11(num,10) = psnr1;
    ssim11(num,10) = ssim1;
    ncc11(num,10) = ncc1;

    % 矩阵编码
    [ cip ] = embed_encod( tcip,cover );
    imwrite(uint8(cip),strcat(strcat('cip120/',num2str(num)),'.bmp'))


    psnr1 = psnr(double(uint8(cip)),cover,255);
    ssim1 = ssim(uint8(cip),uint8(cover));
    ncc1 = NCC(uint8(cip),uint8(cover));
    psnr11(num,11) = psnr1;
    ssim11(num,11) = ssim1;
    ncc11(num,11) = ncc1;
            

end
psnr2 = mean(psnr11,1);
ssim2 = mean(ssim11,1);
ncc2 = mean(ncc11,1);
