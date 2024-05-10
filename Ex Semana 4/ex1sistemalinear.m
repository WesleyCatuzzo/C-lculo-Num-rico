a=[1 -1 1 -1; 1 0 0 0; 1 1 1 1; 1 2 4 8];
b=[1; 3; -1; -5];
n=length(b);
%triangularização
for k=1:n-1
  for i=k+1:n
    m(i,k)=a(i,k)/a(k,k);
    a(i,k)=0;
    for j=k+1:n
      a(i,j)=a(i,j)-m(i,k)*a(k,j);
    end % loop j
    b(i)=b(i)-m(i,k)*b(k);
  end % loop i
end % loop k

%Substituição Regressiva
x(n)=b(n)/a(n,n);
for i=n-1:-1:1
soma=b(i);
for k=i+1:n
soma=soma-a(i,k)*x(k);
endfor
x(i)=soma/a(i,i);
endfor
