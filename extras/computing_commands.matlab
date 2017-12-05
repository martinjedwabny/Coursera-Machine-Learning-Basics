% computing_commands

>> A = [1 2; 3 4; 5 6]
>> B = [11 12; 13 14; 15 16]

>> A .* B
ans = [11 24; 39 56; 75 96]

>> A .^ 2
ans = [1 4; 9 16; 25 36]

>> 1 ./ A
ans = [1.00000   0.50000; 0.33333   0.25000; 0.20000   0.16667]

% Operaciones elemento a elemento:
% exp,log,abs,floor

>> A'
ans = [1 3 5; 2 4 6]

>> max(A); % para cada col el maximo
>> [val,ind] = max(A); % el maximo y su indice en la col

% find(A >= 7), [r,c] = find(A >= 7)
>> [r,c] = find(A >= 3)
r = [2; 3; 2; 3]
c = [1; 1; 2; 2]

% Operaciones por columna:
% sum, prod

