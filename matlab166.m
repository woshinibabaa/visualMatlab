function [  ] = matlab166(  )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
% 
%     带阻滤波器是用来抵制距离频域中心一定距离的一个圆环区域的频率，
% 可以用来消除一定频率范围内的的周期噪声。带阻滤波器包括理想带阻滤
% 波器、巴特沃斯代阻滤波器。
% 
I = imread('d:\66.jpg');
I = rgb2gray(I);
subplot(221);imshow(I);
title('原始图像');
I = imnoise(I,'gaussian',0,0.015);  % 添加噪声
subplot(222);imshow(I);title('有噪声的图像');

I = im2double(I);
M = 2*size(I,1);
N = 2*size(I,2);
u = -M/2:(M/2-1);
v = -N/2:(N/2-1);
[U,V]= meshgrid(u,v);
D = sqrt(U.^2+V.^2);
D0= 50;
W = 30;   % 滤波器带宽

H1 = double(or(D<(D0-W/2),D>D0+W/2));
J1 = fftshift(fft2(I,size(H1,1),size(H1,2))); % 时域转换为频域
K1 = J1.*H1;
L1 = ifft2(ifftshift(K1));
L1 = L1(1:size(I,1),1:size(I,2));
subplot(223);imshow(L1);title('理想代阻滤波器')

n =6;       %巴特沃斯滤波器阶数
H2 = 1./((1+((D.*W)./(D.^2-D0.^2)).^(2*n)));
J2 = fftshift(fft2(I,size(H2,1),size(H2,2)));
K2 = J2.*H2;
L2 = ifft2(ifftshift(K2));
L2 = L2(1:size(I,1),1:size(I,2));
subplot(224);imshow(L2);title('巴特沃斯高通滤波器');
end

