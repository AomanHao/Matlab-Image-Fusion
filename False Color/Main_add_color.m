%% ������� 
% �����ʵ��ѧͼ�����Ŷ�-�º�
% ���˲��� www.aomanhao.top
% Github https://github.com/AomanHao
%--------------------------------------

clear
close all
clc
%% %%%%%%%%%%%%%%%ͼ��%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

figure;imshow(I);title('������');
figure;imshow(V);title('�ɼ���');
figure;imshow(F);title('�ٲ�ɫ�ں�');imwrite(F,'color.tiff','tiff','Resolution',300);%������������ΪtifͼƬ
