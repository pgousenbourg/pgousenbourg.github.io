% FUNCTION EXP_S03(X,V,T): 
% 		 Computes the exponential map from a point X on the
% 		 SO3 manifold, with initial velocity V and at time T.
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
function y = exp_so3(x,v,t)
    if nargin < 3
        t = 1;
    end
    y = x;
    if isa(x,'cell')
        for i=1:length(x)
            y{i} = x{i}*expm(t*x{i}'*v{i});
        end
    elseif isa(x,'double')
        for i=1:size(x,3)
            y(:,:,i) = x(:,:,i)*expm(t*x(:,:,i)'*v(:,:,i));
        end
    end
end
