% Generation of data points
function data = data_points(manifold,type)
% -------------
% euclidean
% -------------
    switch manifold
        case 'euclidean'
            switch type
                case 'simple'
                    data{1,1} = [0 0 1];
                    data{1,2} = [0 1 0];
                    data{2,1} = [1 0 1];
                    data{2,2} = [1 1 0];
                case 'simple-2h'
                    data{1,1} = [0 0 0];
                    data{1,2} = [0 1 3];
                    data{2,1} = [1 0 1];
                    data{2,2} = [1 1 1];
                    data{3,1} = [2 0 0];
                    data{3,2} = [2 1 0];
                case 'random-h'
					n = 5;
					m = 3;
					data = cell(n,m);
					for i=1:n
					for j=1:m
						data{i,j} = [i-1,j-1,randn(1)];
					end
					end
				case 'ring'
					n = 15;
					m = 2;
					s = linspace(0,n-1,n);
					x = cos(s*2*pi/(n-1));
					z = sin(s*2*pi/(n-1));
					
					data = cell(n,m);
					for i = 1:n
					for j = 1:m
						data{i,j} = [x(i) j-1 z(i)];
					end			
					end
				case 'random'
					m = 6;
					n = 7;
					data = cell(m,n);
					for i=1:m
					for j=1:n
						data{i,j} = [i-1,j-1,randn(1)];
					end
					end
                otherwise; error(['There is no such type for the ',manifold,' manifold: ',type]);
            end
            
            
            
% -------------
% sphere
% -------------
        case 'sphere'
            switch type
                case 'easy'
					% Parameters
					%phi     = [	2.4*pi/3    pi/12 ; ...
								  %pi/2   pi/4]; 
					%theta   = [	  0      0   ; ...
								%2*pi/3   pi/2 ] + 13*pi/12;
								
					phi     = [	pi/12    , pi/8 ; ...
								2*pi/3   , pi/2 ;
								2.6*pi/3   , 1.5*pi/2]; 
					theta   = [	0  ,  4*pi/7  ; ...
								0  ,  2*pi/3   ;
								0  ,  2*pi/3] + 13*pi/12;
					x       = cos(theta).*sin(phi); y = sin(theta).*sin(phi); z = cos(phi);
					
					% Data
					for i = 1:3
					for j = 1:2
						data{i,j} = [x(i,j) y(i,j) z(i,j)];
					end
					end		
				case 'simple_patch'
					% Parameters
					phi     = [	2.4*pi/3    pi/12 ; ...
								  pi/2   pi/4]; 
					theta   = [	  0      0   ; ...
								2*pi/3   pi/2 ] + 13*pi/12;
					x       = cos(theta).*sin(phi); y = sin(theta).*sin(phi); z = cos(phi);
					
					% Data
					for i = 1:2
					for j = 1:2
						data{i,j} = [x(i,j) y(i,j) z(i,j)];
					end
					end
					
				case 'random'
					n = 10;
					m = 10;
					data = cell(n,m);
					for i = 1:n;
					for j = 1:m;
						a = randn(1,3);
						data{i,j} = a./norm(a);
					end
					end
				case 'striewski'
					%The control points should be the only thing that need to be changed.
					data{1,1} = [-0.347707,-0.193504, 0.917418];
					data{1,2} = [0.056020,-0.472401, 0.879602];
					data{1,3} = [0.331498,-0.249399, 0.909895];
					data{2,1} = [-0.832489,-0.542993, -0.110098];
					data{2,2} = [0.197890,-0.943051, 0.267386];
					data{2,3} = [0.878371,-0.423024, 0.222522];
					data{3,1} = [-0.665606,-0.300103, -0.683306];
					data{3,2} = [0.178489,-0.897143, -0.404074];
					data{3,3} = [0.793404,-0.382106, -0.473820];
				otherwise; error(['There is no such type for the ',manifold,' manifold: ',type]);
			end
            
            
            
