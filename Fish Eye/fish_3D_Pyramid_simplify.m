% 金字塔锥形视角
% 无双线性插值优化
% 坐标变换简化
clc;
clear;
I0=imread('a00.jpg');
I0=uint8(rgb2gray(I0));  
[heigh,width]=size(I0);
r=floor((min(heigh,width))/2);   %原图像半径
oriwidth=2*r;                    %原图像宽长
oriheigh=2*r;
nwidth=4*r;                      %定义校正后图像大小
nheigh=4*r;
I1=uint8(zeros(nheigh,nwidth));
p1=r;
m1=r;
n1=r;
xc=r;
yc=r;
u0=r;
v0=r;

% 画面截取调整参数k1(左右)，k2（上下）
k1=round(1.65*r);
k2=round(0.4*r);

%-------------左面校正-------%
for i=1:2*r  
    for j=1:2*r
        m=round(1.65*r-j);
        n=i-r;
        u=(r*n)/(sqrt(0.5*m^2+n^2+(2*r^2-2*r*m+0.5*m^2)));
        v=-(0.7*r*m)/(sqrt(0.5*m^2+n^2+(2*r^2-2*r*m+0.5*m^2)));
        xft=round(u+r);                        
        yft=round(v+r);
%         if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
%             I1(i,j,:)=0;
%         elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)
%             xx= u+u0;
%             yy=v+v0;
%             a = double(uint16(xx)); 
%             b = double(uint16(yy)); 
%             x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
%             x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
%             x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
%             x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
%             I1(i,j+k1-2*r+1) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
%         else
            I1(i,j) = I0(xft,yft);     % else,apply nearest interpolate        
%         end     
    end  
end

%-------------右面校正-------%

for i=1:2*r   
    for j=2*r:4*r
        m=round(j-2.35*r);
        n=i-r;
        u=(r*n)/(sqrt(0.5*m^2+n^2+(2*r^2-2*r*m+0.5*m^2)));
        v=(0.7*r*m)/(sqrt(0.5*m^2+n^2+(2*r^2-2*r*m+0.5*m^2)));
        xft=round(u+r);                        
        yft=round(v+r);
%           if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
%             I1(i,j,:)=0;
%           % 双线性插值，细节优化
%           elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)            
%               xx= u+u0;
%               yy=v+v0;
%               a = double(uint16(xx)); 
%               b = double(uint16(yy)); 
%               x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
%               x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
%               x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
%               x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
%               I1(i,j+2*r-k1) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
%           else                                                      
              I1(i,j) = I0(xft,yft);     % else,apply nearest interpolate
%           end      
    end  
end



%-------------上面校正-------%
for i=2*r:4*r
    for j=1:2*r
        m=j-r;
        n=round(3.6*r-i);
        u=-(0.7*r*n)/(sqrt(0.5*n^2+m^2+(2*r^2-2*r*n+0.5*n^2)));
        v=(r*m)/(sqrt(0.5*n^2+m^2+(2*r^2-2*r*n+0.5*n^2)));
        xft=round(u+r);                        
        yft=round(v+r);
%         if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
%             I1(i,j,:)=0;
%         elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)
%             xx= u+u0;
%             yy=v+v0;
%             a = double(uint16(xx)); 
%             b = double(uint16(yy)); 
%             x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
%             x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
%             x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
%             x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
%             I1(i+2*r-k2+1,j) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
%         else    
            I1(i,j) = I0(xft,yft);     % else,apply nearest interpolate    
%         end      
    end  
end

%-------------下面校正-------%
for i=2*r:4*r
    for j=2*r:4*r
        m=3*r-j;
        n=round(i-2.4*r);
        u=(0.7*r*n)/(sqrt(0.5*n^2+m^2+(2*r^2-2*r*n+0.5*n^2)));
        v=-(r*m)/(sqrt(0.5*n^2+m^2+(2*r^2-2*r*n+0.5*n^2)));
        xft=round(u+r);                        
        yft=round(v+r);
%         if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
%             I1(i,j,:)=0;
%         elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)
%             xx= u+u0;
%             yy=v+v0;
%             a = double(uint16(xx)); 
%             b = double(uint16(yy)); 
%             x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
%             x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
%             x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
%             x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
%             I1(i+k2+1,j+2*r) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
%         else               
                I1(i,j) = I0(xft,yft);     % else,apply nearest interpolate        
%         end      
    end  
end

%figure,imshow(I1);
figure;
subplot(1,2,1),imshow(I0);
subplot(1,2,2),imshow(I1);
