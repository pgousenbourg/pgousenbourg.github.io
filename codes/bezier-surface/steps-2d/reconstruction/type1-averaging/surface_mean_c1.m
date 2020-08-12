% SURFACE_MEAN_C1
%       Computes the Bezier surface based on the Bezier points b,
%       evaluated at time (t1,t2) in [0,1]. The degree (d) of the Bezier
% 		surface is given in entry.
% 
% Input: b       : the control points (cell d+1 x d+1).
%        t1,t2   : the evaluated time on the square [0,1]x[0,1].
% 	 d 		 : the degree of the curve.
%
% Output: the Bezier curve, in a matrix [dim1 x dim2]

function y = surface_mean_c1(b,d,w,manifold,nint)
	if nargin < 6
		nint = 0;
	end
    global_variables;
    assert(size(b,1) <= d+1,'  The degree of the curve is too high for the number of control points provided');

	
	% Special case for the sphere
	switch manifold
		case 'sphere'
			y = surface_mean_constrained_c1(b,d,w,manifold,nint);
		otherwise
			% Starting point (here: first vertex)
			if nint == 0
				x0 	= b{1,1};
			else
				x0     = repmat(b{1,1},[1 (size(b,1)^2)*nint+1]);
			end
			dim_one_point = length(b{1,1});
			
			% Optimization
			options = optimoptions('fminunc','GradObj','on','Algorithm','quasi-newton','Display','off','DerivativeCheck','off');
			x		= fminunc(@(y) f_opt_all(y,w,b,dim_one_point,manifold),x0,options);
			p 		= x(end-dim_one_point+1:end);
			
			y = squeeze(p);
	end
end
