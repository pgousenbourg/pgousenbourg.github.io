% SURFACE_MEAN_CONSTRAINED_C1
%       Computes the Bezier surface based on the Bezier points b,
%       evaluated at time (t1,t2) in [0,1]. The degree (d) of the Bezier
% 		surface is given in entry.
% 
% Input: b      : the control points (cell d+1 x d+1).
%        w   	: the Bernstein weights
% 	 d 	: the degree of the curve.
%
% Output: the Bezier curve, in a matrix [dim1 x dim2]

function res = surface_mean_c1(b,d,w,manifold,nint)
  if nargin < 6
    nint = 0;
  end
  
  global_variables;
  assert(size(b,1) <= d+1,'  The degree of the curve is too high for the number of control points provided');
  
  options = optimoptions('fmincon','Display','off');
  res = fmincon(@(y)dist_helper_sphere_c1(y,b,d,w),b{ceil(d/2), ceil(d/2)}, [], [], [], [], [], [], @constraints, options);