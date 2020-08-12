% FUNCTION NORM_SO3(X): 
% 		 Computes the norm of a point X on the orthogonal group
% ------------------------------------------------------------
% This file is part of the project "C1 bezier paths on surfaces"
% 
% INPUT: 	X : A point
%
% OUTPUT: 	Y : The norm of X.
% ------------------------------------------------------------
% Author: Pierre-Yves Gousenbourger
% ------------------------------------------------------------
% Versions
% 	19/03/2014: first version.
% 	18/06/2015: header changed.
% ------------------------------------------------------------
function y = norm_so3(x)
    y = x;
    if isa(x,'cell')
       for i=1:length(x); y{i} = x{i}./norm(x{i},'fro'); end
    elseif isa(x,'double')
        for i=1:size(x,3); y(:,:,i) = x(:,:,i)./norm(x(:,:,i),'fro'); end
    end
end
