%Fatoração de Cholesky
%Matriz Simétrica
a=[16 -4 12 -4; -4 2 -1 1; 12 -1 14 -2; -4 1 -2 83];
n=length(a);

for k=1:n
g(k,k)=a(k,k);
for j=1:k-1
g(k,k)=g(k,k)-g(k,j)^2;
end
g(k,k)=sqrt(g(k,k));
for i=k+1:n
g(i,k)=a(i,k);
for j=1:k-1
g(i,k)=g(i,k)-g(i,j)*g(k,j);
end
g(i,k)=g(i,k)/g(k,k);
end
end
