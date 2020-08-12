% JACO_SPHERE
% Jacobian of the stereographic transform.

function J = jaco_stereoback(x)
	% Defense
	assert(size(x,1) == 1 || size(x,2) == 1,'x must be a vector');
		
	J = zeros(3,2);
	
	J(1,1) = -2*x(1)^2 + 2*x(2)^2 + 2;
	J(2,1) = -4*x(1)*x(2);
	J(3,1) = 4*x(1);
	J(1,2) = -4*x(1)*x(2);
	J(2,2) = 2*x(1)^2 - 2*x(2)^2 + 2;
	J(3,2) = 4*x(2);
	
	J = J/((1 + x(1)^2 + x(2)^2)^2);
end
