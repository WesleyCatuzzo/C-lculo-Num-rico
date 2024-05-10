n=5; %trocar por n=20, n=50.
%Matriz A
for i=1:n
  for j=1:n
    A(i,j) = 1/(i+j-1);
  endfor
endfor

%Matriz B
for i=1:n
  B(i,1) = 1/i;  
endfor

%Triangularização
for k=1:n-1 
  for i=k+1:n 
    M(i,k)=A(i,k)/A(k,k); 
    A(i,k)=0; 
    for j=k+1:n
      A(i,j)=A(i,j)-M(i,k)*A(k,j); 
    endfor
    B(i)=B(i)-M(i,k)*B(k); 
  endfor
endfor
A
B
%Substituição Regressiva
for i=n:-1:1
  s = 0;
  for j=i+1:n
    s = s + A(i,j)*X(j);
  endfor
  X(i,1)=(B(i)-s)/A(i,i); 
endfor
X