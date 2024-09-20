= Lineare Algebra

_LGS_ - Lineare Gleichung System - linear system of equations

== Vektoren
_Lineare kombination_ - Summe von skalierten Vektoren\
_Basis_ - the set of base vectors $e_1 ... e_n$ that define space $R^n$

Vektoren werden immer als Spalten in diesem Kurs gezeichnet.\
Standard vector notation:\
$
  bold(a_1) = vec(a_11, a_21, a_31)
$

Matrix multiplication comes from the motivation for an efficient way of
representing LGSs.

== Geometry of an LGS (Beispiel 1.1.0.8)
An LGS can be viewed geometrically (2D/3D) in multiple different ways:
1. A linear combination of vectors (the columns of the matrix), where we are
  solving for the set of scalars where the superposition of the vectors is equal
  to the RHS.
2. Alternatively it can be viewed as a set of line / plane equations, where each
  row is the normal vector to the plane (unsure if the coefficients are meaningful
  in ax + by=c)

=== Superposition:
The solution of a LGS is finding the scalars which make the linear combination
of n vectors $in R_n$ equal to the RHS vector. It is utterly NOT the same as
finding the points of intersection with a plane.

In this example, one of the LHS vectors is a linear combination of the other
two. This results in the LGS only being able to express vectors in a single
plane rather than the entire 3D space (it doesn't contain a 3rd component).

_Infinite solutions_ - if the RHS vector lays in the plane expressed by $bold(a_(1-3))$,
any point in the positive / negative direction of the solution vector lays in
the plane.\
_No solutions_ - the vector does not lay perfectly on the plane, the LHS vectors
lack a component (not necessarily base unit vector) in its direction.

=== Line / Plane equations:
The solution is the point at which the lines / planes represented by the
horizontal equations intersect. There are many possible arrangements which we
can visualize, especially in $3D$ space.

_Unique solution_ - Common point of intersection of $n$ non parallel lines /
planes.\
_Infinite solutions_ - Sheaf of planes or if all lines are the same.\
_No solution_ - Not all lines / planes meet at a common point, which is more
likely the more equations are introduced into the system. Examples: Parallel
lines, trianglular prism from 3 planes.

== Gaussische Eliminationsverfahren
_Pivot_ - element on the diagonal of a matrix that has a non 0 coefficient

_Rang / rank_ - number of non 0 pivots, TODO: Intuitive meaning

_Kombatilitaetsbedingungen_ - Empty rows at the bottom of the matrix (0
coefficients in one of the equations). If their result is not 0 then there are
no solutions for the system. If their result is 0 and the number of equations $<=$ the
number of variables, there are infinite solutions.\
_Intuition:_ When thinking of the LGS as superposition, each LHS vector has a 0
component in this dimension, meaning that $forall x in RR$ scalar in the Lineare
Kombination satisfies the system. Viewing the system with insufficient equations
as a system of planes, two planes will intersect along an entire line. In 2D,
there would just be a single line, which of course has solutions along its
entirety.

Any variables not accounted due to an all 0 row are called _free variables_ and
can take any real value.

=== Tips:\
- Never divide / subtract in Gaussian elimination. Either multiply by $1/x$ or -1.
  Order is half of the work in maths.
- When switching rows to get pivots in the correct place, it is usually best to
  swap a line with zero pivot with the row that has the largest pivot in that
  place.

TODO: Consider Gaussian elimination for non square matrix and why the stagger
skips some columns\
TODO: Understand protocol matrix

In dem Ergebnis matrix, alle Zeilen sind lineare Kombiationen der Pivot Zeilen.
