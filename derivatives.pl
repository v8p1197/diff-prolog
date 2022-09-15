%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                          %
%  diff(Y, X, D) means "the derivative of Y with respect to (wrt) X is D"  %
%                                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ---------- Facts ----------

% The derivative of a constant C is 0
diff(C, _, 0) :- number(C).

% The derivative of x wrt x is 1
diff(X, X, 1).

% The derivative of y wrt x is 0 if Y is not a function of X, and Y is not X 
diff(Y, X, 0) :- atom(Y), Y \== X.

% ---------- Rules ----------

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

% ---------- Basics ----------

% POL: The derivative of "f(x)^p" wrt x is "p * f(x)^(p-1) * f'(x)"
diff(F^Q, X, Q*F^(P)*DF) :-
	diff(F, X, DF), succ(P, Q), number(P), number(Q).

% EXP: The derivative of "exp(f(x))" wrt x is "exp(f(x)) * f'(x)"
diff(e^F, X, (e^F)*DF) :-
	diff(F, X, DF).	

% SIN: The derivative of "sin(f(x))" wrt x is "cos(f(x))*f'(x)"
diff(sin(F), X, cos(F)*DF) :-
	diff(F, X, DF).

% COS: The derivative of "cos(f(x))" wrt x is "-sin(f(x))*f'(x)"
diff(cos(F), X, -sin(F)*DF) :-
	diff(F, X, DF).

% TAN: The derivative of "tan(f(x))" wrt x is the derivative of "sin(f(x))/cos(f(x))" wrt x 
diff(tan(F), X, D) :-
	diff(sin(F)/cos(F), X, D).

% COT: The derivative of "cot(f(x))" wrt x is the derivative of "cos(f(x))/sin(f(x))" wrt x 
diff(cot(F), X, D) :-
	diff(cos(F)/sin(F), X, D).

% SEC: The derivative of "sec(f(x))" wrt x is the derivative of "1/cos(f(x))" wrt x 
diff(sec(F), X, D) :-
	diff(1/cos(F), X, D).

% CSC: The derivative of "csc(f(x))" wrt x is the derivative of "1/sin(f(x))" wrt x 
diff(csc(F), X, D) :-
	diff(1/sin(F), X, D).

% LOG: The derivative of "log(f(x))" wrt x is "f'(x)/f(x)"
diff(log(F), X, DF/F) :-
	diff(F, X, DF).

% ---------- Trigonometric functions ----------

sec(X, 1/cos(X)).
csc(X, 1/sin(X)).
