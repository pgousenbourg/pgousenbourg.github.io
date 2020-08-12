%Helper function for surface_mean_constrained_c1. This function
%differs from dist_helper_sphere, by expecting a matrix with weights
%(Bernstein weights) instead of a pair (t1, t2) as the fourth input argument.

function res = dist_helper_sphere_c1(x, b, d, w)

    res = 0;
    if size(w,1) ~= d+1 || size(w,2) ~= d+1
      error('dist_helper_sphere_c1: The dimensions of the matrix storing the Bernstein weights are incorrect.');
    end
    
    for j=0:d
      for k=0:d
        res = res + w(j+1, k+1) * acos(dot(x, b{j+1, k+1}))^2;
      end
    end


end