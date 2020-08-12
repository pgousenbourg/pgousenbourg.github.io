%% DRAW_BEZIER -
%       Draws the piecewise B�zier function interpolating the data given in
%       the structure pb. The function interpolated the points pb.interp,
%       is driven by the control points pb.control b, and is represented by
%       the curve pb.curve. 
%  INPUT: * pb : the structure of the interpolation problem containing:
%               pb.interp (cell{n x 1})     : the interpolation points;
%               pb.control (cell{2n - 4})   : the control points;
%               pb.t                        : the number of time steps for
%                                             the segments.
% 
%  OUTPUT: plot.

function pb = draw_bezier_surface(pb)    
	switch pb.manifold
		case 'euclidean'
			plot_surface_eucl(pb);
        case 'sphere'
            plot_surface_sphere(pb);
        case 'SO3'
            plot_surface_so3(pb.curve,pb.interp,pb.control,pb.objectSO3);
        otherwise error('Wrong manifold chosen');
    end
end
