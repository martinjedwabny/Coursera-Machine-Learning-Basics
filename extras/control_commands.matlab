% control_commands

% For
v = zeros(10,1);
for i=1:10,
 v(i) = 2^i;
 end;
v'
ans = 2   4   8  16  32  64  128  256  512  1024

% For each
t = zeros(10,1);
indices = [1:1:10];
for i=indices,
 t(i)=indices(i);
 end;
t'
ans = 1    2    3    4    5    6    7    8    9   10

% While
i = 1;
while i <= 5,
> v(i) = 100;
> i = i+1;
> end;
v'
ans = 100 100 100 100 100  64 128 256 512 1024

% If and break
i = 1;
while true,
 v(i) = 999;
 i = i+1;
 if i == 6,
  break;
 end;
end;
v'
ans = 999  999  999  999  999   64  128  256  512 1024

%If and elseif
v(1) = 2;
if v(1) == 1,
 disp("One");
elseif v(1) == 2;
 disp("Two");
else
 disp("Neither");
end;
"Two"
