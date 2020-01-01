function jiacaise1

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

figure(1);imshow(I);title('红外线');
figure(2);imshow(V);title('可见光');
figure(3);imshow(F);title('假彩色融合');