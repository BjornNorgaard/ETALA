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
r1=sym2poly(p1);
r2=sym2poly(p2);
r3=sym2poly(p3);

% graphing piecewise function
t=[0 3.1 10.3 30.1];
vel=[0 30 60 90];
xx1=  0   : .1 :  3.1 ;   v1=polyval(r1,xx1);
xx2=  3.1 : .1 : 10.3 ;   v2=polyval(r2,xx2);
xx3= 10.3 : .1 : 30.1 ;   v3=polyval(r3,xx3);

%hold on % does what?

% graph things
plot(t, vel,'o',xx1,v1,xx2,v2,xx3,v3);

% 1. How long will it take the CR-V to accelerate to 50 mph?
double(solve(p2-50))

% 2. How must distance will it take for the CR-V to accelerate to 90mph?
f=int(p1/3600,0,3.1)+int(p2/3600,3.1,10.3)+int(p3/3600,10.3,30.1);
double(f)

% Using cubic splines, answer the above two questions for two of the 
% sport utility vehicles in the Table below. Choose which two vehicles 
% you want to study, and construct a cubic spline function for each
% vehicle. Write the coefficients to three significant figures as in
% the example above.
clear; clc;

% Honda CR-VEX
[accelerationTime50_Honda, distBefore90_Honda] = foo(3.1, 10.3, 30.1);
% Jeep Cherokee SE
[accelerationTime50_Jeep, distBefore90_Jeep] = foo(3.2, 12, 38.2);
% Kia Sportage
[accelerationTime50_Kia, distBefore90_Kia] = foo(4.2, 12.8, 38.7);
% Subaru Forester L
[accelerationTime50_Subaru, distBefore90_Subaru] = foo(2.8, 9.5, 22.7);
% Toyota RAV4
[accelerationTime50_Toyota, distBefore90_Toyota] = foo(3, 10.2, 31.7);

accelerationTime50_Honda
distBefore90_Honda

accelerationTime50_Jeep
distBefore90_Jeep

accelerationTime50_Kia
distBefore90_Kia

accelerationTime50_Subaru
distBefore90_Subaru

accelerationTime50_Toyota
distBefore90_Toyota
















