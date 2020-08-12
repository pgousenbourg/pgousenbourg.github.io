% simple_tensorization(p, A, d): 
% 		 Computes the control points of a C^2-Bezier spline in R^n.
% ------------------------------------------------------------
% This file is part of the project "C1 bezier paths on surfaces".
%
% INPUT: 	P 	 : [cell] the interpolation points of the problem.
%
% 			A : [matrix] a matrix defining the linear combination.
%
% 			d : [int] The requested component of phat.
%
% OUTPUT: 	B : [matrix] The projected and transformed point.
% ------------------------------------------------------------
% Authors:
% 	Paul Striewski
% 	Pierre-Yves Gousenbourger
%
% Versions
% 	02/11/2015: First version.
% 	05/11/2015: Integration to the framework.
% ------------------------------------------------------------

function b = simple_tensorization(p, A, d)

	global_variables;
	M = length(p);

	b = cell(3*M-2,1);

	for m = 1:M-1
	for i = 0:3
		b{3*(m-1)+i+1} = bim(p,A,i,m,d);
	end
	end

	% Sanity checks
	fprintf('Checking interpolation condition...\n');
	for i=4:3:3*M-3
		av = geo_map(b{i-1}, b{i+1},0.5); 
		fprintf('Distance between average and cp: %d\n', acos(dot(av, b{i})));
	end
end
