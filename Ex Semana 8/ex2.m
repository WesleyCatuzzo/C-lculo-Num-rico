%quadrados minimos continuo
a=-pi;
b=pi;
m=100;
h=(b-a)/m;
for i=1:m+1
  x(i)=a+(i-1)*h;
endfor 

f=@(x) sin(x);
n=4;

g0=@(x) 0*sin(1*x)+1;
g1=@(x) sin(2*x);
g2=@(x) sin(3*x);
g3=@(x) sin(4*x);
g=[g3(x);g2(x);g1(x);g0(x)];

%montar sistema linear
for i=1:n
  for j=1:n
    a(i,j)=0;
    for k=1:m %regra dos trapezios
      a(i,j)=a(i,j)+g(i,k)*g(j,k)+g(i,k+1)*g(j,k+1);
    endfor
    a(i,j)=a(i,j)*h/2;
  endfor
  b(i,1)=0;
  for k=1:m %regra dos trapezios
    b(i,1)=b(i,1)+g(i,k)*f(k)+g(i,k+1)*f(k+1);
  endfor
  b(i)=b(i)*h/2;
end

%triangularizacao 

for k=1:n-1
  for i=k+1:n
    p(i,k)=a(i,k)/a(k,k);
    a(i,k)=0;
    for j=k+1:n
      a(i,j)=a(i,j)-m(i,k)*a(k,j);
    end 
    b(i)=b(i)-m(i,k)*b(k);
  end 
end 

%substituicao
c(n)=b(n)/a(n,n)
for i=n:-1:1
  soma=0;
  for k=i+1:n
    soma=soma+a(i,k)*c(k,1);
  endfor
   c(i,1)=(b(i,1)-soma)/a(i,i);
endfor
c1=c(1,1)
c2=c(2,1)
c3=c(3,1)
c4=c(4,1)

%combinacao linear
phi=0
for k=1:n
  phi=phi+c(k)*g(k,:);
end 
plot(x,f,'*', x,phi) 