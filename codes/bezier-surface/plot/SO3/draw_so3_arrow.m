% FUNCTION draw_SO3_ARROW(x,type): 
% 		 Plots the SO3 object as arrows.
% ------------------------------------------------------------
% This file is part of the project "C1 bezier paths on surfaces"
% and is intended in plotting the surface of Bezier for SO3.
%
% INPUT: x		:	The SO(n) object as a matrix NxN.
% 		 type 	:	[opt] type of data to draw
% 						- interp (draw thicker lines)
% 						- control (draw medium lines)
% 						- normal (default).
%
% OUTPUT: A plots the SO(n) object.
% ------------------------------------------------------------
% Initial author: Pierre-Yves Gousenbourger
% Versions
% 	20/07/2015: first version.
% ------------------------------------------------------------

function draw_so3_arrow(x,varargin)
	assert(length(size(x)) == 2,'An SO(n) object must be a matrix');
	assert(size(x,1) == size(x,2),'The SO(n) matrix must be square');
	%if nargin < 2
		%type = 'normal'
	%end
	
	% Parsing parameters
	p = inputParser;
	defaultStart 	= [0 0 0];
	defaultType  	= 'normal';
	expectedTypes 	= {'normal','control','interp'};
	
	addRequired(p,'x',@ismatrix);
	addOptional(p,'type',defaultType,@(y) any(validatestring(y,expectedTypes)));
	addOptional(p,'start',defaultStart,@isnumeric);
	
	parse(p,x,varargin{:});
	
	x 		= p.Results.x;
	type 	= p.Results.type;
	s       = p.Results.start;
	
	
	% Function
	switch type
	case 'normal'
		quiver3(s(1),s(2),s(3),x(1,1),x(2,1),x(3,1),'b','LineWidth',2);
		hold on;
		quiver3(s(1),s(2),s(3),x(1,2),x(2,2),x(3,2),'r','LineWidth',2);
		quiver3(s(1),s(2),s(3),x(1,3),x(2,3),x(3,3),'g','LineWidth',2);
	case 'control'
		quiver3(s(1),s(2),s(3),x(1,1),x(2,1),x(3,1),'--b','LineWidth',2);
		hold on;
		quiver3(s(1),s(2),s(3),x(1,2),x(2,2),x(3,2),'--r','LineWidth',2);
		quiver3(s(1),s(2),s(3),x(1,3),x(2,3),x(3,3),'--g','LineWidth',2);
    case 'interp'
		quiver3(s(1),s(2),s(3),x(1,1),x(2,1),x(3,1),'b','LineWidth',4);
		hold on;
		quiver3(s(1),s(2),s(3),x(1,2),x(2,2),x(3,2),'r','LineWidth',4);
		quiver3(s(1),s(2),s(3),x(1,3),x(2,3),x(3,3),'g','LineWidth',4);
    otherwise error('Wrong type');
    end
    axis equal
end
