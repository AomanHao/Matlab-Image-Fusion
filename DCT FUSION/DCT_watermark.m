clear;clc

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
figure;imshow(i);title('ˮӡ');
%subplot(3,2,1);plot(mark);title('ˮӡ'); 
%��ʾԭͼ
figure;I=imread('lena512512.jpg');   
I0=I;
imshow(I);title('ԭʼͼ��');

% BW=edge(I,'canny');figure;;imshow(BW);
% title('edge of origine image');
%Ƕ��ˮӡ
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

figure;imshow(D,[]);title('Ƕ��ˮӡ���ͼ��');


%��ȡˮӡ
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
title('��ȡ��ˮӡ')
msgbox('MATLAB��̴��ɣ����QQ: 993878382','MATLAB����','help')
web http://993878382.qzone.qq.com -browser
