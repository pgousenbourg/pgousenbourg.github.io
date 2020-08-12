%% F_OPT : handle function for the optimization problem.
% 	
% 	INPUT: 	x = the searched point (vector)
% 			b = the interpolation points (cell(n,n))
% 			w = the weights (matrix(n,n))
% 			d = the dimension of one point within x
% 			m = manifold

function [f,g] = f_opt_all(x,w,b,d,m)
	% Useful parameters
	n = size(b,1);						% degree of the curve + 1
	k = (length(x) - d)./((n^2)*d); 	% Number of intermediate points
	
	% Useful parameters for positionning within x
	dy = k*d;							% distance between two control points (y)
	dx = n*k*d;							% distance between two control points (x)
	p  = x(end-d+1:end);				% Searched point (p)
	
	
	
	%% -- Evaluation of the function distance --------------------------
	%  -----------------------------------------------------------------
		
		f = 0;
				
		% sum of the distances
		for i = 1:n
		for j = 1:n
			% position in the vector x of the point b_ij	
			pij  	= (i-1)*dx + (j-1)*dy;
			% points on the line from b_ij to p.
			points 	= [x(pij+1 : pij+k*d) p];
			
			% add the distance to the function
			f 	 	= f + w(i,j)*f_dist(points,b{i,j},d,m);
		end
		end
	
	
	
	%% -- Gradient evaluation ------------------------------------------
	% 		- searched point = x(end-dim+1:end)
	% 		- k intermediate points
	% ------------------------------------------------------------------
	g = zeros(size(x));		
	
	if k == 0
		for i = 1:n
		for j = 1:n
			g = g + w(i,j)*reshape(dy_dist(b{i,j},x,m),size(g));
		end
		end
	else
		for i = 1:n
		for j = 1:n
			
			% position in vector x
			pij  	= (i-1)*dx + (j-1)*dy;
			first  	= pij+1         : pij+d;
			last	= pij+(k-1)*d+1 : pij+k*d;
			
			% derivative with respect to the first intermediate point
			g(first) = g(first) + w(i,j)*reshape(dy_dist(b{i,j},x(first),m),size(g(first)));
			
			% inner derivatives
			pos2 = first;
			if k > 1
			for s = 1:k-1
				% position in vector x
				pos   = pos2;
				pos2  = pij+s*d+1     : pij+(s+1)*d;
				
				% derivatives
				g(pos)  = g(pos)  + w(i,j)*reshape(dx_dist(x(pos),x(pos2),m),size(g(pos)));
				g(pos2) = g(pos2) + w(i,j)*reshape(dy_dist(x(pos),x(pos2),m),size(g(pos2)));
			end
			end
			
			% derivative x with respect to the last intermediate point
			g(last) = g(last) + w(i,j)*reshape(dx_dist(x(last),p,m),size(g(last)));
			
			% derivative wrt the searched point
			g(end-d+1:end) = g(end-d+1:end) + w(i,j)*reshape(dy_dist(x(last),p,m),size(g(end-d+1:end)));
			
		end
		end
	end
end
