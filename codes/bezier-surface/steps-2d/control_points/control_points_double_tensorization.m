% control_points_double_tensorization(pb): 
% 		 Computes the control points for a Bezier surface on M,
% 		 with the property that the curves are C^2 on R^n
% ------------------------------------------------------------
% This file is part of the project "C1 bezier paths on surfaces".
%
% INPUT: 	pb : [struct] The structure of the problem containing:
% 					- pb.interp
% 					- pb.m
% 					- pb.n
%
% OUTPUT: 	pb : [struct] The structure is updated with pb.control
% ------------------------------------------------------------
% Authors:
% 	Paul Striewski
% 	Pierre-Yves Gousenbourger
%
% Versions
% 	02/11/2015: First version.
% 	05/11/2015: Integration to the framework.
% ------------------------------------------------------------


function pb = control_points_double_tensorization(pb)

	global_variables;
	
	% Data
	p = pb.interp;
	M = pb.n;
	N = pb.m;
	
	assert(M > 2, 'There must be at least 3 interpolation points in the x direction.');
	assert(N > 2, 'There must be at least 3 interpolation points in the y direction.');

	% Parameters
	d  = 7; % the number of elements around the diag of Am, An.
	
	Am = inv((1/6)*(diag(4*ones(1,M-2),0) + diag(ones(1,M-3),1) + diag(ones(1,M-3),-1)));
	An = inv((1/6)*(diag(4*ones(1,N-2),0) + diag(ones(1,N-3),1) + diag(ones(1,N-3),-1)));

	% Preparation of structures
	b 	 	= cell(3*M - 2, 3*N - 2);
	bRows 	= cell(M, 3*N-2);
	
	
	% ==== Computation by double tensorization =========================
	% Step 1:
	% -------
	% For each m in the x direction, 
	% compute control points in y direction.
	for m = 1:M
		bRows(m,:) = simple_tensorization(p(m,:), An, d);
	end

	% Step 2:
	% -------
	% Compute the control points in the x direction 
	% based on each computed row in the y direction.
	for n = 1:3*N-2
		b(:,n) = simple_tensorization(bRows(:,n), Am, d);
	end

	% ==== End computation by double tensorization =====================
	
	
	
	%Interpolation points
	b(1:3:end,1:3:end) = p;
	
	% Control points at the interfaces
	% x direction
	for m = 1:M-2
		b(3*m+1, 2:3:end) = geo_map(b(3*m, 2:3:end), b(3*m + 2, 2:3:end), 0.5);
		b(3*m+1, 3:3:end) = geo_map(b(3*m, 3:3:end), b(3*m + 2, 3:3:end), 0.5);
	end
		
	% y direction
	for n = 1:N-2
		b(2:3:end,3*n+1) = geo_map(b(2:3:end,3*n), b(2:3:end,3*n+2), 0.5);
		b(3:3:end,3*n+1) = geo_map(b(3:3:end,3*n), b(3:3:end,3*n+2), 0.5);
	end	
		
	pb.control 	= b;
	pb.d 	 	= 3;
end
