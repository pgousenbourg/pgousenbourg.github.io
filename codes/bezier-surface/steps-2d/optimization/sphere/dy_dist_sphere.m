% Function matlab to evaluate the gradient of the distance between two points on the
% spherical space.
% Takes a vector(x)
% a vector (p)
% returns a scalar value for all differentials.

function df = dy_dist_sphere(x,y)
	% Defense
	assert(size(x,1) == 1 || size(x,2) == 1,'x must be a vector');
	assert(size(y,1) == 1 || size(y,2) == 1,'y must be a vector');
	assert(length(x) == length(y),'x and y must be the same length');
	assert(norm(x) < 1.01 && norm(x) > 0.99,'x must be normed');
	assert(norm(y) < 1.01 && norm(y) > 0.99,'y must be normed');
	
	% Reshape
	x = reshape(x,length(x),1);
	y = reshape(y,length(y),1);
	
	% Derivative
	df = - 2 * acos(x'*y) * x * (1/sqrt(1-(x'*y)^2));
	
	if abs(1 - (x'*y)^2) < 1e-12
		df = ones(size(df)).*1e15;
	end
end
