function f = IsInvertible(a,b,c,d)

% first check if the 'Determinant' is zero
if ((a*d)-(b*c) == 0)
    disp('Matrix NOT invertible!');
end

% if not zero, display this
if ((a*d)-(b*c) ~= 0)
    disp('Matrix IS invertible!');
    
    % calculate inversed matrix
    Matrix = [d -b; -c a];
    InversedMatrix=(1/((a*d)-(b*c)))*Matrix;

    % return inversed matrix
    f = InversedMatrix;
end