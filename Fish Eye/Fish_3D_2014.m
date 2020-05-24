function varargout = Fish_3D_2014(varargin)
% FISH_3D_2014 MATLAB code for Fish_3D_2014.fig
%      FISH_3D_2014, by itself, creates a new FISH_3D_2014 or raises the existing
%      singleton*.
%
%      H = FISH_3D_2014 returns the handle to a new FISH_3D_2014 or the handle to
%      the existing singleton*.
%
%      FISH_3D_2014('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FISH_3D_2014.M with the given input arguments.
%
%      FISH_3D_2014('Property','Value',...) creates a new FISH_3D_2014 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Fish_3D_2014_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Fish_3D_2014_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Fish_3D_2014

% Last Modified by GUIDE v2.5 04-Jun-2014 11:21:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Fish_3D_2014_OpeningFcn, ...
                   'gui_OutputFcn',  @Fish_3D_2014_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Fish_3D_2014 is made visible.
function Fish_3D_2014_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Fish_3D_2014 (see VARARGIN)

% Choose default command line output for Fish_3D_2014
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Fish_3D_2014 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Fish_3D_2014_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu3_Pyramid_zero_Callback(hObject, eventdata, handles)
global im;
I0=im;
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

% 显示图像
axes(handles.axes1);
imshow(I1);

% --------------------------------------------------------------------
function menu3_Pyramid_Callback(hObject, eventdata, handles)
global im;
I0=im;
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

%-------------右面校正-------%

for i=1:2*r  
    for j=k1:k1+2*r
%         m=2*r-j;
%         n=r-i;
        m=j-2*r;
        n=i-r;
        u=(r*n)/(sqrt(0.5*m^2+n^2+(2*r^2-2*r*m+0.5*m^2)));
        v=(0.7*r*m)/(sqrt(0.5*m^2+n^2+(2*r^2-2*r*m+0.5*m^2)));
        xft=round(u+r);                        
        yft=round(v+r);
          if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
            I1(i,j,:)=0;
          % 双线性插值，细节优化
          elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)            
              xx= u+u0;
              yy=v+v0;
              a = double(uint16(xx)); 
              b = double(uint16(yy)); 
              x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
              x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
              x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
              x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
              I1(i,j+2*r-k1) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
          else                                                      
              I1(i,j+2*r-k1) = I0(xft,yft);     % else,apply nearest interpolate
          end      
    end  
end

%-------------左面校正-------%
for i=1:2*r  
    for j=2*r-k1:4*r-k1
        m=2*r-j;
        n=i-r;
        u=(r*n)/(sqrt(0.5*m^2+n^2+(2*r^2-2*r*m+0.5*m^2)));
        v=-(0.7*r*m)/(sqrt(0.5*m^2+n^2+(2*r^2-2*r*m+0.5*m^2)));
        xft=round(u+r);                        
        yft=round(v+r);
        if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
            I1(i,j,:)=0;
        elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)
            xx= u+u0;
            yy=v+v0;
            a = double(uint16(xx)); 
            b = double(uint16(yy)); 
            x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
            x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
            x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
            x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
            I1(i,j+k1-2*r+1) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
        else
            I1(i,j+k1-2*r+1) = I0(xft,yft);     % else,apply nearest interpolate        
        end     
    end  
end

%-------------上面校正-------%
for i=k2:k2+2*r
    for j=1:2*r
        m=j-r;
        n=2*r-i;
        u=-(0.7*r*n)/(sqrt(0.5*n^2+m^2+(2*r^2-2*r*n+0.5*n^2)));
        v=(r*m)/(sqrt(0.5*n^2+m^2+(2*r^2-2*r*n+0.5*n^2)));
        xft=round(u+r);                        
        yft=round(v+r);
        if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
            I1(i,j,:)=0;
        elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)
            xx= u+u0;
            yy=v+v0;
            a = double(uint16(xx)); 
            b = double(uint16(yy)); 
            x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
            x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
            x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
            x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
            I1(i+2*r-k2+1,j) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
        else    
            I1(i+2*r-k2+1,j) = I0(xft,yft);     % else,apply nearest interpolate    
        end      
    end  
