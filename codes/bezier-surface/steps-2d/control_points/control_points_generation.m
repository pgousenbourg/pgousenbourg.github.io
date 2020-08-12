% FUNCTION CONTROL_POINTS_GENERATION(PB): 
% 		 Generates control points such that the surface is C^1.
% ------------------------------------------------------------
% This file is part of the project "C1 bezier paths on surfaces"
% and is intended in computing the velocity on the Bezier surface.
%
% INPUT: PB: the sturcture of the problem.
%
% OUTPUT: PB: the structure of the problem with the new control
% 		      points.
% ------------------------------------------------------------
% Versions
% 	14/07/2015: first version.
% 	27/07/2015: Running version for matrix manifolds.
% ------------------------------------------------------------

function pb = control_points_generation(pb)

	global_variables;
    
    % --------------------
    p           = pb.interp;
    n 			= pb.n;			% number of interpolation points in X.
    m 			= pb.m;			% number of interpolation points in Y.
    d	 		= 3;		 	% Dimension of the curve;
	[dim1,dim2] 	= size(p{1,1});
	
	
	% !!! to be updated
	%parTp = @(i,j,k,l,v) v;
	parTp = @(i,j,k,l,v) geo_tp(p{i,j},p{k,l},v);


	% Step 1 -- compute Z:
	% Logarithms of interpolation points to their neighbours
	% ----------------------------------------------------------
	Z = zeros(n,m,3,3,dim1,dim2);
	for i = 1:n
	for j = 1:m
		for k = 1:3
		for l = 1:3
			% Condition for the corners
			% if ( abs(2*(i+k-3)-n+1) <= n-1 ) && ( abs(2*(j+l-3)-m+1) <= m-1 )
			if (i*k > 1) && (i*k < 3*n) && (j*l > 1) && (j*l < 3*m)
				speed = geo_log(p(i,j),p(i+k-2,j+l-2));
				Z(i,j,k,l,:,:) = speed{1};
			end
		end
		end
	end
	end


	% Step 2 -- Compute the alpha
	% The coefficients of the optimization problem
	% ----------------------------------------------------------
	if exist('BiStiffCoeff.mat','file') == 2
		% Load the coefs.
		fprintf('   Stiffness coefficients already exist... ')
		coeff = load('BiStiffCoeff');
		coeff = coeff.coeff;
	else
		% Coeffs for optimization and storage
		fprintf('   Stiffness coefficients must be computed... ')
		coeff = assembleBiStiffMat;
		save('BiStiffCoeff.mat','coeff');
	end
	disp('local stiffness matrix assembled.');



	% Step 3 -- Elastop.
	% From the Z values and the coefficients, computation of the
	% left and right members of the linear system in U.
	
	% "Minus" because Z is computed reversely
	b = 	- reshape( ...
				compute_b( Z, coeff, parTp ), ...
				[n*m*3*dim1*dim2 1] );		
				
	A = @(U)  reshape( ...
				compute_A( reshape( U, [n m 3 dim1 dim2] ), coeff, parTp ), ...
				[n*m*3*dim1*dim2 1] );


	% Optimal velocity minimizing the energy on the Euclidean space
	U = pcg( A, b, 1e-6, 1000 );




	% compute control points as Exp y +/- v
	y = zeros(n,m,dim1,dim2);
	for i = 1:n
	for j = 1:m
		y(i,j,:,:) = p{i,j};
	end
	end

	%y = reshape( y, [n m 1 1 dim] );
	U = reshape( U, [n m 3 dim1,dim2] );
	v1 = reshape(U(:,:,1,:,:),[n m dim1 dim2]);
	v2 = reshape(U(:,:,2,:,:),[n m dim1 dim2]);
	v3 = reshape(U(:,:,3,:,:),[n m dim1 dim2]);
	cp(:,:,2,2,:,:) = Expo(y,zeros(size(v1)));
	cp(:,:,3,2,:,:) = Expo(y,v1);
	cp(:,:,1,2,:,:) = Expo(y,- v1);
	cp(:,:,2,3,:,:) = Expo(y,v2);
	cp(:,:,2,1,:,:) = Expo(y,- v2);
	cp(:,:,3,3,:,:) = Expo(y,v3);
	cp(:,:,1,3,:,:) = Expo(y,- v3 + 2*v2);
	cp(:,:,3,1,:,:) = Expo(y,- v3 + 2*v1);
	cp(:,:,1,1,:,:) = Expo(y,v3 - 2*v2 - 2*v1);

	% Cp is made of [n,m,3,3,dim1,dim2] corresponding to:
	% 	n: index x of the interp
	%   m: index y of the interp
	% 	3,3: around the interp
	% 	dim1,dim2: dimension of the point.

	% Reorder this into control points. There is too much control points
	% because fictive control points around the borders are also computed.
	d = 3; % degree of the curve
	bb = cell(n*d,m*d);
	for i=1:n;
	for j=1:m;
		
		bb{(i-1)*d+1,(j-1)*d+1} = reshape( cp(i,j,1,1,:,:),[dim1,dim2]);
		bb{(i-1)*d+2,(j-1)*d+1} = reshape( cp(i,j,2,1,:,:),[dim1,dim2]);
		bb{(i-1)*d+3,(j-1)*d+1} = reshape( cp(i,j,3,1,:,:),[dim1,dim2]);
		bb{(i-1)*d+1,(j-1)*d+2} = reshape( cp(i,j,1,2,:,:),[dim1,dim2]);
		bb{(i-1)*d+2,(j-1)*d+2} = reshape( cp(i,j,2,2,:,:),[dim1,dim2]);
		bb{(i-1)*d+3,(j-1)*d+2} = reshape( cp(i,j,3,2,:,:),[dim1,dim2]);
		bb{(i-1)*d+1,(j-1)*d+3} = reshape( cp(i,j,1,3,:,:),[dim1,dim2]);
		bb{(i-1)*d+2,(j-1)*d+3} = reshape( cp(i,j,2,3,:,:),[dim1,dim2]);
		bb{(i-1)*d+3,(j-1)*d+3} = reshape( cp(i,j,3,3,:,:),[dim1,dim2]);
		
	end
	end


	%% Visualise
	%controlPoints = reshape( permute( cp, [3 1 4 2] ), 3*[n m] );
	%figure
	%surf( controlPoints );
	%hold on;
	%for i = 1:size(controlPoints,1)
	%for j = 1:size(controlPoints,2)
	%if mod(i+1,3) == 0 && mod(j+1,3) == 0
	%plot3(j,i,controlPoints(i,j),'.r','MarkerSize',30);
	%else
	%plot3(j,i,controlPoints(i,j),'.','MarkerSize',30);
	%end
	%end
	%end

	%error()
	%% Structure update
	pb.d 		= d;
	pb.control  = bb(2:end-1,2:end-1);


end



function y = Expo(p,v)
	global_variables;
	
	[n,m,dim1,dim2] = size(p);
	y = zeros(size(p));
	
	for i = 1:n
	for j = 1:m
		pp = reshape(p(i,j,:,:),[dim1,dim2]);
		vv = reshape(v(i,j,:,:),[dim1,dim2]);
		y(i,j,:,:) = geo_exp(pp,vv);
	end
	end
end
