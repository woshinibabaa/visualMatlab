function [   ] = matlab168(  )
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%     ̬ͬ�˲���һ��������˲�������������ѹ���ҶȵĶ�̬��Χ��ͬʱ��ǿ�Աȶȡ�
% ���ִ���������˵��һ����ѧ���ɣ�������˵����Ϊ�����Ӿ�ϵͳ��ͼ�����Ⱦ�����
% ������ѧ�ķ��������㡣
I = imread('d:\68.jpg');
subplot(121);imshow(I);title('ԭʼͼ��');
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
subplot(122);imshow(g);title('̬ͬ�˲���');
end

