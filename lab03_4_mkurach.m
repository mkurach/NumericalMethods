clc 
clear
x = [-1 0 2 5 6];
y = [-5 4 -2 19 58];

[nw n ] = size(x);

X = zeros(3*n-3);

%2n - 2 rownan punkty na koncach przedzialow

for i = 1:1:(n-1)
    X(2*i-1,3*i-2) = (x(i))^2; %i-ty wiersz, w kolumnie x^2
    X(2*i,3*i-2) = (x(i+1))^2; 
    X(2*i-1,3*i-1) = x(i);
    X(2*i,3*i-1) = x(i+1);
    X(2*i-1,3*i) = 1;
    X(2*i,3*i) = 1;
end

%pochodne dla polaczen

for i = 2:1:(n-1)
    X(2*n-3+i, 3*i-5) = 2*x(i);
    X(2*n-3+i, 3*i-4) = 1;
    X(2*n-3+i, 3*i-3) = 0;
    X(2*n-3+i, 3*i-2) = -2*x(i);
    X(2*n-3+i, 3*i-1) = -1;
    X(2*n-3+i, 3*i) = 0;
end

%ostatnie na druga pochodna
X(3*n - 3, 1) = 1;
 
Y = zeros(3*n-3,1);

%uzupelnianie Y
for i = 1:1:(n-1)
    Y(2*i-1,1)=y(i);
    Y(2*i,1) = y(i+1);
end
a = X\Y;

disp("Wspolczynniki splajnow:")
a

x2 = -1:0.01:6;
y2 = (x2).^3-5*(x2).^2+3*x2+4;
plot(x2,y2,'-b')
hold on

for i = 1:(n-1)
    x1 = x(i):0.01:x(i+1);
    y1 = a(3*i-2)*(x1).^2+a(3*i-1)*x1+a(3*i);
    plot(x1,y1)
end
scatter(x,y,'*');

hold off




