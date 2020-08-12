%% DX_dist: computes the derivative of the distance function for a given
%  manifold, with respect to x.

function dfdy = dy_dist(x,y,manifold)
	switch manifold
		case 'euclidean'
			dfdy = dy_dist_eucl(x,y);
		case 'sphere'
			% Projection of the points on the sphere			
			u = stereoback(x);
			v = stereoback(y);
			
			% Compute the derivative on the sphere with respect to v
			% 3-D gradient
			dfdv = dy_dist_sphere(u,v);

			% Compute the jacobian of the transform with respect to y
			J 	 = jaco_stereoback(y);
			
			% Actual gradient (2-D gradient)
			dfdy = dfdv' * J;
		case 'so3'
			dfdy = dy_dist_so3(x,y);
	otherwise
		error('No such manifold for this function');
	end
end
