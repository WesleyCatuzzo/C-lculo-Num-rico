%Fatoracao LU
%Declaração da matriz
a=[1 5 -3; 2 -1 -9; 7 2 -5];
b=[-40; -26; -18];
n=length(b);

%Pivotamento
for k=1:n-1 
mabs=abs(a(k,k));
q=k;
for i=k+1:n
if abs(a(i,k))>mabs
mabs=abs(a(i,k));
q=i;
endif
end

% > Valor Absoluto
if q!=k
auxa=a(k,:);
a(k,:)=a(q,:);
a(q,:)=auxa;
auxb=b(k);
b(k)=b(q);
b(q)=auxb;
endif 

%Eliminação
for i=k+1:n
m(i,k)=a(i,k)/a(k,k);
a(i,k)=0;
for j=k+1:n
a(i,j)=a(i,j)-m(i,k)*a(k,j);
end 
b(i)=b(i)-m(i,k)*b(k);
end 
end 
%Fim triangularização

%Substituição Regressivas
x(n)=b(n)/a(n,n);
for i=n-1:-1:1
soma=b(i);
for k=i+1:n
soma=soma-a(i,k)*x(k);
endfor
x(i)=soma/a(i,i);
endfor

%LU
u=a;
l=eye(n);
for i=2:n
for j=1:i-1
l(i,j)=m(i,j);
end
end




