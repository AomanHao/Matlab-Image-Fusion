function Y=canny4(X,TL,TH)

X=gslvbo(X);
X1=im2double(X);
[hig,wid]=size(X1);

X2=zeros(hig,wid);Z2=X2;
X3=X2;X4=X2;X5=X2;

M1=[02,05,02
    -1,00,-1
    -2,-3,-2];
M2=[-1,02,05
    -2,00,02
    -3,-2,-1];
M3=[-2,-1,02
    -3,00,05
    -2,-1,02];
M4=[-3,-2,-1
    -2,00,02
    -1,02,05];
M5=[-2,-3,-2
    -1,00,-1
    02,05,02];
M6=[-1,-2,-3
    02,00,-2
    05,02,-1];
M7=[02,-1,-2
    05,00,-3
    02,-1,-2];
M8=[05,02,-1
    02,00,-2
    -1,-2,-3];

for y=2:hig-1
    for x=2:wid-1
        M0=[X1(y-1,x-1),X1(y-1,x),X1(y-1,x+1)
            X1(y-0,x-1),X1(y-0,x),X1(y-0,x+1)
            X1(y+1,x-1),X1(y+1,x),X1(y+1,x+1)];
        
        div(1)=[1,1,1]*(M1.*M0)*[1;1;1];
        div(2)=[1,1,1]*(M2.*M0)*[1;1;1];
        div(3)=[1,1,1]*(M3.*M0)*[1;1;1];
        div(4)=[1,1,1]*(M4.*M0)*[1;1;1];
        div(5)=[1,1,1]*(M5.*M0)*[1;1;1];
        div(6)=[1,1,1]*(M6.*M0)*[1;1;1];
        div(7)=[1,1,1]*(M7.*M0)*[1;1;1];
        div(8)=[1,1,1]*(M8.*M0)*[1;1;1];
        div=div./9;
        divmax=max(div);
        X2(y,x)=divmax;
        
        if divmax==div(1)
            Z2(y,x)=1;
        elseif divmax==div(2)
            Z2(y,x)=2;
        elseif divmax==div(3)
            Z2(y,x)=3;
        elseif divmax==div(4)
            Z2(y,x)=4;
        elseif divmax==div(5)
            Z2(y,x)=5;
        elseif divmax==div(6)
            Z2(y,x)=6;
        elseif divmax==div(7)
            Z2(y,x)=7;
        else
            Z2(y,x)=8;
        end
        
    end
end

MAX=max(max(X2));
MIN=min(min(X2));
for i=1:hig
    for j=1:wid
        X3(i,j)=(X2(i,j)-MIN)/(MAX-MIN);
    end
end

Z3=Z2;
X33=X3;

for y=hig-1:-1:2
    for x=wid-1:-1:2
        if (Z3(y,x)==1) || (Z3(y,x)==5)
            if (X33(y,x)<X33(y-1,x)) || (X33(y,x)<X33(y+1,x))
                X3(y,x)=0;
            end
        elseif (Z3(y,x)==2) || (Z3(y,x)==6)
            if (X33(y,x)<X33(y+1,x-1)) || (X33(y,x)<X33(y-1,x+1))
                X3(y,x)=0;
            end
        elseif (Z3(y,x)==3) || (Z3(y,x)==7)
            if (X33(y,x)<X33(y,x-1)) || (X33(y,x)<X33(y,x+1))
                X3(y,x)=0;
            end
        elseif (Z3(y,x)==4) || (Z3(y,x)==8)
            if (X33(y,x)<X33(y-1,x-1)) || (X33(y,x)<X33(y+1,x+1))
                X3(y,x)=0;
            end
        end
    end
end

for y=1+2:hig-2
    for x=1+2:wid-2
        if X3(y,x)>TL
            X4(y,x)=1;
        end
        if X3(y,x)>TH
            X5(y,x)=1;
        end
    end
end

%%以下开始生长%%
flag=0;
X6=X5;
while flag==0
    X66=pengzhang(X6);
    X66=X66.*X4;
    X666=X66-X6;
    TEMP=ones(1,hig)*X666*ones(wid,1);
    X6=X66;
    if TEMP==0
        flag=1;
    end
end

Y=im2uint8(X6);
