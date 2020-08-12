function res = surface_mean_constrained(b, d, t1, t2, manifold, nint)

  if nargin < 6
    nint = 0;
  end
  
  global_variables;
  assert(size(b,1) <= d+1,'  The degree of the curve is too high for the number of control points provided');
  
  
  
  options = optimoptions('fmincon','Display','off');
  res = fmincon(@(y)dist_helper_sphere(y,b,d,t1,t2),b{ceil(d/2), ceil(d/2)}, [], [], [], [], [], [], @constraints, options);
  