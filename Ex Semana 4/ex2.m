%Lagrange 
x=[-1 -0.8 -0.6 -0.4 -0.2 0 0.2 0.4 0.6 0.8 1];
y=1./(1+25*x.^2);
t=[-1:0.05:1];
f=1./(1+25*t.^2);
m=length(x);
p=0;

for k=1:m
  lk=1;
  for i=1:k-1
    lk=lk.*(t-x(i))/(x(k)-x(i));  
  end
  for i=k+1:m
    lk=lk.*(t-x(i))/(x(k)-x(i));
  end  
  p=p+y(k)*lk;
end

plot(x,y,'k',t,f,'b',t,p,'m');