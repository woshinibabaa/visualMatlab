function [ ] = wahaha( )
%UNTITLED6 此处显示有关此函数的摘要
%   此处显示详细说明
[I,map] = imread('d:\1.jpg');
subplot(221);imshow(I);
xlabel('(a)orignal image');
I = double(I);   
[IX,IY]=gradient(I);   % 梯度
gm = sqrt(IX.*IX + IY.*IY);
out1 = gm;
subplot(222);imshow(out1,map);
xlabel('(b)梯度值');
out2 = I;
J = find(gm>=15);
out2(J) = gm(J);
subplot(223);imshow(out2,map);
xlabel('(c)加阈值梯度值');
out3 = I;
J = find(gm<20);
out3(J) = 255;
K = find(gm<20);
out3(K) = 0;
subplot(224);imshow(out3,map);
xlabel('(d)二值化');
end

