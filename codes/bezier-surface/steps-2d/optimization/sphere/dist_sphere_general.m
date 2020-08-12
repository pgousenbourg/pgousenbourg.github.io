% DIST_SPHERE_GENERAL
% Manifold: sphere
% ----------------
% Input: 	x : intermediate points q on the geodesic
% 			p : the vertex from which the distance is computed.
% Data structure:
% 			x = [q_1,q_2,...,q_k = x]
% 			the line is: [p, q_1,...,x].
% Output: 	dist : the distance of the sequence of points [p, q_1,...,x]

function dist = dist_sphere_general(x,p,dim)
	
	% Defensive
	assert(mod(length(x),dim) == 0,...
		'Error! Arguments do not represent sequences of points in the plane!');
	
	
	% At least one intermediate point
	if length(x) > length(p)
		n_interm = length(x)/dim;		% Number of intermediate points
		
		% Loop
		dist = 0;
		for k=1:n_interm-1
			x1 = stereoback(x(dim*(k-1)+1:dim*k));
			x2 = stereoback(x(dim*k+1:dim*(k+1)));
			dist = dist + dist_sphere(x1,x2);
		end
		
		x1 = stereoback(x(1:dim));
		x2 = stereoback(p);
		dist = dist + dist_sphere(x1,x2);

	% No intermediate points
	else
		x1 = stereoback(x);
		x2 = stereoback(p);		
		dist = dist_sphere(x1,x2);
	end
 end
