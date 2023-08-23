%% 有意义密文综述文献对比
clc;clear all;close all;clear;

%% 类噪声密文为均匀分布类型
key='8d5ab8ba5340fce4420829ad5d12a0e45dacb0858544163d04c1d02b73e3697d';

im = imread('date/5.bmp');
im = double(imresize(im,[256,256]));
cover = double(imread('date/6.bmp'));
dwt_typ='haar';

psnr11=[];
ssim11=[];

imwrite(uint8(cover(230:280,50:100)),'cip1/1.bmp')
imwrite(uint8(cover),'cip1/2.bmp')

% Image encryption: Generating visually meaningful encrypted images
[ tcip, key_pre ] = noise_en1( im, key );
[ cip ] = embed2015( tcip,cover,dwt_typ );
[ rtcip ] = extract2015( cip,dwt_typ );
[ rim ] = noise_den1( rtcip,key_pre );

psnr1 = psnr(double(uint8(cip)),cover,255);
ssim1 = ssim(uint8(cip),uint8(cover));
psnr11 = [psnr11,psnr1];
ssim11 = [ssim11,ssim1];


% Eliminating the texture features in visually meaningful cipher image
[ tcip, key_pre ] = noise_en1( im, key );
[ cip ] = embed2017( tcip,cover,dwt_typ );
[ rtcip ] = extract2017( cip,cover,dwt_typ );
[ rim ] = noise_den1( rtcip,key_pre );

psnr1 = psnr(double(uint8(cip)),cover,255);
ssim1 = ssim(uint8(cip),uint8(cover));
psnr11 = [psnr11,psnr1];
ssim11 = [ssim11,ssim1];


% An algorithm for encryption of secret images into meaningful images
[ tcip, key_pre ] = noise_en1( im, key );
[ cip,cover2 ] = embed_dwt_lsb( tcip,cover,dwt_typ );
[ rtcip ] = extract_dwt_lsb( cip,dwt_typ );
[ rim ] = noise_den1( rtcip,key_pre );

psnr1 = psnr(double(uint8(cip)),cover,255);
ssim1 = ssim(uint8(cip),uint8(cover));
psnr11 = [psnr11,psnr1];
ssim11 = [ssim11,ssim1];

% Visually meaningful image encryption based on universal embedding mode
[ tcip, key_pre ] = noise_en1( im, key );
[ cip ] = embed_dwt_2k( tcip,cover,dwt_typ );
[ rtcip ] = extract_dwt_2k( cip,dwt_typ );
[ rim ] = noise_den1( rtcip,key_pre );

psnr1 = psnr(double(uint8(cip)),cover,255);
ssim1 = ssim(uint8(cip),uint8(cover));
psnr11 = [psnr11,psnr1];
ssim11 = [ssim11,ssim1];

% Uing m-ary decomposition and virtual bits for visually 
% meaningful image encryption
[ tcip, key_pre ] = noise_en1( im, key );
[ cip ] = embed_Mary( tcip,cover,dwt_typ );
[ rtcip ] = extract_Mary( cip,dwt_typ );
[ rim ] = noise_den1( rtcip,key_pre );

psnr1 = psnr(double(uint8(cip)),cover,255);
ssim1 = ssim(uint8(cip),uint8(cover));
psnr11 = [psnr11,psnr1];
ssim11 = [ssim11,ssim1];

% An adjustable visual image cryptosystem based on 6d hyperchaotic
% system and compressive sensing
t=0.2;
[ tcip, key_pre ] = noise_en1( im, key );
[ cip ] = embed_bezi( tcip,cover,t,dwt_typ );
[ rtcip ] = extract_bezi( cip,cover,t,dwt_typ );
[ rim ] = noise_den1( rtcip,key_pre );

psnr1 = psnr(double(uint8(cip)),cover,255);
ssim1 = ssim(uint8(cip),uint8(cover));
psnr11 = [psnr11,psnr1];
ssim11 = [ssim11,ssim1];

