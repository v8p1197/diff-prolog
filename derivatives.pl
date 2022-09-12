%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                          %
%  diff(Y, X, D) means "the derivative of Y with respect to (wrt) X is D"  %
%                                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The derivative of a constant C is 0
diff(C, _, 0) :- number(C).

% The derivative of x wrt x is 1
diff(X, X, 1).

% The derivative of y wrt x is 0 if Y is not a function of X, and Y is not X 
diff(Y, X, 0) :- atom(Y), Y \== X.

% The derivative of "f(x) + g(x)" wrt x is "f'(x) + g'(x)"
diff(F+G, X, DF + DG) :-
	diff(F, X, DF), diff(G, X, DG).	

% The derivative of "f(x) - g(x)" wrt x is "f'(x) - g'(x)"
diff(F-G, X, DF - DG) :-
	diff(F, X, DF), diff(G, X, DG).

% The derivative of "f(x) * g(x)" wrt x is "f'(x)g(x) + f(x)g'(x)"
diff(F*G, X, DF*G+F*DG) :-
	diff(F, X, DF), diff(G, X, DG).

% The derivative of "f(x) / g(x)" wrt x is "frac{f'(x)*g(x) - f(x)*g'(x)}{g(x)^2}"
diff(F/G, X, (DF*G-F*DG)/(G^2)) :-
	diff(F, X, DF), diff(G, X, DG).

% The derivative of "f(x)^p" wrt x is "p * f(x)^(p-1) * f'(x)"
diff(F^P, X, P*F^(P-1)*DF) :-
	diff(F, X, DF), number(P).
