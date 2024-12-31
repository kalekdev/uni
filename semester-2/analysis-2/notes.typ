TODO:
Vector calculus, $gradient$, $gradient dot$, $gradient times$
Spherical coordinate vector operators

= Analysis 2

== Linear Differential Equations
Differential equations are functions like any other - they can also be represented as linear combination of some basis, for example the infinite-dimensional Fourier basis which can represent any (long-term periodic or bounded) function.

=== Differential Operator
_Basic differential operator_ - $d^n / (d x^n)$ - A linear mapping between a function and its n'th (partial) derivative within some vector space, which can be represented as a matrix if finite.

#image("../../semester-1/lineare-algebra/images/linear-derivation.png", width: 80%)

A linear differential operator is a linear combination of basic differential operators, in other words a mapping from a function to a differential equation, for example:
$
  D(f)= dot.double(f) + 2 beta dot(f) + omega_n^2 f
$
Which is the differential operator for damped simple harmonic motion.

Differential operators (TODO: check) never have full rank, because the range is restricted to a subset of the domain linear space. *Carathéodory's existence theorem states that the kernel of an order-n differential operator has dimensions n* (and of course infinite solutions are spanned by n basis elements):
$
  D x(t) = 0\
  x(t) in "Kernel"(D)
$
TODO: Exact conditions for Carathéodory's Theorem to hold true

_Particular Solution_ - Single element that satisfies a differential equation

_Homogeneous Differential Equation_ - Can be defined by a linear operator with constant scalars
TODO: Inhomogeneous equations and how to solve them (see solutions to driven-damped oscillator)
