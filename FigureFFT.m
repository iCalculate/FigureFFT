[filename, pathname] = uigetfile('*.jpg', '��ȡͼƬ�ļ�'); %ѡ��ͼƬ�ļ�
if isequal(filename,0)   %�ж��Ƿ�ѡ��
   msgbox('û��ѡ���κ�ͼƬ');
else
   pathfile=fullfile(pathname, filename);  %���ͼƬ·��
   M=imread(pathfile);     %��ͼƬ�������
%   image(I);    %����ͼƬ
end
imshow(M);

[m, n, z] = size(M); 
[x,y] = ginput(2);    %ȷ��ͼ���ϵ���������ginput����������ֵ�����������
pt = [x(1),y(1)]; wSize = [abs(x(1)-x(2)),abs(y(1)-y(2))]; 
M_reg = drawRect(M,pt,wSize,4,[255 0 0]);
I = imcrop(M,[x(1),y(1),abs(x(1)-x(2)),abs(y(1)-y(2))]);
%����imcrop������ͼ������и���������һ���������꣬
%�Ӹö����������abs(x(1)-x(2))������abs(y(1)-y(2))����������и�
I=rgb2gray(I);
I=im2double(I);
F=fft2(I);
F=fftshift(F);
F=abs(F);
T=log(F+1);
close;
figure;
subplot(121),imshow(M_reg);
subplot(122),imshow(T,[]);

% [filename, pathname] = uigetfile({'*.jpg'; '*.bmp'; '*.gif'; '*.png' }, 'ѡ��ͼƬ'); %û��ͼ�� 
% if filename == 0 
%     return; 
% end
% data = imread([pathname, filename]); 
% [m, n, z] = size(data); 
% pt = [185, 273]; wSize = [60,60]; 
% des = drawRect(data,pt,wSize,5 ); 
% subplot(1,2,1) 
% imshow(data) 
% subplot(1,2,2) 
% imshow(des) 
% return;