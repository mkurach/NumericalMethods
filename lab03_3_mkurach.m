clc
clear
A = [6 5 -5; 2 6 -2;2 5 -1];
%A = [1 2 -1; 1 4 5 ; 1 4 1];
A0 = A;
[N N] = size(A);

Q=1;
for k = 1:1:(N-1)
    ai = A(:,k);
    ai(1:(k-1)) = 0; % wyzerowanie wiersz przed itym wierszem, mam ai
    ei = [0; 0 ;0];
    ei(k) = 1; % mam ei
    v = ai + norm(ai)*ei;
    vtv = transpose(v)*v;
    vvt = v*transpose(v);
    H = eye(3)- 2/vtv*vvt;
    A = H*A;
    Q = Q*H;
end

[Qspr Rspr]=qr(A0);
disp("R z kodu: ")
R=A
disp("R testowa z funckji qr(A): ")
Rspr
disp("Q z kodu: ")
Q
disp("Q testowa z funckji qr(a): ")
Qspr

    