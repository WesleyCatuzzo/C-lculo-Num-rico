%Método de Jacobi
clear 
a=[7,2,-5;1,5,-3;2,-1,-9];
b=[-18;-40;-26];
n = 3;
tol = 0.0005;
x(:,1) = [0;0;0];
itmax = 50;

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