end

%-------------下面校正-------%
for i=2*r-k2:4*r-k2
    for j=1:2*r
        m=r-j;
        n=i-2*r;
        u=(0.7*r*n)/(sqrt(0.5*n^2+m^2+(2*r^2-2*r*n+0.5*n^2)));
        v=-(r*m)/(sqrt(0.5*n^2+m^2+(2*r^2-2*r*n+0.5*n^2)));
        xft=round(u+r);                        
        yft=round(v+r);
        if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
            I1(i,j,:)=0;
        elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)
            xx= u+u0;
            yy=v+v0;
            a = double(uint16(xx)); 
            b = double(uint16(yy)); 
            x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
            x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
            x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
            x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
            I1(i+k2+1,j+2*r) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
        else               
                I1(i+k2+1,j+2*r) = I0(xft,yft);     % else,apply nearest interpolate        
        end      
    end  
end

% 显示图像
axes(handles.axes1);
imshow(I1);

% --------------------------------------------------------------------
function menu3_Pyramid_simplify_Callback(hObject, eventdata, handles)
global im;
I0=im;
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

% 显示图像
axes(handles.axes1);
imshow(I1);

% --------------------------------------------------------------------
function menu2_Cube_Callback(hObject, eventdata, handles)
global im;
I0=im;
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
%-------------立方体顶面校正-------%
for i=1:2*r  
    for j=1:2*r
        m=i-xc;
        n=j-yc;
        u=(r*m)/(sqrt(m^2+n^2+p1^2));
        v=(r*n)/(sqrt(m^2+n^2+p1^2));
        xft=round(u+u0);                        
        yft=round(v+v0);
        if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
            I1(r+i,r+j,:)=0;
        elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)
            xx= u+u0;
            yy=v+v0;
            a = double(uint16(xx)); 
            b = double(uint16(yy)); 
            x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
            x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
            x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
            x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
            I1(r+i,r+j) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
            else                                                        
            I1(r+i,r+j) = I0(xft,yft);     % else,apply nearest interpolate
        end      
    end  
end
%%-----------立方体左侧面校正------------------%%
for i=1:2*r
    for j=-r+1:0 
        p=j+xc;
        m=i-yc;
        u=(r*m)/(sqrt(m^2+n1^2+p^2));
        v=(r*(-n1))/(sqrt(m^2+n1^2+p^2));
        xft=round(u+u0);                        
        yft=round(v+v0);
        if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
            I1(r+i,r+j)=0;
        elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)
             xx= u+u0;
             yy=v+v0;
             a = double(uint16(xx)); 
             b = double(uint16(yy)); 
              x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
            x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
            x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
            x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
            I1(r+i,j+r) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
            else                                                        
            I1(r+i,j+r) = I0(xft,yft);     % else,apply nearest interpolate
        end     
    end   
end
%%-----------立方体右侧面校正------------------%%
for i=1:2*r  
    for j=1:r
        p=j-xc;
        m=i-yc;
        u=(r*m)/(sqrt(m^2+n1^2+p^2));
        v=(r*(n1))/(sqrt(m^2+n1^2+p^2));
        xft=round(u+u0);                        
        yft=round(v+v0);
        if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
            I1(r+i,3*r+j)=0;
        elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)
             xx= u+u0;
             yy=v+v0;
             a = double(uint16(xx)); 
             b = double(uint16(yy)); 
              x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
            x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
            x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
            x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
            I1(r+i,3*r+j) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
            else                                                        
            I1(r+i,3*r+j) = I0(xft,yft);     % else,apply nearest interpolate
        end      
    end   
