clc 
clear

f1 = @(x,y,z) 10*(y-x);
f2 = @(x,y,z) x*(28-z)-y;
f3 = @(x,y,z) x*y-8*z/3;

X = [ 1; 1; 1];
a = 0;
b = 20;

h = 100/50000;

x = [];
y = [];
z = [];

k1 = zeros(3,1);
k2 = zeros(3,1);
k3 = zeros(3,1);
k4 = zeros(3,1);
iterator = 1;

for i = 0:h:100
   k1 = [K1(f1, X(1), X(2), X(3) ); K1(f2,X(1),X(2),X(3)); K1(f3,X(1),X(2),X(3))];
   
   k2 = [K2(k1(1),f1,X(1),X(2),X(3),h); K2(k1(2),f2,X(1),X(2),X(3),h); K2(k1(3),f3,X(1),X(2),X(3),h)];
   
   k3 = [K3(k2(1),f1,X(1),X(2),X(3),h); K3(k2(2),f2,X(1),X(2),X(3),h); K3(k2(3),f3,X(1),X(2),X(3),h)];
   
   k4 = [K4(k3(1),f1,X(1),X(2),X(3),h); K4(k3(2),f2,X(1),X(2),X(3),h); K4(k3(3),f3,X(1),X(2),X(3),h)];
   
   X = [X(1)+(k1(1)+2*k2(1)+2*k3(1)+k4(1))*h/6; X(2)+(k1(2)+2*k2(2)+2*k3(2)+k4(2))*h/6; X(3)+(k1(3)+2*k2(3)+2*k3(3)+k4(3))*h/6];
   
   iterator = iterator+1;
   
   x(iterator) = X(1);
   y(iterator) = X(2);
   z(iterator) = X(3);
    
end


plot3(x,y,z)





function  res = K1(f,x,y,z)
    res = f(x,y,z);
end

function res = K2(K,f,x,y,z,h)
    res = f(x+K/2*h,y+K*h/2,z+K*h/2);
end

function res = K3(K,f,x,y,z,h)
    res = f(x+K/2*h,y+K*h/2,z+K*h/2);
end

function res = K4(K,f,x,y,z,h)
    res = f(x+K*h,y+K*h,z+K*h);
end