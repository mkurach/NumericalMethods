clc;
clear all;
close all;

x = 0: 0.05 : (2 * pi);
y = sin(x);
z = (1 - 2 * rand(1, length(x))) / 5;
%plot(x, y+z, "*", x, y, "r")

Y = magic(4)
figure
%plot(Y)

a = repmat([1 2 3], 1, 4)
a > 1