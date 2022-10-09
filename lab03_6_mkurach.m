clc
clear all

hc = 40;
P = 0.0157;
k = 240;
Ac = 1.964*10^(-5);
L = 0.5;
T0 = 473;
TL = 293;
Ts = 293;

beta = hc*P/k/Ac;
n = 20;
h=L/n;

A = zeros(n-1);
for i = 1:1:(n-1)
    A(i,i) = -(2+h^2*beta);
    if i == (n-1)
        break;
    else
        A(i,i+1) = 1;
    end
    if i == (n-1)
        break;
    else
        A(i+1,i) = 1;
    end
end
A;

Y = zeros(n-1,1);

for i = 1:1:(n-1)
    if i == 1
        Y(i) = -(h^2*beta*Ts+T0);
    elseif i == n-1
        Y(i) = -(h^2*beta*Ts+TL);
    else
        Y(i) = -(h^2*beta*Ts);
    end
    
end
Y;

%T = A\Y;
%T = [T0 T' TL]
%x = 0:h:L;
%scatter(x,T);

gamma = zeros(1);
beta = zeros(1);


for i = 1:n-1
    if i == 1
        gamma(i+1) = -A(i,i+1)/A(i,i);
        beta(i+1) = Y(i)/A(i,i);
    elseif i == n-1
        gamma(i+1) = 0;
        beta(i+1) = (Y(i)-A(i,i-1)*beta(i))/(A(i,i-1)*gamma(i) + A(i,i));
    else
        gamma(i+1) = -A(i,i+1)/(A(i,i-1)*gamma(i)+A(i,i));
        beta(i+1) = (Y(i)-A(i,i-1)*beta(i))/(A(i,i-1)*gamma(i) + A(i,i));
    end
    
    
end

gamma;
beta;
y = zeros(n,1);

for i = n:-1:2
    y(i-1) = gamma(i)*y(i)+beta(i);
end
y;
    
y(n) = TL;
y = [T0 y'];
x = 0:h:L;
scatter(x,y);





