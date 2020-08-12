%TENSORIZATION_SURFACE_VH Compute a Bezier surface using the tensorisation
%method: Vertival Bezier curves are drawn through the columns of the control
%point grid. These curves are evaluated at a time t1, as a result, a list
%of points is obtained. A horizontal Bezier curve is drawn through these
%points and evaluated in t2. This gives the point (t1, t2) on the surface.

% Input: b       : the control points (cell d+1 x d+1).
%        t1,t2   : the evaluated time on the square [0,1]x[0,1].
%        d       : the degree of the curve.
%
% Output: the Bezier curve, in a matrix [dim1 x dim2]

function y = tensorization_surface_vh( b,d,t1,t2 )


%Compute vertical Bezier curves through the columns of the control point
%grid

vertical_curve = cell(d+1,1);

for n=1:d+1
       
    vertical_curve{n} = de_casteljau_1d(b(n,:)', t2);
end

y = de_casteljau_1d(vertical_curve, t1);

end
