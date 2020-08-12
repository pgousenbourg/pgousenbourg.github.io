% FUNCTION DIST_SPHERE_GEO(X,Y): 
% 		 Evaluates the distance between two points X and Y on
% 		 the unit sphere.
% ------------------------------------------------------------
% This file is part of the project "C1 bezier paths on surfaces"
% 
% INPUT: 	X : A point on the unit sphere of size n 
% 				[1 x n x number_of_elements]
% 			Y : Another point on the unit sphere of size n
%
% OUTPUT: 	D : the distance between X and Y (scalar)
% ------------------------------------------------------------
% Versions
% 	18/06/2015: first version.
% ------------------------------------------------------------

function d = dist_sphere_geo(x,y)
	if isa(x,'cell') && isa(y,'cell')
		d = zeros(length(x),1);
        for i=1:length(x)
            d(i) = acos(dot(x{i},y{i}) );
        end
    elseif isa(x,'double') && isa(v,'double')
		d = zeros(size(x,3),1);
        for i=1:size(x,3)
            d(i) = acos(dot(x(:,:,i),y(:,:,i)));
        end
    else
        error('x and v must be same type');
    end
end
