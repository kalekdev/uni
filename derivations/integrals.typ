= Integration Derivations

== Integration by parts
$
  d(f(x)g(x))/(d x)  &= f'(x)g(x) + f(x)g'(x)\
  f(x)g(x)           &= integral f'(x)g(x) + f(x)g'(x)\
                     &= integral f'(x)g(x) + integral f(x)g'(x)\
  integral f'(x)g(x) &= f(x)g(x)-integral f(x)g'(x)\
$

Choose $f'(x)$ as the function which gets nicer once integrated. This usually
results in the following order:
- L ogarithms
- I nverse trig functions
- A lgebraic function (polynomial)
- T rigonometric function
- E xponential

Example:
$
  integral x cos(x) d x &= x sin(x) - integral sin(x) d x\
                        &= x sin(x) + cos(x) + c
$

== Integration by substitution
$
  d(F(g(x)))/(d x)                   &= F'(g(x)) dot g'(x) = integral_a^b f(g(x)) dot g'(x) d x\
                                     &= F(g(b)) - F(g(a)) = integral_g(a)^g(b) f(y) d y\
  integral_a^b f(g(x)) dot g'(x) d x &= integral_g(a)^g(b) f(y) d y
$

Example 1:
$
  integral_0^1 e^sin(x) dot cos(x) d x\
  "Substitute" y = sin(x)\
  integral_0^sin(1) e^y d y &= e^sin(1) - e^0\
  e^sin(1) - 1
$

Example 2:
$
  integral tan(x) d x &= -integral -sin(x) dot 1/cos(x) d x\
  "Substitute" y      &=cos(x)\
                      &= integral 1/y d y\
                      &= -ln(abs(cos(x))) + c\
                      &= ln(1/abs(cos(x))) + c
$

