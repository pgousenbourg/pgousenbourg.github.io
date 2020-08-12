% DIST_SPHERE
% Distance between two points on a sphere.

function d = dist_sphere(x,y)
	% Defense
	assert(size(x,1) == 1 || size(x,2) == 1,'x must be a vector');
	assert(size(y,1) == 1 || size(y,2) == 1,'y must be a vector');
	assert(length(x) == length(y),'x and y must be the same length');
	assert(norm(x) < 1.01 && norm(x) > 0.99,'x must be normed');
	assert(norm(y) < 1.01 && norm(y) > 0.99,'y must be normed');
	
	% Reshape
	x = reshape(x,length(x),1);
	y = reshape(y,length(y),1);
	
	% Distance computation
	d = (acos(x'*y) ^2);
end
