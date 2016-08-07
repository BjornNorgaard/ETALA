%2016/08/04
clear; clc;

M=[ 1 -2 5 2 ; 
    0 0 3 0 ; 
    2 -4 -3 5;
    2 0 3 5];

det(M)

clear; clc; 

for n = 1:6
    A=round((n)*randn(n,n));
    B=round((n)*randn(n,n));
    
    if det(A+B) == det(B);
        disp('true!')
        A1=A;
        B1=B;
    else
        disp('not true')
    end
end



