%Trapezios
f=@(x) sqrt(x);
a=1;
b=4;
m=6;
M2=1/32; %calculado a partir da segunda derivada, substituindo x=4

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


%Exercicio 2: O intervalo de integração deve ser dividido em 84 partes para ter o erro(0.0000099649) menor que 10^-5