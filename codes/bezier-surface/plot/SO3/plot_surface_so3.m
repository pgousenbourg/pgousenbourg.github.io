% FUNCTION PLOT_SURFACE_SO3(S,data,control,object): 
% 		 Plots the surface S of SO3 objects.
% ------------------------------------------------------------
% This file is part of the project "C1 bezier paths on surfaces"
% and is intended in plotting the surface of Bezier for SO3.
%
% INPUT: S		:	The surface as S(t1,t2,3,3).
% 		 data 	:	The interpolation points as a cell{t1,t2}.
% 		 control: 	The control points as a cell{t1,t2}.
% 		 object :   The type of object needed (car for instance).
%
% OUTPUT: A plot of the surface.
% ------------------------------------------------------------
% Initial author: Pierre-Yves Gousenbourger
% Versions
% 	28/07/2015: first version.
% ------------------------------------------------------------

function plot_surface_so3(S,data,control,object)
	
	% Useful sizes
	[n,m] 		= size(data);
	[ncp,mcp] 	= size(control);
	[ns,ms,~,~] = size(S);
	s_int 		= (ns./(n-1)); 			% number of points between two interpolation points
	s_cp  		= (s_int-1)/3; 			% sampling between two control points
	[dim1,dim2] = size(data{1,1});
	
	% ------------------------------------------------------------------
	%%  Object detection
	% ------------------------------------------------------------------
	switch object
	case 'arrow'
		D = 1.5;
		fplot	  = @(x, type, place) draw_so3_arrow(x,type, place);
	case 'ellipsoid'
       [Xs,Ys,Zs] = ellipsoid(0, 0, 0, 1, .5, .5, 10);
       D = 3;
       fplot 	  = @(rot, type, place) draw_so3_ellipse(rot,Xs,Ys,Zs,type,place);
	case 'car'
		toy = model3d('plot/SO3/3Dobjects/Toy car N130810.3DS');
		D = 450;
		fplot 	  = @(rot, type, place) draw_so3_object(rot,toy,type,place);
	case 'satellite'
		toy = model3d('plot/SO3/3Dobjects/MGSatellite.3ds');
		D = 70;
		fplot 	  = @(rot, type, place) draw_so3_object(rot,toy,type,place);
	case 'helicopter'
		toy = model3d('plot/SO3/3Dobjects/Helicopter N080708.3ds');
		D = 100;
		fplot 	  = @(rot, type, place) draw_so3_object(rot,toy,type,place);	
	otherwise
		error('No such object available');
	end
	
	
	% ------------------------------------------------------------------
	%% FIGURES
	% ------------------------------------------------------------------
	
	
	% ----- Curve -----
	
	% Points
	for i = 1:n-1
	for j = 1:m-1
		for k = 1:s_int  % Sampling in x
		for l = 1:s_int  % Sampling in y
			fplot(reshape(S((i-1)*s_int + k,(j-1)*s_int + l,:,:),[dim1,dim2]),'normal',[D*((i-1)*(s_int-1) + k-1) , D*((j-1)*(s_int-1) + l-1), 0]);
		end
		end
	end
	end
	
	% Data points
	for i = 1:n;
	for j = 1:m;
		fplot(data{i,j},'interp',[D*(s_int-1)*(i-1), D*(s_int-1)*(j-1), 0]);
	end
	end
	light; lighting phong;
	
	
	
	% ----- Control points -----
	%figure;
	%% Control points
	%for i = 1:ncp;
	%for j = 1:mcp;
		%fplot(control{i,j},'control',[D*s_cp*(i-1), D*s_cp*(j-1), 0]);
	%end
	%end
	
	%% Points
	%for i = 1:n-1
	%for j = 1:m-1
		%for k = 1:s_int  % Sampling in x
		%for l = 1:s_int  % Sampling in y
			%fplot(reshape(S((i-1)*s_int + k,(j-1)*s_int + l,:,:),[dim1,dim2]),'normal',[D*((i-1)*(s_int-1) + k-1) , D*((j-1)*(s_int-1) + l-1), 0]);
		%end
		%end
	%end
	%end
	
	%% Data points
	%for i = 1:n;
	%for j = 1:m;
		%fplot(data{i,j},'interp',[D*(s_int-1)*(i-1), D*(s_int-1)*(j-1), 0]);
	%end
	%end
	%light; lighting phong;
end