% -------------
% so3
% -------------
        case 'SO3'
            switch type
                case 'simple'
                    data{1,1} = [1 0 0 ; 0 1 0 ; 0 0 1];
                    data{1,2} = [0 0 1 ; 1 0 0 ; 0 1 0];
                    data{2,1} = [0 1 0 ; 0 0 1 ; 1 0 0];
                    data{2,2} = data{1,1};
                    %a = sqrt(2)/2;
                    %data{2,2} = [a a 0 ; a -a 0 ; 0 0 -1];
                    %clear a;
                case 'simple-2h'
					data{1,1} = [1 0 0 ; 0 1 0 ; 0 0 1];
                    data{1,2} = [0 0 1 ; 1 0 0 ; 0 1 0];
                    data{2,1} = [0 1 0 ; 0 0 1 ; 1 0 0];
                    data{2,2} = data{1,1};
                    data{3,1} = data{1,2};
                    data{3,2} = data{2,1};
                case 'random'
					n = input('How many patches in x?');
					m = input('How many patches in y?');
					for i = 1:n+1
					for j = 1:m+1
						data{i,j} = SO3matrix();
					end
					end
				 case 'torus'
					data = cell(4,4);
					data{1,1} = [ 1  0  0 ;  0  1  0 ;  0  0  1]; 	% A
					data{2,1} = [ 0  1  0 ; -1  0  0 ;  0  0  1];  	% B
					data{3,1} = [-1  0  0 ;  0 -1  0 ;  0  0  1]; 	% C
					data{4,1} = [ 0 -1  0 ;  1  0  0 ;  0  0  1]; 	% D
					data{1,2} = [ 0  0 -1 ;  0  1  0 ;  1  0  0]; 	% E
					data{2,2} = [ 0  1  0 ;  0  0  1 ;  1  0  0];  	% F
					data{3,2} = [ 0  0  1 ;  0 -1  0 ;  1  0  0]; 	% G
					data{4,2} = [ 0 -1  0 ;  0  0 -1 ;  1  0  0]; 	% H
					data{1,3} = [-1  0  0 ;  0  1  0 ;  0  0 -1]; 	% I
					data{2,3} = [ 0  1  0 ;  1  0  0 ;  0  0 -1]; 	% J
					data{3,3} = [ 1  0  0 ;  0 -1  0 ;  0  0 -1]; 	% K
					data{4,3} = [ 0 -1  0 ; -1  0  0 ;  0  0 -1]; 	% L
					data{1,4} = [ 0  0  1 ;  0  1  0 ; -1  0  0]; 	% M
					data{2,4} = [ 0  1  0 ;  0  0 -1 ; -1  0  0]; 	% N
					data{3,4} = [ 0  0 -1 ;  0 -1  0 ; -1  0  0]; 	% O
					data{4,4} = [ 0 -1  0 ;  0  0  1 ; -1  0  0]; 	% P
                % To fill
                otherwise; error(['There is no such type for the ',manifold,' manifold: ',type]);
            end
            
            
            
% -------------
% shapes
% -------------
% For this, we will load a shapes structure containing 25x2D shapes.
%       shapes.shape_name: {1x25 cell} (to be removed)
%       shapes.name      : {25x1 cell} (to be defined)
%       shapes.Y         : [25x100 double]
%       shapes.X         : [25x100 double]
%       shapes.Theta     : [25x100 double]
%       shapes.Thetanew  : [25x100 double]
%       shapes.i         : 25
        case 'shapes'
            switch type
                case 'test' 
					% To do
					
                otherwise; error(['There is no such type for the ',manifold,' manifold: ',type]);
            end
            


