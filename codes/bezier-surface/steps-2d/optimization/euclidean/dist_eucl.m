% Function matlab to evaluate the distance between two points on the
% Euclidean space.
% Takes a cell(x)
% a vector (p)
% returns a scalar.

function d = dist_eucl(x,y)
	d = norm(x - y)^2;
end
