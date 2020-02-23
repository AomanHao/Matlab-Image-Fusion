%% 程序分享 
% 西安邮电大学图像处理团队-郝浩
% 个人博客 www.aomanhao.top
% Github https://github.com/AomanHao
%--------------------------------------

clear
close all
clc

size=512;
block=8;
blockno=size/block;
LENGTH=size*size/64; 
Alpha1=0.02;  Alpha2=0.02;
T1=100; 
I=zeros(size,size); 
D=zeros(size,size); 
BW=zeros(size,size); 
block_dct1=zeros(block,block);


i=imread('watermark64by64.png');
mark=reshape(i,1,LENGTH);
figure;imshow(i);title('水印');
figure;I=imread('lena512512.jpg');   
I0=I;
imshow(I);title('原始图像');


%嵌入水印
k=1;
for m=1:blockno
for n=1:blockno
  x=(m-1)*block+1;   y=(n-1)*block+1;
  block_dct1=I(x:x+block-1,y:y+block-1);
  block_dct1=dct2(block_dct1);
BW_8_8=BW(x:x+block-1,y:y+block-1);
  if m<=1|n<=1
    T=0;
  else
    T=sum(BW_8_8);   T=sum(T);
  end
  if T>T1
    Alpha=Alpha2;
else
    Alpha=Alpha1;
end
block_dct1(1,1)=block_dct1(1,1)*(1+Alpha*mark(k)); 
block_dct1=idct2(block_dct1);
D(x:x+block-1,y:y+block-1)=block_dct1; 
  k=k+1;
end
end

figure;imshow(D,[]);title('嵌入水印后的图像');


%提取水印
k=1;
mark1=[];
for m=1:blockno
for n=1:blockno
  x=(m-1)*block+1;   y=(n-1)*block+1;
  block_dct1=D(x:x+block-1,y:y+block-1);
  block_dct0=I0(x:x+block-1,y:y+block-1);
  block_dct1=dct2(block_dct1);
  block_dct0=dct2(block_dct0);
BW_8_8=BW(x:x+block-1,y:y+block-1);
  if m<=1|n<=1
    T=0;
  else
    T=sum(BW_8_8);   T=sum(T);
  end
  if T>T1
    Alpha=Alpha2;
else
    Alpha=Alpha1;
  end


mark1(k)=(block_dct1(1,1)/block_dct0(1,1)-1)/Alpha;
  k=k+1;
end
end
mark1=reshape(mark1,64,64);
figure
imshow(mark1)
title('提取的水印')

