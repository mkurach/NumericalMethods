
A = [9 8 -2 2 -2;7 -3 -2 7 2; 2 -2 2 -7 6;4 8 -3 3 -1; 2 2 -1 1 4];
A1=A;

B = [21;11;-4;16;9];
B;
A=[A B]
[rzadA kolA] = size(A);
[rzadB kolB] = size(B);

for r = 1:1:rzadA
    A(r,:)=A(r,:)./A(r,r);
    for r1 = 1:1:rzadA
        if r1 == r
           
        else
            A(r1,:)=A(r1,:)-A(r1,r).*A(r,:);
        end
    end
    
    
    
end

A
A1\B
      

        
      