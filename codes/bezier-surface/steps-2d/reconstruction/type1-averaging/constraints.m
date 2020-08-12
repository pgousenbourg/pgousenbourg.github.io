function [c,ceq] = constraints(x)
%Used in fmincon. This constrains the optimization to a sphere.

c = 0;             % Compute nonlinear inequalities at x.
ceq = norm(x)-1;   % Compute nonlinear equalities at x.