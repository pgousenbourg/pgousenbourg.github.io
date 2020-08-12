%% DX_dist: computes the derivative of the distance function for a given
%  manifold, with respect to x.

function dfdx = dx_dist(x,y,manifold)
	switch manifold
		case 'euclidean'
			dfdx = dx_dist_eucl(x,y);
		case 'sphere'
			% Project points on the sphere
			u = stereoback(x);
			v = stereoback(y);
			
			% Evaluate the derivative of the distance on the sphere
			% with respect to u ~ x.
			% 3D gradient
			dfdu = dx_dist_sphere(u,v);
			dfdu = reshape(dfdu,1,3);
			
			% Evaluate the lagrangian of the transform with respect to x
			J 	 = jaco_stereoback(x);
			
			% Real 2D gradient.
			dfdx = dfdu * J;
		case 'so3'
			dfdx = dx_dist_so3(x,y);
	otherwise
		error('No such manifold for this function');
	end
end
