% FUNCTION PLOT_SURFACE_SO3_ARROW(S,data,control): 
% 		 Plots the surface S of SO3 objects.
% ------------------------------------------------------------
% This file is part of the project "C1 bezier paths on surfaces"
% and is intended in plotting the surface of Bezier for SO3.
%
% INPUT: S		:	The surface as S(t1,t2,3,3).
% 		 data 	:	The interpolation points as a cell{t1,t2}.
% 		 control: 	The control points as a cell{t1,t2}.
%
% OUTPUT: A plot of the surface.
% ------------------------------------------------------------
% Initial author: Pierre-Yves Gousenbourger
% Versions
% 	20/07/2015: first version.
% ------------------------------------------------------------

function plot_surface_so3_arrow(S,data,control)
	[n,m] = size(data);
	[ncp,mcp] = size(control);
	[ns,ms,~,~] = size(S);
	s_int = (ns./(n-1)); 		% number of points between two interpolation points
	s_cp  = (s_int-1)/3; 			% sampling between two control points
	[dim1,dim2] = size(data{1,1});
	
	% Points
	for i = 1:n-1
	for j = 1:m-1
		for k = 1:s_int  % Sampling in x
		for l = 1:s_int  % Sampling in y
			draw_so3_arrow(reshape(S((i-1)*s_int + k,(j-1)*s_int + l,:,:),[dim1,dim2]),'normal',[1.5*((i-1)*(s_int-1) + k-1) , 1.5*((j-1)*(s_int-1) + l-1), 0]);
		end
		end
	end
	end
	
	% Data points
	for i = 1:n;
	for j = 1:m;
		draw_so3_arrow(data{i,j},'interp',[1.5*(s_int-1)*(i-1), 1.5*(s_int-1)*(j-1), 0]);
	end
	end
	
	% Control points
	for i = 1:ncp;
	for j = 1:mcp;
		draw_so3_arrow(control{i,j},'control',[1.5*s_cp*(i-1), 1.5*s_cp*(j-1), 0]);
	end
	end
end
