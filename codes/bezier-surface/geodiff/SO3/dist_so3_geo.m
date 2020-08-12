% FUNCTION DIST_SO3_GEO(X,Y): 
% 		 Evaluates the distance between two points X and Y on
% 		 the manifold orthogonal matrices.
% ------------------------------------------------------------
% This file is part of the project "C1 bezier paths on surfaces"
% 
% INPUT: 	X : A point
% 			Y : Another point
%
% OUTPUT: 	D : the distance between X and Y.
% ------------------------------------------------------------
% Versions
% 	18/06/2015: first version.
% ------------------------------------------------------------

function d = dist_so3_geo(x,y)
	if isa(x,'cell')
        for i=1:length(x)
			d = zeros(length(x),1);
            d(i)     = norm(logm(x{i}'*y{i}),'fro');
        end
    elseif isa(x,'double')
        for i=1:size(x,3)
			d = zeros(size(x,3),1);
            d(i) = norm(logm(x(:,:,i)'*y(:,:,i)),'fro');
        end   
    else
        error('x and v must be same type');
    end
end
