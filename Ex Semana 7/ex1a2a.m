clc
%Simpson
%Ex 1a 
f=@(x) sqrt(x);
a=1;
b=4;
m=6; %par
M4=15/(16*b^(7/2)); %calculado a derivada quarta de raiz de x

h=(b-a)/m;
for i=1:m+1
  x(i)=a+(i-1)*h;
endfor


I_sr=0;
for i=1:m/2
  I_sr=I_sr+f(x(2*i-1))+4*f(x(2*i))+f(x(2*i+1));
endfor
I_sr=I_sr*h/3
E_sr=(b-a)*M4*h^4/180


%Ex 2a
h= ((180*0.00005)/((b-a)*M4))^(1/4);
m2= (b-a)/h
% O resultado é 3.7500 (erro menor que 5*10^-5), mas como precimamos que o numero seja par e inteiro, o intervalo deve ser divido em pelo menos 4 partes


