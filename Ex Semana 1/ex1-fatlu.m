%Ax = b -> LUx = b
%Ly = b -> y=?
%Ux = y -> x=?

%Definir Matriz
A = [ 7,2,-5 ; 1,5,-3 ; 2,-1,-9];
B = [-18; -40; -26];
n = size(A,1);

L = zeros(n,n);
U = A;
b = B;

for i = 1:n
%Trocar linhas
  if abs(U(i,i)) < 10^-10
    for j = i+1:n
      if abs(U(j,i)) > 10^-10
        linha = U(i,:);
        U(i,:) = U(j,:);
        U(j,:) = linha;
        auxB = b(i);
        b(i) = b(j);
        b(j) = auxB;
        break
      endif
    endfor
  endif
  
%Eliminações sucessivas
  L(i,i) = 1;
  for j = i+1:n
    if abs(U(j,i)) > 10^-10
      mult = U(j,i)/U(i,i);
      L(j,i) = mult;
      U(j,:) -= mult*U(i,:);
    endif
  endfor
endfor

%Substituições regressivas
%Ly = b
y = zeros(n,1);
for i = 1:n
  y(i) = (b(i)-L(i,1:i-1)*y(1:i-1))/L(i,i);
endfor

%Substituições regressivas
%Ux = y
x = zeros(n,1);
for i = n:-1:1
  x(i) = (y(i)-U(i,i+1:n)*x(i+1:n))/U(i,i);
endfor

x

