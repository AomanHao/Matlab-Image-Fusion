% 解方程园面与直线交点
syms x y z a b c r m n p;
% k=p+n-1.4141592653*r;
% f=a*m+b*n+c*p;
% g=x*x+y*y+z*z-r*r;


g=x*x+y*y+z*z-1;
f=a*m+b*n+c*(1.4141592653*r-n);

[x,y,z]=solve(f,g);
x=simplify(x),
y=simplify(y),
z=simplify(z),

% [x,y]=meshgrid(-10:1:10);
%  R=sqrt(x.^2+y.^2)+eps;
%  Z=sin(R)./R;
%  mesh(x,y,Z,'edgecolor','green');
