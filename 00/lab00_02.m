clc;
clear all;
close all;

silnia(5)

f = @(x) x^2 + 1
f(2)

function sil = silnia(x)
        if (x <= 0)
                sil = 1;
        else
                sil = x * silnia(x - 1);
        end
end

