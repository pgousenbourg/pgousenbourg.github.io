%% CURVE-RECONSTRUCTION-MEAN-ALL -
%       Reconstrucs the Bezier curve based on the interpolation points and 
%       the control points given in the structure pb. The piecewize Bezier
%       curve is assumed to be composed of segments of degree 2 on the
%       first and last segment, and 
%
%  INPUT: * pb : the structure of the interpolation problem containing:
%               pb.interp (cell{n x 1})     : the interpolation points;
%               pb.control (cell{2n - 4})   : the control points;
%               pb.t                        : the number of time steps for
%                                             the segments.
% 
%  OUTPUT: pb : the structure updated with the curve pb.curve stored in a
%  tensor.

function pb = curve_reconstruction_mean_all(pb)
    % data
    b      	= pb.control;
    t       = pb.t;
    d       = pb.d;
    n 		= pb.n;
    m 		= pb.m;
    
    % The curve is a different object following of the manifold.
    vt 		= linspace(0, 1, t);
    curve 	= zeros(t*(n-1),t*(m-1),pb.dim1,pb.dim2); 	% Curve is a tensor
														% n x m (rectangle parametrization)
														% dim1xdim2 (points)
	
	% Waitbar just because it is fun ^^.
		h = waitbar(0,'Initialization of the De Casteljau algoritm...');
		total_steps = t*t*(n-1)*(m-1);
		perc = 0;
		
	% For each patch (n ~ x, m ~ y)
	for k = 1:n-1
	for l = 1:m-1
		% forward
		dx = (k-1)*t;
		dy = (l-1)*t;
		bb = b((k-1)*d +1:k*d+1  , (l-1)*d + 1:l*d + 1);
		
		% Reconstruction by overall mean
		for i=1:t
		for j=1:t
			curve(dx+i,dy+j,:,:) = surface_mean(bb,d,vt(i),vt(j),pb.manifold,pb.nint);
			
			% Waitbar
			perc = perc + 1/total_steps;
			waitbar(perc,h,sprintf(...
				['Processing De Casteljau (patch [',num2str(k),',',num2str(l),'] of [',num2str(n-1),',',num2str(m-1),']). Complete: %.f %%.'],...
				perc*100));
		end
		end
	end
	end
    
    close(h);

    %% Store
    pb.curve = curve;
    pb.method = 'type1-averaging-c0';
end
