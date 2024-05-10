%Denfinir a Matriz
Ab0 = [7  2  -5 , -18;
       1  5  -3 , -40;
       2  -1 -9 , -26];
        
    
Ab=Ab0;
n = size(Ab,1);
m = size(Ab,2);

for i = 1:n
%Trocar linhas
  if abs(Ab(i,i)) < 10^-10
    for j = i+1:n
      if abs(Ab(j,i)) > 10^-10
        linha = Ab(i,:);
        Ab(i,:) = Ab(j,:);
        Ab(j,:) = linha;
        break
      endif
    endfor
  endif
  
%Eliminações sucessivas
  for j = i+1:n
    if abs(Ab(j,i)) > 10^-10
      Ab(j,:) *= Ab(i,i)/Ab(j,i);
      Ab(j,:) -= Ab(i,:);
    endif
  endfor
endfor

%Substituições regressivas
x = zeros(n,1);
for i = n:-1:1
  x(i) = (Ab(i,m)-Ab(i,i+1:n)*x(i+1:n))/Ab(i,i);
endfor
x