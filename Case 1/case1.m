%case1
clear; clc;

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
p2=subs(s2,x-3.1);
p3=subs(s3,x-10.3);

% returning symbolic polynomials to coefficient polynomials
r1=poly2sym(p1);
r2=poly2sym(p2);
r3=poly2sym(p3);

% graphing piecewise function
t=[0 3.1 10.3 30.1];
vol=[0 30 60 90];
xx1=  0   : .1 :  3.1 ;   v1=polyval(r1,xx1);
xx2=  3.1 : .1 : 10.3 ;   v2=polyval(r2,xx2);
xx3= 10.3 : .1 : 30.1 ;   v3=polyval(r3,xx3);

hold on % does what?

% graph things
plot(t, vel,'o',xx1,v1,xx2,v2,xx3,v3);