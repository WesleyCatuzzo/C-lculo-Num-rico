%Trapezios
f=@(x) 1/sqrt(x);
a=2;
b=14;
m=6;
M2=0.001022683;  %calculado a partir da segunda derivada, substituindo x=14

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


%Exercicio 2: O intervalo de integração deve ser dividido em 122 partes para ter o erro(0.0000098943) menor que 10^-5