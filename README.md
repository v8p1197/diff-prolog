# diff-prolog
Solves the symbolic differentiation problem in ProLog.

Currently, the following basic derivatives are defined:
* Derivative of a constant
* Derivative of a polynom

The following relationships are defined:
* Derivative of a sum/difference
* Derivative of a product
* Derivative of a fraction

The result will not be simplified. You can check the correctness of the solution by simplifying the resulting expression via this [online tool](https://www.mathpapa.com/simplify-calculator/).

## Examples

The differentiation operator is defined as `diff`. The syntax is `diff(Y,X,D)`, meaning that *The derivative of Y with respect to X is D*.

Then, if `y` is an expression of `x` (e.g., `y=42x`), you can query the derivative `D` of `y` wrt `x` with

```prolog
diff(42*x, x, D).
```

Querying

```prolog
diff(3*(2*x+1)^2, x, Y).
```

produces

```prolog
Y = 0*(2*x+1)^2+3*(2*(2*x+1)^(2-1)*(0*x+2*1+0)) .
```

which, simplified, is

```prolog
24*x + 12
```
