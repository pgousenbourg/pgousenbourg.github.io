% FUNCTION TP_SO3(X,Y,V): 
% 		Parallel transport of a vector V from X to Y on the
%		orthogonal group.
% ------------------------------------------------------------
% This file is part of the project "C1 bezier paths on surfaces"
% 
% INPUT: 	X : A point.
% 			Y : Another point.
% 			V : Vector on the tangent space of X to transport.
%
% OUTPUT: 	S : The transported vector.
% ------------------------------------------------------------
% Author: Pierre-Yves Gousenbourger
% ------------------------------------------------------------
% Versions
% 	19/03/2014: first version.
% 	18/06/2015: header changed.
% ------------------------------------------------------------

function s = tp_so3(x,y,v)
    s   = x;
    if isa(x,'cell')
        for i=1:length(x)
            s{i} = y{i}*x{i}'*v{i};
            %s{i} = v{i};
        end
    elseif isa(x,'double')
		%v = squeeze(v);
        for i=1:size(x,3)
			yy = y(:,:,i);
			xx = x(:,:,i);
			vv = v(:,:,i);
            s(:,:,i) = yy*xx'*vv;
            %pause
        end
    end
end
