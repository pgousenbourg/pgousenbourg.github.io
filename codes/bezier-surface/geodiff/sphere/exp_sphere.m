% FUNCTION EXP_SPHERE(X,V,T): 
% 		 Computes the exponential map from a point X on the
% 		 unit sphere, with initial velocity V and at time T.
% ------------------------------------------------------------
% This file is part of the project "C1 bezier paths on surfaces"
% 
% INPUT: 	X : A point.
% 			V : A starting velocity.
% 			T : A time instant.
%
% OUTPUT: 	Y : The point reached
% ------------------------------------------------------------
% Author: Pierre-Yves Gousenbourger
% ------------------------------------------------------------
% Versions
% 	19/03/2014: first version.
% 	18/06/2015: header changed.
% ------------------------------------------------------------
function y = exp_sphere(x,v,t)
    if nargin < 3
        t = 1;
    end
    
    y = x;
    if isa(x,'cell')
        for i=1:length(x)
			if norm(v{i}) == 0
				y{i} = x{i};
			else
				y{i} = x{i}.*cos(norm(v{i}).*t) + v{i}.*(1/norm(v{i})).*sin(norm(v{i}).*t);
			end
        end
    elseif isa(x,'double')
		for i=1:size(x,1)
			if norm(v(i,:)) == 0
				y(i,:) = x(i,:);
			else
				y(i,:) = x(i,:).*cos(norm(v(i,:)).*t) + v(i,:).*(1/norm(v(i,:))).*sin(norm(v(i,:)).*t);
			end
        end
        %y = x.*cos(geo_norm(v).*t) + v.*(1./geo_norm(v)).*sin(geo_norm(v).*t);
    end
end
