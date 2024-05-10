%Quadrados Minimos discreto
%Ex1a
x=[1 2 3 4 5 6 7 8];
f=[0.5 0.6 0.9 0.8 1.2 1.5 1.7 2.0];
n=2;
g0=@(x) 0*x+1;
g1=@(x) x;
g=[g1(x);g0(x)];


m=length(x);
%montar o sistema linear
for i=1:n
  for j=1:n
    a(i,j)=0;
    for k=1:m
      a(i,j)=a(i,j)+g(i,k)*g(j,k);
    endfor
  endfor
  b(i,1)=0;
  for k=1:m
    b(i,1)=b(i,1)+g(i,k)*f(k);
  endfor
end

%solucao sistema linear
%triangularizacao
for k=1:n-1
  for i=k+1:n
    m(i,k)=a(i,k)/a(k,k);
    a(i,k)=0;
    for j=k+1:n
      a(i,j)=a(i,j)-m(i,k)*a(k,j);
    end 
    b(i)=b(i)-m(i,k)*b(k);
  end 
end 

%substituicao
for i=n:-1:1
  soma=0;
  for j=i+1:n
    soma=soma+a(i,j)*c(j,1);
  endfor
   c(i,1)=(b(i,1)-soma)/a(i,i);
endfor
c1=c(1,1)
c2=c(2,1)

%combinacao linear
phi=0
for k=1:n
  phi=phi+c(k)*g(k,:);
end 
plot(x,f,'*', x,phi) 

