
clc;
clear;
close all; 
 
%%%%%%%%%%%%%%%% 
%%%  Imread  %%% 
%%%%%%%%%%%%%%%% 
I0=imread('3096.jpg'); 
I=rgb2gray(I0); 
imshow(I,[]);title('Original Image'); 
I=double(I); 
[height width]=size(I); 
hheight=  fix(height/2);hwidth= fix(width/2); 
dI1=zeros(hheight,hwidth);dI2=zeros(hheight,hwidth); 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%  Down Sample by a Factor 2  %%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
for k=1:hheight 
    for kk=1:hwidth 
        dI1(k,kk)=I(2*k-1,2*kk-1); %Down:without using the averaging filter 
        dI2(k,kk)=mean(mean(I(k*2-1:k*2,kk*2-1:kk*2))); %Down:with using the averaging filter 
    end 
end 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%  Up Sample by a Factor 2  %%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
uI1=zeros(height,width); 
uI2=zeros(height,width); 
uI3=zeros(height,width); 
uI4=zeros(height,width); 
%1.Up:pixel replication & Down:without using the averaging filter 
%2.Up:pixel replication & Down:with using the averaging filter 
for k=1:hheight 
    for kk=1:hwidth 
        uI1(2*k-1:2*k,2*kk-1:2*kk)=dI1(k,kk);  
        uI2(2*k-1:2*k,2*kk-1:2*kk)=dI2(k,kk);  
    end 
end 
figure;imshow(uI1,[]);title('像素复制 不使用平均滤波器'); 
figure;imshow(uI2,[]);title('像素复制 使用平均滤波器'); 
%3.Up:bilinear interpolation & Down:without using the averaging filter 
for k=1:hheight-1 
    for kk=1:1:hwidth-1 
        uI3(2*k-1,2*kk-1)=dI1(k,kk); 
        uI3(2*k-1,2*kk)=(dI1(k,kk)+dI1(k,kk+1))/2; 
        uI3(2*k,2*kk-1)=(dI1(k,kk)+dI1(k+1,kk))/2; 
        uI3(2*k,2*kk)=(dI1(k,kk)+dI1(k,kk+1)+dI1(k+1,kk)+dI1(k+1,kk+1))/4; 
    end 
end 
figure;imshow(uI3,[]);title('双线性插值 不使用平均滤波器'); 
%4.Up:bilinear interpolation & Down:with using the averaging filter 
for k=1:hheight-1 
    for kk=1:1:hwidth-1 
        uI4(2*k-1,2*kk-1)=dI2(k,kk); 
        uI4(2*k-1,2*kk)=(dI2(k,kk)+dI2(k,kk+1))/2; 
        uI4(2*k,2*kk-1)=(dI2(k,kk)+dI2(k+1,kk))/2; 
        uI4(2*k,2*kk)=(dI2(k,kk)+dI2(k,kk+1)+dI2(k+1,kk)+dI2(k+1,kk+1))/4; 
    end 
end 
figure;imshow(uI4,[]);title('双线性插值 使用平均滤波器'); 