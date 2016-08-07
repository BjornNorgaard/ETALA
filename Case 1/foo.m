function [to50, to90] = foo(a,b,c)
% data now in "solution"/workspace
splinedat; clc;

B=rref(A);

% gather the coefficients for the piecewise functions
s1=B([1 2 3 4], 13); 
s2=B([5 6 7 8], 13);
s3=B([9 10 11 12], 13);

%& convert functions to symbolic polynomials using symbolic toolbox
s1=poly2sym(s1);
s2=poly2sym(s2);
s3=poly2sym(s3);

% translating polynomials
syms x;
p1=s1;
p2=subs(s2,x-a);
p3=subs(s3,x-b);

% returning symbolic polynomials to coefficient polynomials
r1=sym2poly(p1);
r2=sym2poly(p2);
r3=sym2poly(p3);

% graphing piecewise function
t=[0 a b c];
vel=[0 30 60 90];
xx1=  0 : .1 : a ;   v1=polyval(r1,xx1);
xx2=  a : .1 : b ;   v2=polyval(r2,xx2);
xx3=  b : .1 : c ;   v3=polyval(r3,xx3);

%hold on % does what?

% graph things
plot(t, vel,'o',xx1,v1,xx2,v2,xx3,v3)

% 1. How long will it take the CR-V to accelerate to 50 mph?
%disp('Time to 50:');
to50 = double(solve(p2-50));

% 2. How must distance will it take for the CR-V to accelerate to 90mph?
f=int(p1/3600,0,a)+int(p2/3600,a,b)+int(p3/3600,b,c);
to90=double(f);
%disp(['Distance to 90 mph: ' num2str(to90)]);

end
