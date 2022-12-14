# diff-prolog
Solves the symbolic differentiation problem in ProLog.

Currently, the following basic derivatives are defined:
* Derivative of a constant;
* Derivative of a polynom;
* Derivative of an exponential function;
* Derivative of trigonometric functions (sin, co, tan, cot, sec, csc);
* Derivative of (natural) logarithm.

The following relationships are defined:
* Derivative of a sum/difference;
* Derivative of a product;
* Derivative of a fraction.

The result will not be simplified. You can check the correctness of the solution by simplifying the resulting expression via this [online tool](https://www.mathpapa.com/simplify-calculator/).

## Get started

1. Download and install [SWI-ProLog](https://www.swi-prolog.org/Download.html);
1. Clone this repository:

    ```bash
    git clone https://github.com/v8p1197/diff-prolog
    ```

1. Include [derivatives.pl](derivatives.pl):

    ```bash
    cd diff-prolog
    swipl derivatives.pl
    ```
    
1. Have fun.

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