end
%%-----------立方体上侧面校正------------------%%
for i=-r+1:0  
    for j=1:2*r
        p=i+xc;
        n=j-yc;
        u=(r*(-m1))/(sqrt(m1^2+n^2+p^2));
        v=(r*(n))/(sqrt(m1^2+n^2+p^2));
        xft=round(u+u0);                        
        yft=round(v+v0);
        if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
            I1(r+i,r+j)=0;
        elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)
             xx= u+u0;
             yy=v+v0;
             a = double(uint16(xx)); 
             b = double(uint16(yy)); 
              x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
            x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
            x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
            x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
            I1(r+i,r+j) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
            else                                                        
            I1(r+i,r+j) = I0(xft,yft);     % else,apply nearest interpolate
        end     
    end   
end
%%-----------立方体下侧面校正------------------%%
for i=1:r  
    for j=1:2*r
        p=i-xc;
        n=j-yc;
        u=(r*(m1))/(sqrt(m1^2+n^2+p^2));
        v=(r*(n))/(sqrt(m1^2+n^2+p^2));
        xft=round(u+u0);                        
        yft=round(v+v0);
        if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
            I1(3*r+i,r+j)=0;
        elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)
             xx= u+u0;
             yy=v+v0;
             a = double(uint16(xx)); 
             b = double(uint16(yy)); 
              x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
            x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
            x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
            x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
            I1(3*r+i,r+j) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
            else                                                        
            I1(3*r+i,r+j) = I0(xft,yft);     % else,apply nearest interpolate
        end      
    end   
end
% 显示图像
axes(handles.axes1);
imshow(I1);

% --------------------------------------------------------------------
function menu2_origin_Callback(hObject, eventdata, handles)
global im;
I0=im;
%I1=extraction_fish(I0);
I2=uint8(rgb2gray(I0));  
[heigh,width]=size(I2);
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
%-------------立方体顶面校正-------%
for i=1:2*r  
    for j=1:2*r
        m=i-xc;
        n=j-yc;
        u=(r*m)/(sqrt(m^2+n^2+p1^2));
        v=(r*n)/(sqrt(m^2+n^2+p1^2));
        xft=round(u+u0);                        
        yft=round(v+v0);
        if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
            I1(i,r+j,:)=0;
        elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)
             xx= u+u0;
             yy=v+v0;
             a = double(uint16(xx)); 
             b = double(uint16(yy)); 
              x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
            x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
            x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
            x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
            I1(i,r+j) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
            else                                                        
            I1(i,r+j) = I0(xft,yft);     % else,apply nearest interpolate
        end     
    end   
end
%%-----------立方体左侧面校正------------------%%
for i=1:r  
    for j=1:2*r
        p=i-xc;
        m=j-yc;
        u=(r*m)/(sqrt(m^2+n1^2+p^2));
        v=(r*(-n1))/(sqrt(m^2+n1^2+p^2));
        xft=round(u+u0);                        
        yft=round(v+v0);
        if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
            I1(2*r+i,j)=0;
        elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)
             xx= u+u0;
             yy=v+v0;
             a = double(uint16(xx)); 
             b = double(uint16(yy)); 
              x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
            x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
            x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
            x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
            I1(2*r+i,j) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
            else                                                        
            I1(2*r+i,j) = I0(xft,yft);     % else,apply nearest interpolate
        end      
    end  
end
%%-----------立方体右侧面校正------------------%%
for i=1:r  
    for j=1:2*r
        p=i-xc;
        m=j-yc;
        u=(r*m)/(sqrt(m^2+n1^2+p^2));
        v=(r*(n1))/(sqrt(m^2+n1^2+p^2));
        xft=round(u+u0);                        
        yft=round(v+v0);
        if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
            I1(3*r+i,j)=0;
        elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)
             xx= u+u0;
             yy=v+v0;
             a = double(uint16(xx)); 
             b = double(uint16(yy)); 
              x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
            x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
            x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
            x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
            I1(3*r+i,j) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
            else                                                        
            I1(3*r+i,j) = I0(xft,yft);     % else,apply nearest interpolate
        end      
    end   
