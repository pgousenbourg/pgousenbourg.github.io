% DE_CASTELJAU_RECTANGLE
%       Computes the Bezier surface based on the Bezier points b,
%       evaluated at time (t1,t2) in [0,1]. The degree (d) of the Bezier
% 		surface is given in entry.
% 
% Input: b       : the control points (cell d+1 x d+1).
%        t1,t2   : the evaluated time on the square [0,1]x[0,1].
% 		 d 		 : the degree of the curve.
%
% Output: the B�zier curve, in a matrix [dim1 x dim2]

function y = de_casteljau_rectangle(b,d,t1,t2)
    global_variables;
    assert(size(b,1) <= d+1,'  The degree of the curve is too high for the number of control points provided');

	x = b;
	
	for k = 1:d
		root  = x(1:end-1,1:end-1); 	% Root = Bottom, left
		br 	  = x(2:end,1:end-1);		% Bottom, right
		ul    = x(1:end-1,2:end);		% Up, left
		ur    = x(2:end,2:end);			% Up, right


		va 	  = cellfun(@(x) (x.*((1-t2)*t1)), myLog(root,br),'UniformOutput',false);
		vb 	  = cellfun(@(x) (x.*(t2*(1-t1))), myLog(root,ul),'UniformOutput',false);
		vc 	  = cellfun(@(x) (x.*(t1*t2)), myLog(root,ur),'UniformOutput',false);
		
		x = myExp(root,cellfun(@(x,y,z) (x + y + z), va, vb, vc, 'UniformOutput',false));
	end
	
	% Verify that size x = 1
	assert(size(x,1) == 1 && size(x,2) == 1);
	
	y = squeeze(x{:});
end

% x = start point
% y = end point
function v = myLog(x,y);
	global_variables;
	
	v = x;
    if isa(x,'cell') && isa(y,'cell')
        for i = 1:size(x,1)
			for j = 1:size(x,2)
				v(i,j) = geo_log(x(i,j),y(i,j));
			end
		end
    elseif isa(x,'double') && isa(y,'double')
        for i = 1:size(x,1)
			for j = 1:size(x,2)
				v(i,j,:) = geo_log(x(i,j,:),y(i,j,:));
			end
		end
    else
        error('x and y must be same type');
    end
end


% x = start point
% v = velocity
function y = myExp(x,v)
	global_variables;
	y = x;
	if isa(x,'cell') && isa(y,'cell')
		for i = 1:size(x,1)
			for j = 1:size(x,2)
				y(i,j) = geo_exp(x(i,j),v(i,j));
			end
		end
	elseif isa(x,'double') && isa(y,'double')
		for i = 1:size(x,1)
			for j = 1:size(x,2)
				y(i,j,:,:) = geo_exp(x(i,j,:,:),v(i,j,:,:));
			end
		end
	end
end
