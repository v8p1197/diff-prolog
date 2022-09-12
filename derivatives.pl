%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                          %
%  diff(Y, X, D) means "the derivative of Y with respect to (wrt) X is D"  %
%                                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- include("RedEx.pl").

% ---------- Simplification ----------
diff(F, X, D) :-
	diff_ns(F, X, S), simplify(S, D).

% ---------- Facts ----------

% The derivative of a constant C is 0
diff_ns(C, _, 0) :- number(C).

% The derivative of x wrt x is 1
diff_ns(X, X, 1).

% The derivative of y wrt x is 0 if Y is not a function of X, and Y is not X 
diff_ns(Y, X, 0) :- atom(Y), Y \== X.

% ---------- Rules ----------

% The derivative of "f(x) + g(x)" wrt x is "f'(x) + g'(x)"
diff_ns(F+G, X, DF + DG) :-
	diff_ns(F, X, DF), diff_ns(G, X, DG).	

% The derivative of "f(x) - g(x)" wrt x is "f'(x) - g'(x)"
diff_ns(F-G, X, DF - DG) :-
	diff_ns(F, X, DF), diff_ns(G, X, DG).

% The derivative of "f(x) * g(x)" wrt x is "f'(x)g(x) + f(x)g'(x)"
diff_ns(F*G, X, DF*G+F*DG) :-
	diff_ns(F, X, DF), diff_ns(G, X, DG).

% The derivative of "f(x) / g(x)" wrt x is "frac{f'(x)*g(x) - f(x)*g'(x)}{g(x)^2}"
diff_ns(F/G, X, (DF*G-F*DG)/(G^2)) :-
	diff_ns(F, X, DF), diff_ns(G, X, DG).

% ---------- Basics ----------

% POL: The derivative of "f(x)^p" wrt x is "p * f(x)^(p-1) * f'(x)"
diff_ns(F^P, X, P*F^(P-1)*DF) :-
	diff_ns(F, X, DF), number(P).

% EXP: The derivative of "exp(f(x))" wrt x is "exp(f(x)) * f'(x)"
diff_ns(e^F, X, (e^F)*DF) :-
	diff_ns(F, X, DF).	

% SIN: The derivative of "sin(f(x))" wrt x is "cos(f(x))*f'(x)"
diff_ns(sin(F), X, cos(F)*DF) :-
	diff_ns(F, X, DF).

% COS: The derivative of "cos(f(x))" wrt x is "-sin(f(x))*f'(x)"
diff_ns(cos(F), X, -sin(F)*DF) :-
	diff_ns(F, X, DF).

% TAN: The derivative of "tan(f(x))" wrt x is the derivative of "sin(f(x))/cos(f(x))" wrt x 
diff_ns(tan(F), X, DSC) :-
	diff_ns(sin(F)/cos(F), X, DSC).

% COT: The derivative of "cot(f(x))" wrt x is the derivative of "cos(f(x))/sin(f(x))" wrt x 
diff_ns(cot(F), X, DSC) :-
	diff_ns(cos(F)/sin(F), X, DSC).

% SEC: The derivative of "sec(f(x))" wrt x is the derivative of "1/cos(f(x))" wrt x 
diff_ns(sec(F), X, DSC) :-
	diff_ns(1/cos(F), X, DSC).

% CSC: The derivative of "csc(f(x))" wrt x is the derivative of "1/sin(f(x))" wrt x 
diff_ns(csc(F), X, DSC) :-
	diff_ns(1/sin(F), X, DSC).

% LOG: The derivative of "log(f(x))" wrt x is "f'(x)/f(x)"
diff_ns(log(F), X, DF/F) :-
	diff_ns(F, X, DF).

% ---------- Trigonometric functions ----------

sec(X, 1/cos(X)).
csc(X, 1/sin(X)).