% -------------
% shape_plane
% -------------
        case 'shape_plane'
			% Angles between 0 and 2*pi.
            switch type
                case 'lengths'
					data{1,1} = [1 1 pi];
                    data{1,2} = [1.5 1.5 pi];
                    data{2,1} = [1.5 1.5 pi];
                    data{2,2} = [2 2 pi];
                case 'angles'
					data{1,1} = [1 1 pi];
                    data{1,2} = [1 1 pi/4];
                    data{2,1} = [1 1 3*pi/4];
                    data{2,2} = [1 1 pi/2];
                case 'simple'
                    data{1,1} = [1 1 pi];
                    data{1,2} = [1 1 pi/2];
                    data{2,1} = [2 2 pi];
                    data{2,2} = [2 2 pi/2];
                case 'squares-easy'
                    data{1,1} = [1 1 1 1 pi pi pi];
                    data{1,2} = [2 2 2 2 pi/2 pi/2 pi/2];
                    data{2,1} = [1 1 1 1 pi/2 pi/2 pi/2];
                    data{2,2} = [2 2 2 2 pi/2 pi/2 pi/2];
                case 'squares'
                    data{1,1} = [1 1 1 1 pi/2 pi/2 pi/2];
                    data{1,2} = [2 2 2 2 pi/2 pi/2 pi/2];
                    data{2,1} = [1 1 1 1 pi/2 pi/2 pi/2];
                    data{2,2} = [2 2 2 2 pi/2 pi/2 pi/2];
                case 'stairs'
                    data{1,1} = [1 1 1 1 pi pi pi];
                    data{1,2} = [1 1 1 1 pi/2 3*pi/2 pi/2];
                    data{2,1} = [1 1 1 1 pi/2 3*pi/2 pi/2];
                    data{2,2} = [2 2 2 2 pi/2 3*pi/2 pi];
                case 'squares-2h-easy'
                    data{1,1} = [1 1 1 1 pi pi pi];
                    data{1,2} = [1 1 1 1 pi/2 pi/2 pi/2];
                    data{2,1} = [1 1 1 1 pi/2 pi/2 pi/2];
                    data{2,2} = [2 2 2 2 pi/2 pi/2 pi/2];
                    data{3,1} = [1 1 1 1 pi/2 pi/2 pi/2];
                    data{3,2} = [1 1 1 2 pi/2 pi pi];
                case 'squares-2h'
                    data{1,1} = [1 1 1 1 pi pi pi];
                    data{1,2} = [1 1 1 1 2*pi/3 pi/3 2*pi/3];
                    data{2,1} = [1 1 1 1 pi/2 pi/2 pi/2];
                    data{2,2} = [2 2 2 2 pi/2 pi/2 pi/2];
                    data{3,1} = [1 1 1 1 pi/3 2*pi/3 pi/3];
                    data{3,2} = [1 1 1 2 pi/2 pi pi];
                case 'stairs-2h'
                    data{1,1} = [1 1 1 1 pi pi pi];
                    data{1,2} = [1 1 1 1 pi/2 3*pi/2 pi/2];
                    data{2,1} = [1 1 1 1 pi/2 3*pi/2 pi/2];
                    data{2,2} = [2 2 2 2 pi/2 3*pi/2 pi];
                    data{3,1} = [2 2 2 2 pi/2 3*pi/2 pi/2];
                    data{3,2} = [1 1 1 1 pi/2 3*pi/2 pi];
                case 'random'
					n = 4;
					m = 3;
					
					data = cell(n,m);
					for i = 1:n
					for j = 1:m
						data{i,j} = [1 1 1 1 pi/2 pi/2 pi/2].*(1+0.8*rand(1,7));
					end
					end
					
				case 'true_shapes_1x2'
					shapes = load('plot/samples/open_shapes.mat');
					shapes = shapes.new_shapes; % this is a tensor [discr x 2 x #shapes]
					
					myshape = shapes(:,:,1)'; data{1,1} = xy2la(myshape(:))';
					myshape = shapes(:,:,5)'; data{1,2} = xy2la(myshape(:))';
					myshape = shapes(:,:,2)'; data{2,1} = xy2la(myshape(:))';
					myshape = shapes(:,:,3)'; data{2,2} = xy2la(myshape(:))';
					myshape = shapes(:,:,5)'; data{3,1} = xy2la(myshape(:))';
					myshape = shapes(:,:,6)'; data{3,2} = xy2la(myshape(:))';
					
				case 'true_shapes_1x3'
					shapes = load('plot/samples/open_shapes.mat');
					shapes = shapes.new_shapes; % this is a tensor [discr x 2 x #shapes]
					
					myshape = shapes(:,:,1)'; data{1,1} = xy2la(myshape(:))';
					myshape = shapes(:,:,4)'; data{1,2} = xy2la(myshape(:))';
					myshape = shapes(:,:,2)'; data{2,1} = xy2la(myshape(:))';
					myshape = shapes(:,:,3)'; data{2,2} = xy2la(myshape(:))';
					myshape = shapes(:,:,5)'; data{3,1} = xy2la(myshape(:))';
					myshape = shapes(:,:,6)'; data{3,2} = xy2la(myshape(:))';
					myshape = shapes(:,:,7)'; data{4,1} = xy2la(myshape(:))';
					myshape = shapes(:,:,8)'; data{4,2} = xy2la(myshape(:))';					
					
					%error
                otherwise; error(['There is no such type for the ',manifold,' manifold: ',type]);
            end
% -------------
% shape_closed
% -------------
        case 'shape_closed'
			% Angles between 0 and 2*pi.
            switch type
                case 'squares'
                    data{1,1} = xy2v(la2xy_closed([1 1 1 1 pi/2 pi/2 pi/2 pi/2]));
                    data{1,2} = xy2v(la2xy_closed([2 2 2 2 pi/2 pi/2 pi/2 pi/2]));
                    data{2,1} = xy2v(la2xy_closed([1 1 1 1 pi/2 pi/2 pi/2 pi/2]));
                    data{2,2} = xy2v(la2xy_closed([3 3 3 3 pi/2 pi/2 pi/2 pi/2]));
                    size(data{1,1})
                case 'triangles'
                    data{1,1} = xy2la_closed([ ]);
                    data{1,2} = xy2la_closed([ ]);
                    data{2,1} = xy2la_closed([ ]);
                    data{2,2} = xy2la_closed([ ]);
                    
                otherwise; error(['There is no such type for the ',manifold,' manifold: ',type]);
            end
            
        otherwise; error('Wrong manifold');
    end
end
