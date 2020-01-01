function Y=pengzhang(X)

%X1=im2double(X);
X1=X;
[hig,wid]=size(X1);

X2=X1;

for y=1:hig
	for x=1:wid
        if X1(y,x)==1
            for i=-1:1
                for j=-1:1
                    yy=y+i;
                    xx=x+j;
                    if (yy>=1) && (yy<=hig) && (xx>=1) && (yy<=wid)
                        X2(yy,xx)=1;
                    end
                end
            end
        end
        
	end
end

%Y=im2uint8(X2);
Y=X2;
