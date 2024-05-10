%Método de Euler
%dados: f(x,y), x_1, y_1, h, n

clear
f=@(x,y) ((1/(1+x.^2))-2*y.^2);
x(1)=0;
y(1)=0;
a=0;
b=5;
%h=(b-a)/n
h=0.1;
n=50;

for i=1:n
  x(i+1)=x(1)+i*h;
  y(i+1)= y(i)+h*f(x(i),y(i));
endfor
sol_exata= (x./(1+x.^2));
plot(x,y,'*',x,sol_exata)