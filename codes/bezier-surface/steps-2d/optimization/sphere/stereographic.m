% STEREOGRAPHIC
% Stereographic projection of a point x.
%
% Input: x : the point defined on the sphere.
%
% Output: y : the projection of the point on the
% 			  stereographic plane.
%
% Constraints:
% 	x must be a point defined on the sphere.
% 	x cannot be the north pole.
% 	x is expressed in the euclidean components.

function y = stereographic(x)
	% Defense
	assert(size(x,1) == 1 || size(x,2) == 1,'x must be a vector');
	assert(norm(x) < 1.01 && norm(x) > 0.99,'x must be normed');
	assert(length(x) == 3,'x is not an object of S^2');
	assert(x(3) ~= 1,'x cannot be the north pole');
	
	% Projection
	y = x(1:2)./(1-x(3));
	y = reshape(y,2,1);
end

