%Lagrange 
x=[-1 0 1 2];
y=[1 3 -1 -5];
t=[-1:0.01:2];
m=length(x);
f=1;
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

plot(x,y,'*',t,p);