% bim(p, A, i, m, d): 
% 	Computes the control point b_i^m
% ------------------------------------------------------------
% This file is part of the project "C1 bezier paths on surfaces".
%
% INPUT: 	p : [cell] The interpolation points.
% 				(M x N)
%
% 			A : [matrix] a matrix defining the linear combination.
%
%			m : [int] patch
%
% 			i : [int] position of the control point within the patch.
% 				 	 	can be 0, 1, 2 or 3.
%
% 			d : [int] for the linear combination
%
% OUTPUT: 	b : [matrix] the control point.
%
% ------------------------------------------------------------
% Authors:
% 	Paul Striewski
% 	Pierre-Yves Gousenbourger
%
% Versions
% 	02/11/2015: First version.
% 	05/11/2015: Integration to the framework.
% ------------------------------------------------------------

function b = bim(p, A, i, m, d)
	
	global_variables;
	
	% Parameters
	M 	= length(p);
	op 	 = [0,0,1,1];
	pp 	 = cell(size(p));	% Projected p
	
	% Reference point.
	pref = p{m+op(i+1)};		% Closest point
	%pref = geo_map(p{m},p{m+1},0.5);	% Average
	
	xbound = max(1,m-d-1):min(M,m+d+2);
	
	% Projection on tangent space
	for k = xbound
		pp{k} = geo_log(pref,p{k}); 
	end
	
	alpha = cell(2,1);
	alpha{1} = compute_alpha(pp, A, m,   d);
	alpha{2} = compute_alpha(pp, A, m+1, d);
	
	bi = 	((3-i)/3)	.*alpha{1} ...
		+ 	(i/3)		.*alpha{2};
		
	b 	= geo_exp(pref, bi);
end
