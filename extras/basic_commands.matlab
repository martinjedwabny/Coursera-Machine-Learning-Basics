% basic_commands

load featuresX.dat
load priceY.dat

size(priceY) % == [47 2]
length(priceY) % == 47

who % ver variables
whos % idem con detalle

clear featuresX % eliminar variable
clear % eliminar todas las variables

priceY(1:10) % agarrar primeras 10 columnas

save hello.mat v % guardar variable v en archivo
save hello.txt v -ascii % guardar como txt

A = [1 2; 3 4; 5 6] % matriz de 3 x 2
A(3,2) % acceder index fila 3 col 2
% ans = 6
A(3, :)
% ans = [5 6]
A(:, 2)
% ans = [2; 4; 6]
A([1 3], :) % filas 1 y 3, todas las cols
% ans = [1 2; 5 6]
A(:, 2) = [10; 11; 12]
% A = [1, 10; 3 11; 5 12]
A = [A, [100; 101; 102]]
% A = [1 10 100; 3 11 101; 5 12 102]
A(:) % convertir a vector
% ans = [1 3 5 10 ... 102]
C = [A B] % append lateral
C = [A; B] % append vertical


