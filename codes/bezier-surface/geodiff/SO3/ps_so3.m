% FUNCTION PS_SO3(S,T,X,Y): 
% 		Computes the scalar product on the orthogonal group.
% ------------------------------------------------------------
% This file is part of the project "C1 bezier paths on surfaces"
% 
% INPUT: 	S : A point on the tangent space in X.
% 			T : A point on the tangent space in Y.
% 			X : [not mandatory] A point.
% 			Y : [not mandatory] Another point.
%
% OUTPUT: 	P : The scalar product between S and Y.
% ------------------------------------------------------------
% Author: Pierre-Yves Gousenbourger
% ------------------------------------------------------------
% Versions
% 	19/03/2014: first version.
% 	18/06/2015: header changed.
% ------------------------------------------------------------

function p = ps_so3(s,t,x,y)
    if nargin==3; x = 0; y = 0; end
    assert(size(s,1) == size(t,1) && size(s,2) == size(t,2));
    
    p = zeros(length(s),1);
    n = length(s);
    
    if isa(s,'cell') && isa (t,'cell') && isa(x,'cell') && isa(y,'cell')  
        for i=1:n; ox = x{i}'*s{i}; oy = y{i}'*t{i}; p(i) = trace(ox'*oy); end
    elseif isa(s,'double') && isa(t,'double') && isa(x,'double') && isa(y,'double')
        for i = 1:n; ox = s(:,:,i)'*x(:,:,i); oy = y(:,:,i)'*t(:,:,i); p(i) = trace(ox*oy); end;
    end
end
