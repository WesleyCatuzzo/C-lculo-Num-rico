%Interpolação Método de Newton
x=[-1 -0.8 -0.6 -0.4 -0.2 0 0.2 0.4 0.6 0.8 1];
y=1./(1+25*x.^2);
t=[-1:0.05:1];
f=1./(1+25*t.^2);
m=length(x);
p=0;

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

for k=1:m
  nk=1;
  for i=1:k-1
    nk=nk.*(t-x(i));
  end
  p=p+c(k)*nk;
end  

plot(x,y,'k',t,f,'b',t,p,'m');