% Maningful image encryption algorithm based on com-
% pressive sensing and integer wavelet transform
t=0.2;
[ tcip, key_pre ] = noise_en1( im, key );
[ cip ] = embed_af( tcip,cover,t,dwt_typ );
[ rtcip ] = extract_af( cip,cover,t,dwt_typ );
[ rim ] = noise_den1( rtcip,key_pre );

psnr1 = psnr(double(uint8(cip)),cover,255);
ssim1 = ssim(uint8(cip),uint8(cover));
psnr11 = [psnr11,psnr1];
ssim11 = [ssim11,ssim1];


% A robust meaningful image encryption scheme based on block compressive 
% sensing and SVD embeddin
t=0.2;
[ tcip, key_pre ] = noise_en1( im, key );
[ cip ] = embed_svd( tcip,cover,t,dwt_typ );
[ rtcip ] = extract_svd( cip,cover,t,dwt_typ );
[ rim ] = noise_den1( rtcip,key_pre );

psnr1 = psnr(double(uint8(cip)),cover,255);
ssim1 = ssim(uint8(cip),uint8(cover));
psnr11 = [psnr11,psnr1];
ssim11 = [ssim11,ssim1];


% A efficient visually meaning-ful image compression and encryption 
% scheme based on compressive sensing and dynamic lsb embedding
[ tcip, key_pre ] = noise_en1( im, key );
[ cip ] = embed_lsb( tcip,cover );
[ rtcip ] = extract_lsb( cip );
[ rim ] = noise_den1( rtcip,key_pre );

psnr1 = psnr(double(uint8(cip)),cover,255);
ssim1 = ssim(uint8(cip),uint8(cover));
psnr11 = [psnr11,psnr1];
ssim11 = [ssim11,ssim1];

% A visually meaningful image encryption algorithm based on adaptive 
% 2d compressive sensing and chaotic system
[ tcip, key_pre ] = noise_en1( im, key );
[ cip ] = embed_lsb_2k( tcip,cover );
[ rtcip ] = extract_lsb_2k( cip );
[ rim ] = noise_den1( rtcip,key_pre );

psnr1 = psnr(double(uint8(cip)),cover,255);
ssim1 = ssim(uint8(cip),uint8(cover));
psnr11 = [psnr11,psnr1];
ssim11 = [ssim11,ssim1];

% Visually secure image encryption using adaptive-thresholding 
% sparsification and parallel compressive sensing
[ tcip, key_pre ] = noise_en1( im, key );
[ cip ] = embed_encod( tcip,cover );
[ rtcip ] = extract_encod( cip );
[ rim ] = noise_den1( rtcip,key_pre );

psnr1 = psnr(double(uint8(cip)),cover,255);
ssim1 = ssim(uint8(cip),uint8(cover));
psnr11 = [psnr11,psnr1];
ssim11 = [ssim11,ssim1];


