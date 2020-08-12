% FUNCTION LOG_SPHERE(X,Y): 
% 		Computes the logarithmic map on the unif sphere
% 		from X to Y.
% ------------------------------------------------------------
% This file is part of the project "C1 bezier paths on surfaces"
% 
% INPUT: 	X : A point
% 			Y : Another point
%
% OUTPUT: 	V : The initial velocity at T_x M
% ------------------------------------------------------------
% Authors: Pierre-Yves Gousenbourger
% ------------------------------------------------------------
% Versions
% 	19/03/2014: first version.
% 	18/06/2015: header changed.
% ------------------------------------------------------------
function v = log_sphere(x,y)
    v     = x;
    
    if isa(x,'cell')
        normv = zeros(size(x));
        %size(normv)
        dim   = length(x{1});
        for i=1:length(x)
			x{i} = reshape(x{i},1,dim);
			y{i} = reshape(y{i},1,dim);
            normv(i) = acos(dot(x{i},y{i}));
            if abs(normv(i)) < 1e-7
				v{i} 	= zeros(size(x{i}));
			else
				v{i}     = (((eye(dim) - x{i}'*x{i})*y{i}'*normv(i))./sin(normv(i)))';
			end
        end
    elseif isa(x,'double')
        normv = zeros(size(x));
        dim   = size(x,2);
        for i=1:size(x,1)
			xx = reshape(x(i,:),1,dim);
			yy = reshape(y(i,:),1,dim);
            nv = acos(dot(xx,yy));
            if abs(nv) < 1e-7
				v(i,:) 	= zeros(size(xx));
			else
				v(i,:)  = reshape((((eye(dim) - xx'*xx)*yy'*nv)./sin(nv)),1,dim);
			end
        end
    end
end
