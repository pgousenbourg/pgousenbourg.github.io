% Function matlab to evaluate the gradient of the distance between two points on the
% Euclidean space.
% Takes a vector(x)
% a vector (p)
% returns a scalar value for all differentials.

function df = dx_dist_eucl(x,y)
	df = 2*(x - y);
end
