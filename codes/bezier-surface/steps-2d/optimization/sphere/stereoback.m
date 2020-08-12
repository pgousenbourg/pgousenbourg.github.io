% STEREOBACK
% Inverse stereographic projection of a point y.
%
% Input: y : the projection of a point x on the stereographic plane.
%
% Output: x : the point on the sphere, projected back on it.
%
% Constraints:
% 	y must be a point in the plane.
% 	y is expressed in the euclidean components.

function x = stereoback(y)
	% Defense
	assert(size(y,1) == 1 || size(y,2) == 1,'x must be a vector');
	assert(length(y) == 2,'x is not an object of R^2');
	
	% Projection
	x = [2*y(1) ; 2*y(2) ; -1 + y(1).^2 + y(2).^2]./(1 + y(1).^2 + y(2).^2);
end

