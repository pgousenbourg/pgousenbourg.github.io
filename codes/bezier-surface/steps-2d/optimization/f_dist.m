%% F: computes the distance function for a given
%  manifold, with respect to x.

function f = f_dist(x,y,dim,manifold)
	switch manifold
		case 'euclidean'
			f = dist_eucl_general(x,y,dim);
		case 'sphere'
			f = dist_sphere_general(x,y,dim);
		case 'SO3'
			f = dist_so3_general(x,y,dim);
	otherwise
		error('No such manifold for this function');
	end
end
