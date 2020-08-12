%% WEIGHTS_BERN -
%       Computation of weights based on the Bernstein representation

function w = weights_bern(n,t1,t2)
	b = zeros(n+1,1);
	c = b;
	for i = 1:n+1
		b(i) = bern(n,i-1,t1);
		c(i) = bern(n,i-1,t2);
	end
	w = b*c';
end
