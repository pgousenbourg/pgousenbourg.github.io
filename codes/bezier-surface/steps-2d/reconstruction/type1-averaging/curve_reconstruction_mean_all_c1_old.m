%% CURVE-RECONSTRUCTION-MEAN-ALL-C1 -
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

function pb = curve_reconstruction_mean_all_c1(pb)
	global_variables;
	
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
	
	% Compute fictionnal control points here
	[bx,by]  = size(b);
	new_b 	 = cell(bx+2,by+2);
	
	% Velocities
	v_left  = geo_log(b(2,:),b(1,:));
	v_right = geo_log(b(end-1,:),b(end,:));
	v_up	= geo_log(b(:,end-1),b(:,end));
	v_down	= geo_log(b(:,2),b(:,1));
	
	v_corners_left = geo_log(b(2,[2,end-1]),b(1,[1,end]));
	v_corners_right = geo_log(b(end-1,[2,end-1]),b(end,[1,end]));
	
	% 2*v
	for i = 1:length(v_left)
		v_left{i} = 2*v_left{i};
		v_right{i} = 2*v_right{i};
	end
	for i = 1:length(v_up)
		v_up{i} = 2*v_up{i};
		v_down{i} = 2*v_down{i};
	end
	for i = 1:2
		v_corners_left{i} = 2*v_corners_left{i};
		v_corners_right{i} = 2*v_corners_right{i};
	end	
	% Fictional control points
	b_left 	= geo_exp(b(2,:),v_left);
	b_right = geo_exp(b(end-1,:),v_right);
	b_up	= geo_exp(b(:,end-1),v_up);
	b_down 	= geo_exp(b(:,2),v_down);
	b_corners_left = geo_exp(b(2,[2,end-1]), v_corners_left);
	b_corners_right = geo_exp(b(end-1,[2,end-1]), v_corners_right);
	
	% Store in new_b
	new_b(1,2:end-1)    = b_left;
	new_b(end,2:end-1)  = b_right;
	new_b(2:end-1,1)    = b_down;
	new_b(2:end-1,end)  = b_up;
	new_b(2:end-1,2:end-1) = b;
	new_b(1,[1,end]) 	= b_corners_left;
	new_b(end,[1,end]) 	= b_corners_right;
	
	% Use b hereunder ;-)
	b = new_b;
	
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
		
		% The control points are actually inner control points and outer control points
		% ind_x and ind_y give the range of points needed to be taken in b.
		ind_x = [(k-1)*d , (k-1)*d + 2: k*d , k*d + 2]; 
		ind_y = [(l-1)*d , (l-1)*d + 2: l*d , l*d + 2];
		bb = b( ind_x + 1 ,  ind_y + 1);				% +1 because of the fictional points
		
		% Reconstruction by overall mean
		for i=1:t
		for j=1:t
			curve(dx+i,dy+j,:,:) = surface_mean_c1(bb,d,vt(i),vt(j),pb.manifold,pb.nint);
			
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
end
