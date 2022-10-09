clc;
clear all;
close all;

a = 1:1:5
f = @(x) 1./exp(-(15-a)./2);
f(a)