function [ ] = matlab162()
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%   ��ͼ��ʵ�ֲ�ͬ�ĵ�ͨ�˲�Ч��
I = imread('d:\67.jpg');
I = rgb2gray(I);
I = im2double(I);
M = 2*size(I,1);
N = 2*size(I,2);
u = -M/2:(M/2-1);
v = -N/2:(N/2-1);
[U,V]= meshgrid(u,v);
D = sqrt(U.^2+V.^2);
D0 = 80;
H1 = double(D<=D0);

J1 = fftshift(fft2(I,size(H1,1),size(H1,2))); %ʱ��ͼ��ת��ΪƵ��
K1 = J1 .* H1;
L1 = ifft2(ifftshift(K1));
L1 = L1(1:size(I,1),1:size(I,2));              %Ƶ��ͼ��ת��Ϊʱ��
subplot(221);imshow(I);
title('orginal image');
subplot(222);imshow(L1);
title('�����ͨ�˲���');

n =6;
H2 = 1./(1+(D./D0).^(2*n));
J2 = fftshift(fft2(I,size(H2,1),size(H2,2)));
K2 = J2.*H2;
L2 = ifft2(ifftshift(K2));
L2 = L2(1:size(I,1),1:size(I,2)); 
subplot(223);imshow(L2);title('������˹��ͨ�˲���');

H3 = exp(-(D.^2)./(2*(D0.^2)));
J3 = fftshift(fft2(I,size(H3,1),size(H3,2)));
K3 = J3.*H3;
L3 = ifft2(ifftshift(K3));
L3 = L3(1:size(I,1),1:size(I,2));
subplot(224);imshow(L3);title('��˹��ͨ�˲�');
end

