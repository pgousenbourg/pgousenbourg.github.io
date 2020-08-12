%% BERN -
%       Computation of Bernstein polynomials evaluated at t
%
%  INPUT: n,k,t
% 
%  OUTPUT: the value of the Bernstein polynomial k of order n at time t.

function b = bern(n,k,t)
	b = nchoosek(n,k)*(t^k)*((1-t)^(n-k));
end
