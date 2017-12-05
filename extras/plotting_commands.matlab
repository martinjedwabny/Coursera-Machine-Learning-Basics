% plotting_commands

x = [0:0.01:1]
% x = [1 2 3 4 5 6 7 8 9 10]

y1 = sin(2*pi*4*t)
y2 = cos(2*pi*4*t)
% y1,y2 valores de funcion sobre x

% Fix plot
setenv("GNUTERM","qt")

% Plot ejemplo
plot(t, y1);
hold on;
plot(t, y2, 'r');
xlabel('time');
ylabel('value');
legend('sin', 'cos');
title('my plot');
print -dpng 'myPlot.png';

% Plots por separado
figure(1); plot(t, y1);
figure(2); plot(t, y2);

% Plots divididos
subplot(1, 2, 1); plot(t, y1); % 1x2 acceder 1
subplot(1, 2, 2); plot(t, y1); % 1x2 acceder 2

% Plot valor de matriz segun tonos de gris
A = magic(5);
imagesc(A), colorbar, colormap gray;

