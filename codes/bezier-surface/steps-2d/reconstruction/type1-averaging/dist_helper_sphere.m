function [ res ] = dist_helper_sphere( x,p,d, t1, t2 )
%Helper function, computing the weighted geodesic average of the
%controlpoints p (cell(4,1)) to the point x (vector (3,1)) at time t
    bernstein_weights = zeros(d+1,d+1);

    for i=0:d
      for j=0:d
	bernstein_weights(i+1, j+1) = nchoosek(d,i)*t1^i*(1-t1)^(d-i)*nchoosek(d,j)*t2^j*(1-t2)^(d-j);
       end
    end

    res = 0;
    for j=0:d
      for k=0:d
        res = res + bernstein_weights(j+1, k+1) * acos(dot(x, p{j+1, k+1}))^2;
      end
    end

end