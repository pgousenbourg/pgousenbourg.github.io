% FUNCTION DRAW_SO3_ELLIPSE(X,COLOR,XS,YS,ZS,PLACE): 
% 		 Plots the SO(3) object as an ellipse.
% ------------------------------------------------------------
% This file is part of the project "C1 bezier paths on surfaces"
% and is intended in plotting the surface of Bezier for SO3.
%
% INPUT: X		:	
% 		 COLOR 	:	
% 		 XS		: 	
% 		 YS 	:   
% 		 ZS		:
% 		 PLACE  :
%
% OUTPUT: The SO(3) object as an ellipsoid.
% ------------------------------------------------------------
% Initial author: Pierre-Yves Gousenbourger
% Versions
% 	28/07/2015: first version.
% ------------------------------------------------------------
function draw_ellipse(x,Xs,Ys,Zs,type,place)
	switch type
	case 'normal'; 	color      = [203 220 237]/255;
	case 'interp'; 	color      = [255 102 102]/255;
	case 'control'; color      = [102 204   0]/255;
	otherwise; 		color      = [203 220 237]/255;
	end

    S = x*[Xs(:).'; Ys(:).'; Zs(:).'];
    Xr = reshape(S(1,:), size(Xs));
    Yr = reshape(S(2,:), size(Ys));
    Zr = reshape(S(3,:), size(Zs));
    center = place;
    
    %clf;
    hold on;
    
    % Plot the ellispoid
    surf( 	Xr + center(1)*ones(size(Xr)),...
			Yr + center(2)*ones(size(Yr)),...
			Zr,...
			'Facecolor',color,...
			'EdgeAlpha',0.3);
    
    % Plot the axes
    r = 1.1;
    plot3(r*[1 -1] + center(1)*[1,1], ...
			[0  0] + center(2)*[1,1], ...
			[0  0],...
			 '-', 'LineWidth', 2, 'Color', [42 83 125]/255);
    plot3(  [0  0] + center(1)*[1,1], ...
		  r*[1 -1] + center(2)*[1,1], ...
		    [0  0],...
		     '-', 'LineWidth', 2, 'Color', [42 83 125]/255);
    plot3(  [0  0] + center(1)*[1,1], ...
			[0  0] + center(2)*[1,1], ...
			r*[1 -1],...
			 '-', 'LineWidth', 2, 'Color', [42 83 125]/255);
    
    %axis equal;
    axis off;
    axis equal;
end
