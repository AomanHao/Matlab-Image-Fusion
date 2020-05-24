clc;
clear;
I0=imread('00.jpg');
I0=uint8(rgb2gray(I0));  
[heigh,width]=size(I0);
r=floor((min(heigh,width))/2);   %原图像半径
oriwidth=2*r;                    %原图像宽长
oriheigh=2*r;
nwidth=4*r;                      %定义校正后图像大小
nheigh=4*r;
%ewidth1=round(0.707*r);
%ewidth2=round(1.293*r);
%eheigh1=round(0.707*r);
%eheigh2=round(1.293*r);
I1=uint8(zeros(nheigh,nwidth*2));
p1=r;
m1=r;
n1=r;
xc=r;
yc=r;
u0=r;
v0=r;
%-------------右面校正-------%

for i=1:2*r  
    for j=1:4*r
%         m=2*r-j;
%         n=r-i;
        m=j-2*r;
        n=i-r;
        u=(r*n)/(sqrt(0.5*m^2+n^2+(2*r^2-2*r*m+0.5*m^2)));
        v=(0.7*r*m)/(sqrt(0.5*m^2+n^2+(2*r^2-2*r*m+0.5*m^2)));
        xft=round(u+r);                        
        yft=round(v+r);
%           if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
%             I1(i,j,:)=0;
%         elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)
%              xx= u+u0;
%              yy=v+v0;
%              a = double(uint16(xx)); 
%              b = double(uint16(yy)); 
%               x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
%             x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
%             x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
%             x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
%             I1(i,j) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
%             else                                                      
        I1(i,j) = I0(xft,yft);     % else,apply nearest interpolate
%          end      
    end  
end

%-------------左面校正-------%
for i=1:2*r  
    for j=1:4*r
%         m=2*r-j;
%         n=r-i;
        m=2*r-j;
        n=i-r;
        u=(r*n)/(sqrt(0.5*m^2+n^2+(2*r^2-2*r*m+0.5*m^2)));
        v=-(0.7*r*m)/(sqrt(0.5*m^2+n^2+(2*r^2-2*r*m+0.5*m^2)));
        xft=round(u+r);                        
        yft=round(v+r);
%           if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
%             I1(i,j,:)=0;
%         elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)
%              xx= u+u0;
%              yy=v+v0;
%              a = double(uint16(xx)); 
%              b = double(uint16(yy)); 
%               x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
%             x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
%             x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
%             x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
%             I1(i,j) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
%             else                                                      
        I1(i+2*r,j) = I0(xft,yft);     % else,apply nearest interpolate
%          end      
    end  
end

%-------------上面校正-------%
for i=1:4*r  
    for j=1:2*r
%         m=2*r-j;
%         n=r-i;
        m=j-r;
        n=2*r-i;
        u=-(0.7*r*n)/(sqrt(0.5*n^2+m^2+(2*r^2-2*r*n+0.5*n^2)));
        v=(r*m)/(sqrt(0.5*n^2+m^2+(2*r^2-2*r*n+0.5*n^2)));
        xft=round(u+r);                        
        yft=round(v+r);
%           if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
%             I1(i,j,:)=0;
%         elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)
%              xx= u+u0;
%              yy=v+v0;
%              a = double(uint16(xx)); 
%              b = double(uint16(yy)); 
%               x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
%             x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
%             x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
%             x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
%             I1(i,j) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
%             else                                                      
        I1(i,j+4*r) = I0(xft,yft);     % else,apply nearest interpolate
%          end      
    end  
end

%-------------下面校正-------%
for i=1:4*r  
    for j=1:2*r
%         m=2*r-j;
%         n=r-i;
        m=r-j;
        n=i-2*r;
        u=(0.7*r*n)/(sqrt(0.5*n^2+m^2+(2*r^2-2*r*n+0.5*n^2)));
        v=-(r*m)/(sqrt(0.5*n^2+m^2+(2*r^2-2*r*n+0.5*n^2)));
        xft=round(u+r);                        
        yft=round(v+r);
%           if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
%             I1(i,j,:)=0;
%         elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)
%              xx= u+u0;
%              yy=v+v0;
%              a = double(uint16(xx)); 
%              b = double(uint16(yy)); 
%               x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
%             x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
%             x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
%             x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
%             I1(i,j) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
%             else                                                      
        I1(i,j+6*r) = I0(xft,yft);     % else,apply nearest interpolate
%          end      
    end  
end

%figure,imshow(I1);
figure;
subplot(1,2,1),imshow(I0);
subplot(1,2,2),imshow(I1);
