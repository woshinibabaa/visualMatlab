function [  ] = matlab166(  )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% 
%     �����˲������������ƾ���Ƶ������һ�������һ��Բ�������Ƶ�ʣ�
% ������������һ��Ƶ�ʷ�Χ�ڵĵ����������������˲����������������
% ������������˹�����˲�����
% 
I = imread('d:\66.jpg');
I = rgb2gray(I);
subplot(221);imshow(I);
title('ԭʼͼ��');
I = imnoise(I,'gaussian',0,0.015);  % �������
subplot(222);imshow(I);title('��������ͼ��');

I = im2double(I);
M = 2*size(I,1);
N = 2*size(I,2);
u = -M/2:(M/2-1);
v = -N/2:(N/2-1);
[U,V]= meshgrid(u,v);
D = sqrt(U.^2+V.^2);
D0= 50;
W = 30;   % �˲�������

H1 = double(or(D<(D0-W/2),D>D0+W/2));
J1 = fftshift(fft2(I,size(H1,1),size(H1,2))); % ʱ��ת��ΪƵ��
K1 = J1.*H1;
L1 = ifft2(ifftshift(K1));
L1 = L1(1:size(I,1),1:size(I,2));
subplot(223);imshow(L1);title('��������˲���')

n =6;       %������˹�˲�������
H2 = 1./((1+((D.*W)./(D.^2-D0.^2)).^(2*n)));
J2 = fftshift(fft2(I,size(H2,1),size(H2,2)));
K2 = J2.*H2;
L2 = ifft2(ifftshift(K2));
L2 = L2(1:size(I,1),1:size(I,2));
subplot(224);imshow(L2);title('������˹��ͨ�˲���');
end

