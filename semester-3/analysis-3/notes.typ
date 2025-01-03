= Analysis 3

== Calculus of Variations
_Functional (Calculus definition)_ - A mapping from a function to the real numbers

This field of calculus involves investigating changes and optimizing functionals. These are often integrals involving the input function, for example the following functional which outputs the length of an input path (to be minimized) $y(x)$ between two points:
$
  L(y(x)) = integral_(x_1)^(x_2) sqrt(d x^2 + d y^2) = integral_(x_1)^(x_2) sqrt(d x^2 + (d x (d y(x))/(d x))^2)\
  = integral_(x_1)^(x_2) sqrt(1 + ((d y(x))/(d x))^2) d x
$
In this case, it is evaluated between the $x$ components of the two points as the minimum obviously lies between these (straight line), however if some constraints are applied / optimizing for travel time is the goal (Fermat's principle) different limits may be required.

=== Euler-Lagrange Equation
Similarly to finding the input value(s) for stationary points, we can find the "stationary function(s)" of $L$ using the Euler-Lagrange equation. First we must setup the problem in the form:
$
  S(y(x)) = integral_(x_1)^(x_2) f(y(x), y'(x), x) d x
$
Euler-Lagrange's equation states that stationary functions satisfy the PDE:
$
  (partial f) / (partial y) - d((partial f) / (partial y')) / (d x) = 0
$
Calculating the terms of this PDE from our problem and finding solutions (if possible) gives us the stationary function(s) $y(x)$, although it is not clear whether this is a maximum, minimum or "path of inflection".

TODO: Derivation after covering multi variable chain rule

=== Multi variable
Oftentimes, more than one dependent variable is needed to fully express the problem. For example, a spiral path can only be expressed using parametric equations instead of a single injective function $y(x)$:
$
  x = x(t)\
  y = y(t)\
$
In this case, the path length is given by:
$
  L(y(x)) = integral_(1)^(2) sqrt(d x^2 + d y^2) = integral_(1)^(2) sqrt((d t (d x)/(d t))^2 + (d t (d y)/(d t))^2)\
  = integral_(1)^(2) sqrt(((d x)/(d t))^2 + ((d y)/(d t))^2) d t\
$
The problem has become:
$
  S(x(t), y(t)) = integral_(1)^(2) f(x(t), y(t), x'(t), y'(t), t) d t
$
Finding stationary function(s) simply involves solving two Euler-Lagrange equations:
$
  (partial f) / (partial x) - d((partial f) / (partial x')) / (d t) = 0\
  (partial f) / (partial y) - d((partial f) / (partial y')) / (d t) = 0\
$
