clear
h=0.1;
n=5;  %n=10,n=30
t=1:n;
x(t,1)=[0]
tol=0.0005;
itmax=100;

for i=1;
  a(i,i)=-2*(1+h^2);
  a(i,i+1)=1;
  a(i,i+2:n)=0;
  for j=1;
    b(i,:)=1;
  endfor
end
for i=2:n-1;
  a(i,i-1)=1;
  a(i,i)=-2*(1+h^2);
  a(i,i+1)=1;
  a(i,i+2:n)=0;
  for j=2:n-1;
    b(i,:) = 0;
  endfor
end
for i=n;
  a(i,1:1-2)=0;
  a(i,i-1)=1;
  a(i,i)=-2*(1+h^2);
  for j=n;
    b(i,:)=1;
  endfor
end
a
b

%Jacobi
for k=1:itmax 
  for i=1:n 
    soma=b(i); 
    for j=1:i-1 
      soma=soma-a(i,j)*x(j,k); 
    end 
      for j=i+1:n 
      soma=soma-a(i,j)*x(j,k); 
    end 
    x(i,k+1)=soma/a(i,i); 
  end 
  d=max(abs(x(:,k+1)-x(:,k))); 
  if d < tol 
    break 
  endif 
end
x
k