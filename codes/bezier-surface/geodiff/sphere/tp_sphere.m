% FUNCTION TP_SPHERE(X,Y,V): 
% 		Parallel transport of a vector V from X to Y on the
%		unit sphere.
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
function s = tp_sphere(x,y,t)
    v   = log_sphere(x,y);
    u   = v;
    s   = v;
    if isa(x,'cell')
        dim = length(v{1});
        for i=1:length(x)
			if abs(norm(v{i})) < 1e-7
				s{i} = t{i};
			else
				u = v{i}./norm(v{i});
				s{i} = -x{i}.*(sin(norm(v{i})).*(u*t{i}')) + ...
					u.*(cos(norm(v{i})).*(u*t{i}')) + ((eye(dim) - u'*u)*t{i}')';
			end
        end
    elseif isa(x,'double')
        dim = size(v,2);
        for i = 1:size(x,1)
			if abs(norm(v(i,:))) < 1e-7
				s(i,:) = t(i,:);
			else
				xx = reshape(x(i,:),3,1);
				yy = reshape(y(i,:),3,1);
				tt = reshape(squeeze(t),size(xx));
				vv = reshape(v(i,:),3,1);
				nv = norm(vv);
				uu = vv./nv;
				s(i,:) = reshape(-(xx*sin(nv))*(uu'*tt) + ...
					(uu*cos(nv))*(uu'*tt) + tt - uu*(uu'*tt),1,3);%((eye(dim) - u'*u)*t(i,:)')'
			end
        end
    end
end
