[filename, pathname] = uigetfile('*.jpg', '读取图片文件'); %选择图片文件
if isequal(filename,0)   %判断是否选择
   msgbox('没有选择任何图片');
else
   pathfile=fullfile(pathname, filename);  %获得图片路径
   M=imread(pathfile);     %将图片读入矩阵
%   image(I);    %绘制图片
end
imshow(M);

[m, n, z] = size(M); 
[x,y] = ginput(2);    %确定图像上的两点利用ginput函数，返回值是两点的坐标
pt = [x(1),y(1)]; wSize = [abs(x(1)-x(2)),abs(y(1)-y(2))]; 
M_reg = drawRect(M,pt,wSize,4,[255 0 0]);
I = imcrop(M,[x(1),y(1),abs(x(1)-x(2)),abs(y(1)-y(2))]);
%利用imcrop函数对图像进行切割，输入参数是一个定点坐标，
%从该定点出发向右abs(x(1)-x(2))，向下abs(y(1)-y(2))的区域进行切割
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

% [filename, pathname] = uigetfile({'*.jpg'; '*.bmp'; '*.gif'; '*.png' }, '选择图片'); %没有图像 
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