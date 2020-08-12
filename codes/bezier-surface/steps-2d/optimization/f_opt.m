%% F_OPT : handle function for the optimization problem.
% x = the searched point (matrix)
% p = the interpolation points (cell(2,2))
% t1, t2 = the time instants
% dim = the dimension of a point in this vector.
% m = manifold
function [f,g] = f_opt(x,t1,t2,p,d,m)
	% Useful parameter: the number of points to discretize one curves.
	n = (length(x) - d)/d/4;
	% Weigths
	w 	   	= zeros(2,2);
	w(1,1) 	= (1-t1)*(1-t2);
	w(2,1) 	= (1-t2)*t1; 
	w(1,2) 	= (1-t1)*t2;
	w(2,2) 	= t1*t2;
	
	%% -- Evaluation of the function distance --------------------------
	%  ------
		% Distances
		dist = zeros(2,2);
		%dist = cellfun(@(y) dist_eucl(x,y),p);
		
		dist(1,1) = f_dist([x(      1:  d*n) x(end-d+1:end)],p{1,1},d,m);
		dist(1,2) = f_dist([x(  d*n+1:2*d*n) x(end-d+1:end)],p{1,2},d,m);
		dist(2,1) = f_dist([x(2*d*n+1:3*d*n) x(end-d+1:end)],p{2,1},d,m);
		dist(2,2) = f_dist([x(3*d*n+1:4*d*n) x(end-d+1:end)],p{2,2},d,m);
		
		% sum of the distances
		f = sum(sum(w.*dist));
	
	
	%% -- Gradient evaluation ------------------------------------------
	% 		- searched point = x(end-dim+1:end)	
	% ------
	g = zeros(size(x));
	
	if n > 1
		% Derivative wrt the first intermediate point
		g(1:d)  		   	 	= (dy_dist(p{1,1},x(1:d),m) 				+ dx_dist(x(1:d),				x(d+1:2*d),m))			     *w(1,1);
		g(d*n+1:d*(n+1))   	 	= (dy_dist(p{1,2},x(d*n+1:d*(n+1)),m) 		+ dx_dist(x(d*n+1:d*(n+1)),	 	x(d*(n+1)+1:d*(n+2)),m))	 *w(1,2);
		g(d*2*n+1:d*(2*n+1)) 	= (dy_dist(p{2,1},x(d*2*n+1:d*(2*n+1)),m) 	+ dx_dist(x(d*2*n+1:d*(2*n+1)),	x(d*(2*n+1)+1:d*(2*n+2)),m)) *w(2,1);
		g(d*3*n+1:d*(3*n+1)) 	= (dy_dist(p{2,2},x(d*3*n+1:d*(3*n+1)),m) 	+ dx_dist(x(d*3*n+1:d*(3*n+1)),	x(d*(3*n+1)+1:d*(3*n+2)),m)) *w(2,2);
		
		if n > 2
			% Derivative wrt the inner intermediate points
			for i = 1:n-2
				g(i*d+1:(i+1)*d) 			= (dy_dist(x((i-1)*d+1:i*d), x(i*d+1:(i+1)*d),m) 	+ dx_dist(x(i*d+1:(i+1)*d),x((i+1)*d+1:(i+2)*d),m))*w(1,1);
				%g(d+1        :d*(n-1)) 		= (dy_dist(x(1:d*(n-2)),		x(d+1:d*(n-1)),m)			+ dx_dist(x(d+1:d*(n-1)),			x(2*d+1:d*n),m))			*w(1,1);
				g(d*(n+i)+1:d*(n+i+1)) 		= (dy_dist(x((n+i-1)*d+1:(n+i)*d), x(d*(n+i)+1:d*(n+i+1)),m) 	+ dx_dist(x(d*(n+i)+1:(n+i+1)*d),x((n+i+1)*d+1:(n+i+2)*d),m))*w(1,2);
				%g(d*(n+1)+1  :d*(2*n-1))   	= (dy_dist(x(d*n+1:d*(2*n-2)),  x(d*(n+1)+1:d*(2*n-1)),m)	+ dx_dist(x(d*(n+1)+1:d*(2*n-1)),	x(d*(n+2)+1:d*2*n),m))		*w(1,2);
				g(d*(2*n+i)+1:d*(2*n+i+1)) 	= (dy_dist(x((2*n+i-1)*d+1:(2*n+i)*d), x(d*(2*n+i)+1:d*(2*n+i+1)),m) 	+ dx_dist(x(d*(2*n+i)+1:(2*n+i+1)*d),x((2*n+i+1)*d+1:(2*n+i+2)*d),m))*w(2,1);
				%g(d*(2*n+1)+1:d*(3*n-1)) 	= (dy_dist(x(d*2*n+1:d*(3*n-2)),x(d*(2*n+1)+1:d*(3*n-1)),m)	+ dx_dist(x(d*(2*n+1)+1:d*(3*n-1)),	x(d*(2*n+2)+1:d*3*n),m))	*w(2,1);
				g(d*(3*n+i)+1:d*(3*n+i+1)) 	= (dy_dist(x((3*n+i-1)*d+1:(3*n+i)*d), x(d*(3*n+i)+1:d*(3*n+i+1)),m) 	+ dx_dist(x(d*(3*n+i)+1:(3*n+i+1)*d),x((3*n+i+1)*d+1:(3*n+i+2)*d),m))*w(2,2);
				%g(d*(3*n+1)+1:d*(4*n-1))	= (dy_dist(x(d*3*n+1:d*(4*n-2)),x(d*(3*n+1)+1:d*(4*n-1)),m)	+ dx_dist(x(d*(3*n+1)+1:d*(4*n-1)),	x(d*(3*n+2)+1:d*4*n),m))	*w(2,2);
			end
		end
		
		% Derivative wrt the last intermediate point
		g(d*(n-1)+1  :d*n)  	= (dy_dist(x(d*(n-2)+1:d*(n-1)),	 x(d*(n-1)+1  :d*n),m) 		+ dx_dist(x(d*(n-1)+1  :d*n),	x(end-d+1:end),m))*w(1,1);
		g(d*(2*n-1)+1:d*2*n) 	= (dy_dist(x(d*(2*n-2)+1:d*(2*n-1)), x(d*(2*n-1)+1:d*2*n),m)	+ dx_dist(x(d*(2*n-1)+1:d*2*n), x(end-d+1:end),m))*w(1,2);
		g(d*(3*n-1)+1:d*3*n) 	= (dy_dist(x(d*(3*n-2)+1:d*(3*n-1)), x(d*(3*n-1)+1:d*3*n),m)	+ dx_dist(x(d*(3*n-1)+1:d*3*n), x(end-d+1:end),m))*w(2,1);
		g(d*(4*n-1)+1:d*4*n) 	= (dy_dist(x(d*(4*n-2)+1:d*(4*n-1)), x(d*(4*n-1)+1:d*4*n),m) 	+ dx_dist(x(d*(4*n-1)+1:d*4*n), x(end-d+1:end),m))*w(2,2);
		
				
	elseif n == 1
		% Only one intermediate point
		g(1:d)  		   	 	= (dy_dist(p{1,1},x(1:d),m) 		+ dx_dist(x(1:d), 		x(end-d+1:end),m))*w(1,1);
		g(d*n+1:d*(n+1))   	 	= (dy_dist(p{1,2},x(d+1:d*2),m) 	+ dx_dist(x(d+1:d*2), 	x(end-d+1:end),m))*w(1,2);
		g(d*2*n+1:d*(2*n+1)) 	= (dy_dist(p{2,1},x(d*2+1:d*3),m) 	+ dx_dist(x(d*2+1:d*3), x(end-d+1:end),m))*w(2,1);
		g(d*3*n+1:d*(3*n+1)) 	= (dy_dist(p{2,2},x(d*3+1:d*4),m) 	+ dx_dist(x(d*3+1:d*4), x(end-d+1:end),m))*w(2,2);
		
		
	elseif n == 0
		% No intermediate points.
		g = dy_dist(p{1,1},x,m).*w(1,1) + dy_dist(p{1,2},x,m).*w(1,2) + ...
			dy_dist(p{2,1},x,m).*w(2,1) + dy_dist(p{2,2},x,m).*w(2,2);
			
	end
	
	if n > 0
		% Derivative wrt the searched point
		g(end-d+1:end) 			= 	  dy_dist(x(d*(n-1)+1  :d*n),	x(end-d+1:end),m).*w(1,1) ...
									+ dy_dist(x(d*(2*n-1)+1:d*2*n), x(end-d+1:end),m).*w(1,2) ...
									+ dy_dist(x(d*(3*n-1)+1:d*3*n), x(end-d+1:end),m).*w(2,1) ...
									+ dy_dist(x(d*(4*n-1)+1:d*4*n), x(end-d+1:end),m).*w(2,2);
	end
	
end