end
%%-----------立方体上侧面校正------------------%%
for i=1:r  
    for j=1:2*r
        p=i-xc;
        n=j-yc;
        u=(r*(m1))/(sqrt(m1^2+n^2+p^2));
        v=(r*(n))/(sqrt(m1^2+n^2+p^2));
        xft=round(u+u0);                        
        yft=round(v+v0);
        if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
            I1(2*r+i,2*r+j)=0;
        elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)
             xx= u+u0;
             yy=v+v0;
             a = double(uint16(xx)); 
             b = double(uint16(yy)); 
              x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
            x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
            x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
            x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
            I1(2*r+i,2*r+j) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
            else                                                        
            I1(2*r+i,2*r+j) = I0(xft,yft);     % else,apply nearest interpolate
        end      
    end   
end
%%-----------立方体下侧面校正------------------%%
for i=1:r  
    for j=1:2*r
        p=i-xc;
        n=j-yc;
        u=(r*(-m1))/(sqrt(m1^2+n^2+p^2));
        v=(r*(n))/(sqrt(m1^2+n^2+p^2));
        xft=round(u+u0);                        
        yft=round(v+v0);
        if (xft<=0)||(xft>oriwidth)||(yft<=0)||(yft>oriheigh)
            I1(3*r+i,2*r+j)=0;
        elseif (xft >0) && (xft <oriwidth) && (yft>0) && (yft <oriheigh)
             xx= u+u0;
             yy=v+v0;
             a = double(uint16(xx)); 
             b = double(uint16(yy)); 
              x11 = double(I0(a,b));                     % x11 <- origImg(a,b)
            x12 = double(I0(a,b+1));                   % x12 <- origImg(a,b+1)
            x21 = double(I0(a+1,b));                   % x21 <- origImg(a+1,b)
            x22 = double(I0(a+1,b+1));                 % x22 <- origImg(a+1,b+1)
            I1(3*r+i,2*r+j) = uint8( (b+1-yy) * ((xx-a)*x21 + (a+1-xx)*x11) + (yy-b) * ((xx-a)*x22 +(a+1-xx) * x12) ); %双线性插值
            else                                                        
            I1(3*r+i,2*r+j) = I0(xft,yft);     % else,apply nearest interpolate
        end     
    end   
end
axes(handles.axes1);
imshow(I1);

% --------------------------------------------------------------------
function menu2_correcttion_Callback(hObject, eventdata, handles)
global im;
I1=im;
[height0,width0]=size(rgb2gray(I1));
height=1*(height0);
width =1*(width0);
I2=zeros(height,width,3);
a1=0;
a2=height;
b1=0;
b2=width;
for i=1:height
    for j=1:width
        if i<=a1 || i>a2 || j<=b1 || j>b2;
            I2(i,j,:)=255;
        else
            I2(i,j,:)=I1(i-a1,j-b1,:);
        end
    end
end
Inew=DistortionRate(I2);
Inew=uint8(Inew);
% 显示图像
axes(handles.axes1);
imshow(Inew);


% --------------------------------------------------------------------
% 打开图片并在新窗口显示
function menu1_open_Callback(hObject, eventdata, handles)
global im;
% 选择图片路径
[filename,pathname,filterindex]=uigetfile({'*.jpg';'*.bmp';'*.gif'},'选择图片');
% 合成路径+文件名
str=[pathname filename];  
im=imread(str); 
% figure('NumberTitle', 'off', 'Name', '原图');%显示图片，figure名为“原图”
% imshow(im);
axes(handles.axes1);
imshow(im);


% --------------------------------------------------------------------
% 保存图片
function menu1_save_Callback(hObject, eventdata, handles)
%保存处理后的图片
[filename,pathname]=uiputfile({'*.jpg';'*.bmp';'*.gif'},'保存图片','Undefined.bmp');
if ~isequal(filename,0)
    str = [pathname filename];
    px=getframe(handles.axes1);
    %saveas(gcf,str,'bmp');
    ta = getappdata(gcf,'Timg');
    imwrite(px.cdata,str,'jpg');
%     关闭GUI
%     close(gcf);
else
    disp('保存失败');
end;
