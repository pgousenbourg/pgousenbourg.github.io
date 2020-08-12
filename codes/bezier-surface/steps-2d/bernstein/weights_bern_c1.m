%% WEIGHTS_BERN_C1 -
%       Computation of weights based on the Bernstein representation
% 		for C^1 curves.

function b = weights_bern(n,d,t,Nmax)
	b = zeros(d+1,1);
	
	
	% Extreme left (or down)
	if n == 1
		b(1) = bern(d,0,t);
		b(2) = bern(d,1,t);
	else
		b(1) = 1/2*bern(d,0,t);
		b(2) = bern(d,1,t) + b(1);
	end
	
	% Inner points
	for i = 3:n-2
		b(i) = bern(d,i-1,t);
	end
	
	
	% Extreme right (or up)
	if n == Nmax
		b(d)   = bern(d,d-1,t);
		b(d+1) = bern(d,d,t);
	else
		b(d+1) = 1/2*bern(d,d,t);
		b(d)   = bern(d,d-1,t) + b(d+1);
	end
end
