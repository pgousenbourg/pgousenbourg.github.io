% DIST_so3_GENERAL
% Manifold: so3
% ----------------
% Input: 	x : intermediate points q on the geodesic
% 			p : the vertex from which the distance is computed.
% Data structure:
% 			x = [q_1,q_2,...,q_k = x]
% 			the line is: [p, q_1,...,x].
% Output: 	dist : the distance of the sequence of points [p, q_1,...,x]

function dist = dist_so3_general(x,p,dim)
	
	% Defensive
	assert(mod(length(p),dim) == 0,...
		'Error! Arguments do not represent sequences of points in the plane!');
	
	
	% At least one intermediate point
	if length(x) > length(p)
		n_interm = length(x)/dim;		% Number of intermediate points
		
		% Loop
		dist = 0;
		for k=1:n_interm-1
			dist = dist + dist_so3(x(dim*(k-1)+1:dim*k),x(dim*k+1:dim*(k+1)));
		end

		dist = dist + dist_so3(x(1:dim),p);

	% No intermediate points
	else
		dist = dist_so3(x,p);
	end
 end