%% 类噪声密文为均匀分布类型
% key='8d5ab8ba5340fce4420829ad5d12a0e45dacb0858544163d04c1d02b73e3697d';
% 
% im = imread('date/1.bmp');
% cover = double(imread('date/2.bmp'));
% dwt_typ='haar';
% 
% psnr11=[];
% ssim11=[];
% 
% % Image encryption: Generating visually meaningful encrypted images
% [ tcip,dnkey, min_p3, max_p3,cr ] = noise_en2( im,key );
% [ cip ] = embed2015( tcip,cover,dwt_typ );
% [ rtcip ] = extract2015( cip,dwt_typ );
% [ rim ] = noise_den2( rtcip,dnkey,min_p3,max_p3,cr );
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% 
% % Eliminating the texture features in visually meaningful cipher image
% [ tcip,dnkey, min_p3, max_p3,cr ] = noise_en2( im,key );
% [ cip ] = embed2017( tcip,cover,dwt_typ );
% [ rtcip ] = extract2017( cip,cover,dwt_typ );
% [ rim ] = noise_den2( rtcip,dnkey,min_p3,max_p3,cr );
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% 
% % An algorithm for encryption of secret images into meaningful images
% [ tcip,dnkey, min_p3, max_p3,cr ] = noise_en2( im,key );
% [ cip,cover2 ] = embed_dwt_lsb( tcip,cover,dwt_typ );
% [ rtcip ] = extract_dwt_lsb( cip,dwt_typ );
% [ rim ] = noise_den2( rtcip,dnkey,min_p3,max_p3,cr );
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% % Visually meaningful image encryption based on universal embedding mode
% [ tcip,dnkey, min_p3, max_p3,cr ] = noise_en2( im,key );
% [ cip ] = embed_dwt_2k( tcip,cover,dwt_typ );
% [ rtcip ] = extract_dwt_2k( cip,dwt_typ );
% [ rim ] = noise_den2( rtcip,dnkey,min_p3,max_p3,cr );
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% % Uing m-ary decomposition and virtual bits for visually 
% % meaningful image encryption
% [ tcip,dnkey, min_p3, max_p3,cr ] = noise_en2( im,key );
% [ cip ] = embed_Mary( tcip,cover,dwt_typ );
% [ rtcip ] = extract_Mary( cip,dwt_typ );
% [ rim ] = noise_den2( rtcip,dnkey,min_p3,max_p3,cr );
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% % An adjustable visual image cryptosystem based on 6d hyperchaotic
% % system and compressive sensing
% t=0.2;
% [ tcip,dnkey, min_p3, max_p3,cr ] = noise_en2( im,key );
% [ cip ] = embed_bezi( tcip,cover,t,dwt_typ );
% [ rtcip ] = extract_bezi( cip,cover,t,dwt_typ );
% [ rim ] = noise_den2( rtcip,dnkey,min_p3,max_p3,cr );
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% % Maningful image encryption algorithm based on com-
% % pressive sensing and integer wavelet transform
% t=0.2;
% [ tcip,dnkey, min_p3, max_p3,cr ] = noise_en2( im,key );
% [ cip ] = embed_af( tcip,cover,t,dwt_typ );
% [ rtcip ] = extract_af( cip,cover,t,dwt_typ );
% [ rim ] = noise_den2( rtcip,dnkey,min_p3,max_p3,cr );
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% 
% % A robust meaningful image encryption scheme based on block compressive 
% % sensing and SVD embeddin
% t=0.2;
% [ tcip,dnkey, min_p3, max_p3,cr ] = noise_en2( im,key );
% [ cip ] = embed_svd( tcip,cover,t,dwt_typ );
% [ rtcip ] = extract_svd( cip,cover,t,dwt_typ );
% [ rim ] = noise_den2( rtcip,dnkey,min_p3,max_p3,cr );
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% 
% % A efficient visually meaning-ful image compression and encryption 
% % scheme based on compressive sensing and dynamic lsb embedding
% [ tcip,dnkey, min_p3, max_p3,cr ] = noise_en2( im,key );
% [ cip ] = embed_lsb( tcip,cover );
% [ rtcip ] = extract_lsb( cip );
% [ rim ] = noise_den2( rtcip,dnkey,min_p3,max_p3,cr );
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% % A visually meaningful image encryption algorithm based on adaptive 
% % 2d compressive sensing and chaotic system
% [ tcip,dnkey, min_p3, max_p3,cr ] = noise_en2( im,key );
% [ cip ] = embed_lsb_2k( tcip,cover );
% [ rtcip ] = extract_lsb_2k( cip );
% [ rim ] = noise_den2( rtcip,dnkey,min_p3,max_p3,cr );
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
% 
% % Visually secure image encryption using adaptive-thresholding 
% % sparsification and parallel compressive sensing
% [ tcip,dnkey, min_p3, max_p3,cr ] = noise_en2( im,key );
% [ cip ] = embed_encod( tcip,cover );
% [ rtcip ] = extract_encod( cip );
% [ rim ] = noise_den2( rtcip,dnkey,min_p3,max_p3,cr );
% 
% psnr1 = psnr(double(uint8(cip)),cover,255);
% ssim1 = ssim(uint8(cip),uint8(cover));
% psnr11 = [psnr11,psnr1];
% ssim11 = [ssim11,ssim1];
