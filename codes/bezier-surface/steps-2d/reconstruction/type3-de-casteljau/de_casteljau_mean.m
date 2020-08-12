% DE_CASTELJAU_RECTANGLE
%       Computes the Bezier surface based on the Bezier points b,
%       evaluated at time (t1,t2) in [0,1]. The degree (d) of the Bezier
% 		surface is given in entry.
% 
% Input: b       : the control points (cell d+1 x d+1).
%        t1,t2   : the evaluated time on the square [0,1]x[0,1].
% 		 d 		 : the degree of the curve.
%
% Output: the Bezier curve, in a matrix [dim1 x dim2]

function y = de_casteljau_mean(b,d,t1,t2,manifold,nint)
	if nargin < 6
		nint = 0;
	end
    global_variables;
    assert(size(b,1) <= d+1,'  The degree of the curve is too high for the number of control points provided');

	x = b;
	
	% Preprocessing for the sphere - stereographic projection.
	% 	so we work on the plane, and there is no constraint on it.
	if strcmp(manifold,'sphere')
		for i = 1:size(x,1);
		for j = 1:size(x,2);
			x{i,j} = stereographic(x{i,j});
		end
		end
	end
	
	% De Casteljau
	for k = 1:d
		for i = 1:size(x,1)-1
			for j = 1:size(x,2)-1
				% Corners of the rectangle
				p  		= x(i:i+1,j:j+1);
				
				% Intermediate point is just the first vertex
				% ---
				x0     = repmat(x{i+1,j},[1 4*nint+1]);
				if strcmp(manifold,'sphere')
					x1 = x{i,j};
					x2 = x{i+1,j};
					x3 = x{i,j+1};
					x4 = x{i+1,j+1};
					x0 = (x1 + x2 + x3 + x4)./4;
				end
				dim_one_point = length(x{i,j});
				
				% Optimization
				options = optimoptions('fminunc','GradObj','on','Algorithm','quasi-newton','Display','off','DerivativeCheck','off');
				interm	= fminunc(@(y) f_opt(y,t1,t2,p,dim_one_point,manifold),x0,options);
				%pause
				
				if t1 == 0 && t2 == 0
					interm;
				end
				% Solution
				x{i,j}  = interm(end-dim_one_point+1:end);
			end
		end
		x       = x(1:end-1,1:end-1);
	end
	
	% Verify that size x = 1
	assert(size(x,1) == 1 && size(x,2) == 1);
	
	% Postprocessing for the sphere - back stereographic projection.
	if strcmp(manifold,'sphere')
		x{:} = stereoback(x{:});
	end
	
	y = squeeze(x{:});
end
