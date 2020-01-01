%% 程序分享 
% 西安邮电大学图像处理团队-郝浩
% 个人博客 www.aomanhao.top
% Github https://github.com/AomanHao
%--------------------------------------

clear
close all
clc
%% %%%%%%%%%%%%%%%图像%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I=imread('1809i.bmp');
V=imread('1809v.bmp');
V=V(1:254,5:356);I=I(3:256,1:352);

TH=0.1;TL=TH*0.4;
% tic
V1=canny4(V,TL,TH);I1=canny4(I,TL,TH);
% toc
for y=1:254
    for x=1:352
        if (V1(y,x)==255) && (I1(y,x)==255)
            V(y,x)=255;
            I(y,x)=255;
        end
    end
end

F(:,:,1)=I;F(:,:,2)=V;F(:,:,3)=V.*0;

figure;imshow(I);title('红外线');
figure;imshow(V);title('可见光');
figure;imshow(F);title('假彩色融合');imwrite(F,'color.tiff','tiff','Resolution',300);%输出结果，保存为tif图片
