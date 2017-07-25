function [   ] = matlab168(  )
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
%     同态滤波是一种特殊的滤波技术，可用于压缩灰度的动态范围，同时增强对比度。
% 这种处理方法与其说是一种数学技巧，倒不如说是因为人眼视觉系统对图像亮度具有类
% 似于数学的非线性运算。
I = imread('d:\68.jpg');
subplot(121);imshow(I);title('原始图像');
J = double(I);
f = fft2(J);
g = fftshift(f);
[M,N] = size(f);
d0 = 10;
r1 = 0.5;
rh =2;
c =4;
n1 =floor(M/2);n2 = floor(N/2);
for i =1:M
    for j=1:N
        d = sqrt((i-n1)^2+(j-n2)^2);
        h = (rh-r1)*(1-exp(-c*(d.^2/d0.^2)))+r1;
        g(i,j) = h*g(i,j);
    end
end
g = ifftshift(g);
g = uint8(real(ifft2(g)));
subplot(122);imshow(g);title('同态滤波器');
end

