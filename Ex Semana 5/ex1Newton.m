%Interpolação Método de Newton
x=[-1 0 1 2];
y=[1 3 -1 -5];

m=length(x);  %m=n+1
d(:,1)=y'
for k=2:m
for i=1:m-(k-1)
d(i,k)=(d(i+1,k-1)-d(i,k-1))/(x(i+k-1)-x(i))
end
end
%coeficientes do polinomio interpolador na forma de Newton
for k=1:m
c(k)=d(1,k);
end

t=[-1:0.05:2];
p=0;
for k=1:m
  nk=1;
  for i=1:k-1
    nk=nk.*(t-x(i));
  end
  p=p+c(k)*nk;
end  

plot(t,p,x,y,'*')
