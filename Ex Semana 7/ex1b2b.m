clc
%Simpson
%Ex 1b
f=@(x) exp(x^2);
a=0;
b=1;
m=6; %par
M4=4*(exp(b^2))*(4*(b^4)+12*(b^2)+3); %calculado a derivada quarta de raiz de x

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


%Ex 2b
h= ((180*0.00005)/((b-a)*M4))^(1/4);
m2= (b-a)/h
% O resultado é 12.309(erro menor que 5*10^-5), mas como precimamos que o numero seja par e inteiro, o intervalo deve ser divido em pelo menos 14 partes
