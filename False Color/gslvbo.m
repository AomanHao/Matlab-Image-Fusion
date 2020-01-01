function Y=gslvbo(X)

X1=im2double(X);
[hig,wid]=size(X1);

g=[0.0018;0.0215;0.0965;0.1592;0.0965;0.0215;0.0018];
G=g./(ones(size(g'))*g);
G=G*G';

X2=X1;

for y=4:hig-3
	for x=4:wid-3
        temp=[X1(y-3,x-3),X1(y-3,x-2),X1(y-3,x-1),X1(y-3,x),X1(y-3,x+1),X1(y-3,x+2),X1(y-3,x+3)
            X1(y-2,x-3),X1(y-2,x-2),X1(y-2,x-1),X1(y-2,x),X1(y-2,x+1),X1(y-2,x+2),X1(y-2,x+3)
            X1(y-1,x-3),X1(y-1,x-2),X1(y-1,x-1),X1(y-1,x),X1(y-1,x+1),X1(y-1,x+2),X1(y-1,x+3)
            X1(y,x-3),X1(y,x-2),X1(y,x-1),X1(y,x),X1(y,x+1),X1(y,x+2),X1(y,x+3)
            X1(y+1,x-3),X1(y+1,x-2),X1(y+1,x-1),X1(y+1,x),X1(y+1,x+1),X1(y+1,x+2),X1(y+1,x+3)
            X1(y+2,x-3),X1(y+2,x-2),X1(y+2,x-1),X1(y+2,x),X1(y+2,x+1),X1(y+2,x+2),X1(y+2,x+3)
            X1(y+3,x-3),X1(y+3,x-2),X1(y+3,x-1),X1(y+3,x),X1(y+3,x+1),X1(y+3,x+2),X1(y+3,x+3)];
        X2(y,x)=(ones(size(g')))*(G.*temp)*(ones(size(g)));
	end
end

Y=im2uint8(X2);
