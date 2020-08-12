% PLOT_SURFACE_SPHERE
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

function pb = plot_surface_eucl(pb)

    % Variables
    t 		= pb.t;
	curve 	= pb.curve;
	p 		= pb.interp;
	b 		= pb.control;
	[N,M,~,~] = size(curve);
	
	% Path to follow
	tt  = 0:M-1;
	t_1 = tt + 1;
	t_2 = (floor((N-1)/2*(1-cos(6/M*pi*t_1)))+1);
	
	toplot = zeros(M,length(p{1,1}));
	for i = 1:length(t_1);
		toplot(i,:) = curve(t_1(i),t_2(i),:,:);
	end
	pb.curve_2 = toplot;
	
	
	% Prepare the sphere to plot on it
	[x,y,z] = sphere(20);
	surf(x*0.99,y*0.99,z*0.99,'FaceColor',[255 215 0]/255,'FaceAlpha',0.5,'EdgeAlpha',0.5);
	
	hold on;
	
	% Curve
	plot3(toplot(:,1),toplot(:,2),toplot(:,3),'b', 'LineWidth',1.5);
	
	% Control points
	for i = 1:size(b,1)
	for j = 1:size(b,2)
		toplot = b{i,j};
		plot3(toplot(1),toplot(2),toplot(3),'.','Color',[0 0.7 0],'MarkerSize',20);
		plot3(toplot(1),toplot(2),toplot(3),'.w','MarkerSize',10);
	end
	end

	% Interpolation points
	for i = 1:size(p,1)
	for j = 1:size(p,2)
		toplot = p{i,j};
		plot3(toplot(1),toplot(2),toplot(3),'.r','MarkerSize',20);
	end
	end

	axis off;
	axis equal;
end
