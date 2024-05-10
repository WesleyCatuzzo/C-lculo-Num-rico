%Trapezios
f=@(x) exp(sin(x));
a=0;
b=pi;
m=72;
M2=1;

h=(b-a)/m;
for i=1:m+1
  x(i)=a+(i-1)*h;
endfor

I_tr=0;
for i=1:m
  I_tr=I_tr+f(x(i))+f(x(i+1));
endfor
I_tr=I_tr*h/2
E_tr=(b-a)*M2*h^2/12


