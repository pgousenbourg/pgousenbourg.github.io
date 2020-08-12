% PLOT_SURFACE_EUCL
% 	Plots the surface of Bezier on the Euclidean space, given the
% 	structure pb.
% 
% Input: pb: the structure of the Bezier solution.
%
% Output: a magnificent plot with:
% 	- The surface of Bezier
% 	- The control points displayed in green;
% 	- The interpolation points displayed in red;
% 	- One patch on two is blue, the other is yellow.

function plot_surface_eucl(pb)

    % Variables
    t 		= pb.t;
	curve 	= pb.curve;
	p 		= pb.interp;
	b 		= pb.control;
	
	
	% For each patch
	for k = 1:pb.n-1
	for l = 1:pb.m-1
	
		% Forward
		dx = (k-1)*t;
		dy = (l-1)*t;
		rx = dx+1:dx+t;
		ry = dy+1:dy+t;
    
		if mod(k+l,2) == 0
			surf(curve(rx,ry,1,1),curve(rx,ry,1,2),curve(rx,ry,1,3),'FaceColor',[0 0 1],'FaceAlpha',0.5,'EdgeAlpha',0.5,'LineStyle','-.');
			hold on;
		else
			surf(curve(rx,ry,1,1),curve(rx,ry,1,2),curve(rx,ry,1,3),'FaceColor',[255,215,0]/255,'FaceAlpha',0.5,'EdgeAlpha',0.5,'LineStyle','-.');
			hold on;
		end
		
	end
	end
	
	
	% Control points
	for i = 1:size(b,1)
	for j = 1:size(b,2)
		toplot = b{i,j};
		plot3(toplot(1),toplot(2),toplot(3),'.','Color',[0 0.7 0],'MarkerSize',30);
	end
	end
	
	
	% Interpolation points
	for i = 1:size(p,1)
	for j = 1:size(p,2)
		toplot = p{i,j};
		plot3(toplot(1),toplot(2),toplot(3),'.r','MarkerSize',30);
	end
	end
end
