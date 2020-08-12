% FUNCTION LOG_SO3(X,Y): 
% 		Computes the logarithmic map on the orthogonal group
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
function v = log_so3(x,y)
    v     = x;
    
    if isa(x,'cell')
        for i=1:length(x)
            v{i}     = x{i}*logm(x{i}'*y{i});
%             xx = x{i}
%             yy = y{i}
%             xy = x{i}'*y{i}
%             pause
        end
    elseif isa(x,'double')
        for i=1:size(x,3)
            v(:,:,i) = x(:,:,i)*logm(x(:,:,i)'*y(:,:,i));
%             xx = x(:,:,i)
%             yy = y(:,:,i)
%             xy = xx'*yy
%             pause
        end
    end
end
