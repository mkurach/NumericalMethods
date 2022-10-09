clc 
clear all 
close all 

eps = 1./10.^(3:1:20);
f = @(x) x.^3-2*x.^2+2;

kroki = [];

for i = 1:length(eps)
    k = 0;
    b = 1;
    a = -2;
    x0 = a + (b-a)./2;
    while (abs(f(x0)) > eps(i))
        x0 = a + (b-a)./2;
        if (f(x0)*f(a) > 0)
            a = x0;
            k = k+1;
        elseif (f(x0)*f(b) > 0)
            b = x0;
            k = k+1;
        end
    end
    kroki(i)=k;
end

disp(kroki);

 k = @(a, b, e) log2((b-a)./e);
 b = 1;
 a= -2;
 kteo =k(a, b, eps);

 semilogx( eps,kroki, "*",  eps, kteo, "r")
