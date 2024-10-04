= Lineare Algebra

Übungsstunde Notizen:
- https://n.ethz.ch/~jamatter/
- https://www.felixgbreuer.com/linalg

_LGS_ - Lineare Gleichung System - linear system of equations

== Vektoren
_Lineare kombination_ - Summe von skalierten Vektoren\
_Linearly dependent_ - When two vectors can be expressed as a linear combination of the other and thus doesn't add any information to a LGS.
_Basis_ - the set of linearly independent vectors $e_1 ... e_n$ that span all of space $R^n$

Vektoren werden immer als Spalten in diesem Kurs gezeichnet.\

Matrix multiplication comes from the motivation for an efficient way of representing linear combinations / transformations of space.

== Geometry of an LGS (Beispiel 1.1.0.8)
An LGS can be viewed geometrically (2D/3D) in multiple different ways:
1. A linear combination of vectors (the columns of the matrix), where we are solving for the set of scalars where the superposition of the vectors is equal to the RHS. The columns of the matrix can be viewed as basis vectors of a custom coordinate system, in which we need to find the equivalent of the RHS vector.
2. Alternatively it can be viewed as a set of line / plane equations (where each row is the normal vector to the plane, unsure if the coefficients are meaningful in ax + by=c) and solutions are points / lines of intersection.
3. The LHS can also be viewed (usually in 3B1B videos) as a linear transformation of space, where the columns of the matrix are where the basis vector of each dimension lands after the transformation. The solution is therefore the vector which after being transformed results in the RHS vector.

*NOTE*: I will mostly think in terms of the _linear transformation of space_ intuition, because the others are not very meaningful when considering inverse matrices.


=== Superposition:
In this example, one of the LHS vectors is a linear combination of the other two. This results in the LGS only being able to express vectors in a single plane rather than the entire 3D space (it doesn't contain a 3rd base component).

_Infinite solutions_ - if the RHS vector lays in the plane expressed by $bold(a_(1-3))$, any point in the positive / negative direction of the solution vector lays in the plane.\
_No solutions_ - the vector does not lay perfectly on the plane, the LHS vectors lack a component (not necessarily base unit vector) in its direction.

=== Line / Plane equations:
The solution is the point at which the lines / planes represented by the horizontal equations intersect. There are many possible arrangements which we can visualize, especially in $3D$ space.

_Unique solution_ - Common point of intersection of $n$ non parallel lines /
planes.\
_Infinite solutions_ - Sheaf of planes or if all lines are the same.\
_No solution_ - Not all lines / planes meet at a common point, which is more likely the more equations are introduced into the system. Examples: Parallel lines, trianglular prism from 3 planes.

== Gaussische Eliminationsverfahren
Ideal method for solving a $m times n$ system of equations, easy to implement algorithmically and works for all dimensions.

_Pivot_ - element on the diagonal of a matrix that has a non 0 coefficient

_Rang / rank_ - number of non 0 pivots, ie (number of rows - number of Kompatibilitaetsbedingungen) - the number of linearly independent rows / columns - the number of dimensions of the output of a linear transformation

_Kompatibilitaetsbedingungen_ - Empty rows at the bottom of the matrix (0 coefficients in one of the equations). If their result is not 0 then there are no solutions for the system. If their result is 0 and the number of equations $<=$ the number of variables, there are infinite solutions.\
_Intuition:_ When thinking of the LGS as superposition, each LHS vector has a 0 component in this dimension, meaning that $forall x in RR$ scalar in the Lineare Kombination satisfies the system. Viewing the system with insufficient equations as a system of planes, two planes will intersect along an entire line.
In 2D, there would just be a single line, which of course has solutions along its entirety.

Any variables not accounted for due to an all 0 row / no pivot in their column are called _free variables_ and can take any real value. TODO: Solidify understanding

*"Order is half of the work in maths."* - _Vasile Gradinaru_

=== Tips:\
- Never divide / subtract in Gaussian elimination. Either multiply by $1/x$ or -1.
- Switch rows columns carefully *before* carrying out additions.
- *Only* add the row who's pivot is currently being considered! Otherwise it is difficult to capture the operation in the elimination matrix (more on this later).
- When switching rows to get pivots in the correct place, it is usually best to swap a line with zero pivot with the row that has the largest pivot in that place.

_U - Upper (Deutsch: R - Rechts) Matrix_ - Matrix with 0s under the diagonal and any numbers above it\
_L - Lower Matrix_ - Matrix with 0s above the diagonal and any numbers below it\
_Identity Matrix_ - Matrix with 0s above and below the diagonal, which only contains 1s\
_Tridiagonal Matrix_ - Matrix with 3 diagonals, and otherwise 0s everywhere

_Homogene LGS_ - $bold(A x) = 0$ hat eine triviale Loesung $bold(x) = 0$, unless it has free variables.\

=== Square Matrices ($m times n$):
*This only applies to square matrices*

_Regular Matrix_, Rank = n, has exactly one solution for arbitrary RHS and only the trivial solution when homogenous\
_Singular Matrix (Single / peculiar)_, Rank < n, has infinite / no solutions and has infinite non trivial solutions when homogenous

$m>n$ - An overdetermined LGS only has solutions for specific RHS values (if the rows are not linearly dependent) and therefore has no inverse (singular).

== Transposed Matrix
For a matrix with notation:
$
  i := 1, ..., m "Zeilen"\
  j := 1, ..., n "Spalten"\
  bold(A) = [a_(i j)]\
  "Example:" mat(1,2,3;4,5,6)
$
The transposed matrix $A^T$ is:
$
  bold(A^T) = [a_(j i)]\
  "Example:" mat(1, 4;2, 5;3, 6)
$
This can be thought of as pinning the first elements of each row and letting the rest of the row swing down vertically.

_Hermitian matrix_ - $bold(A) in CC^(m times n), bold(A^H)$ - The same procedure however each element becomes its complex conjugate $overline(a)$.

Vectors may be treated like $RR^(n times 1), CC^(n times 1)$ matrices and transposed in the same manner.

Matrix addition / scalar multiplication is carried out in the same way as vectors.

$
  bold((A B)^T = B^T A^T)\
  bold((A + B)^T = A^T + B^T)\
  bold((A + B)^H = A^H + B^H)\
$

== Matrix Symmetry
_Symmetrical_ - $bold(A^T) = bold(A)$\
_Antisymmetrical_ - $bold(A^T) = -bold(A)$\
_Hermetian Symmetry_ - $bold(A^H) = bold(A)$\

== Matrix Multiplication\
Can be thought as the combination of transformations of space.

Two matrices may only be multiplied if they have the same inner dimensions:
$
  bold(A_(X times Y) times B_(Y times Z) = C_(X times Z))
$

Several LGS with the same LHS can be solved simultaneously with matrix multiplication:\
$
  bold(X) = [arrow(X_1), ..., arrow(X_n)], bold(B) = [arrow(B_1), ..., arrow(B_n)]\
  bold(A^(-1) X = B)
$

$"Rank"(bold(A X)) = min("Rank"(bold(A)), "Rank"(bold(X)))$

Matrix multiplication is usually not commutative, however always associative and distributive.

== Inverse
The inverse of a matrix $bold(A)$ is denoted as $bold(A^(-1))$, which reverses the transformation of space represented by matrix $bold(A)$. Therefore $bold(A A^(-1) = I)$.

The inverse can be used to solve a LGS for arbitrary RHS vectors.

_Regulaer, invertierbar und voller Rang_ sind synonyme dafuer, dass eine Matrix einen Inverse hat. Therefore here are some equivalent conditions which show that a matrix $bold(A)$ is regular:
- $bold(A)$ is invertierbar
- Rang($bold(A)) = n$
- $bold(A x = b)$ is solvable for any $bold(b)$
- $bold(A x = 0)$ only has the trivial solution $x=0$

Identities:
$
  bold((A B)^(-1) = B^(-1) A^(-1))\
  bold((A^T)^(-1) = (A^(-1))^T)
$

== Eliminationsmatrix (aka Protokolmatrix)
Matrix used for tracking the process of Gaussian elimination. The LHS / RHS multiplied by the elimination matrix results in the current state of the elimination!

It starts as the identity matrix, then the scalar by which another row was multiplied by before adding is written in the position of the currently eliminated variable of the row it was added to.

*Important*: Keep the elimination matrix lower! This means that for the current column, only the current row with 1 in the diagonal may be added to other rows. If this doesn't work, use a permutation.

*Caution*: when swapping rows, do NOT forget adjusting the Elimination Matrix accordingly, by simply swapping all non diagonal values in the rows (this is done in a mathematical manner with Permutation matrices later).

*Properties of elimination matrices:*\
- The inverse of the elimination matrix is itself, but non diagonal values become negative. This makes sense intuitively, as $bold(E E^(-1) = I)$ so for $bold(E_(i j) + E^(-1)_(i j) =0)$ they must have opposite polarities.
- Two lower elimination matrices (with no overlapping elements!) multiplied together is the identity matrix with the combination of both lower elements. This means we can chain steps of Gaussian elimination together nicely.

== Permutation Matrix

Matrix used to track the permutation of rows in LU-Zerlegung. This is simply the identity matrix with the corresponding rows swapped.\

*Properties of permutation matrices:*\
$
  bold(P_13) := mat(0,0,1;0,1,0;1,0,0)\
  bold(P^(-1) = P^T)\
  "Row permutation:" space bold(P_13) mat(1,2,3;4,5,6;7,8,9) &= mat(7,8,9;4,5,6;1,2,3)\
  "Column permutation:" space mat(1,2,3;4,5,6;7,8,9) bold(P_13) &= mat(3,2,1;6,5,4;9,8,7)\
$
== Calculating the Inverse
The inverse can be calculated through Gaussian elimination (full Gaussian elimination, ie. with back substitution already carried out so the LHS matrix is the identity matrix) with a RHS of $bold(b) = vec(b_1, b_2, ..., b_n)$ and then finding which $bold(X)$ results in $bold(X^(-1)b)=$ our eliminated original matrix (by simply reading the coefficients of each component of $bold(b)$).

This can be simplified as the so-called *Gauss-Jordan Elimination*. This can be described as the following transformation through regular Gaussian elimination. All operations happen on both sides in both matrices, unlike LU decomposition.
$
  [bold(A | I)] arrow.squiggly [bold(I | A^(-1))]\
  mat(augment: #3,
  2, -1, 0, 1, 0, 0;
  -1, 2, -1, 0, 1, 0;
  0, -1, 2, 0, 0, 1
) arrow.squiggly
  mat(augment: #3,
  1, 0, 0, 3/4, 1/2, 1/4;
  0, 1, 0, 1/2, 1, 1/2;
  0, 0, 1, 1/4, 1/2, 3/4
)
$

The elimination matrix can be used with any $bold(b)$ to apply the steps of elimination, for example when the first row was multiplied by 2 and added to the 2nd row: $
mat(
  1, 0, 0;
  2, 1, 0;
  0, 0, 1;
) vec(b_1, b_2, b_3) = vec(b_1, 2b_1 + b_2, b_3)
$

*Cool Fact*: Just before each row was multiplied to make the pivots 1, the pivots of the LHS multiplied together is equal to the determinant, which is how computers calculate it for very large matrices. This can also be related to the fact, that a matrix is only invertable if its determinant is non 0 (therefore there are no empty rows / pivots).

== LU Lower Upper (LR Left Right) Zerlegung
A matrix can be decomposed into an upper and lower matrix, such that:
$
  bold(A = L U)\
  bold(P A = L U)
$

This can be used to decouple the factorization phase from the actual solving phase in Gaussian elimination. When the number of RHS we need to solve for is relatively small and the LGS is extremely large, it is more efficient to carry out LU Zerlegung and the additional steps to solve each system separately rather than to calculate the inverse through Gauss-Jordan elimination.

*Proof of $bold(A = L U)$:*\
For steps $1,2,3,...,n$ of Gaussian elimination, the end result of the LHS is an upper matrix.
$
  bold(E_n E_(n-1) E_(n-2)...E_1 A = U)
$
The chain of steps (elimination matrices) can be moved to the RHS by multiplying both sides by their inverses due to $bold(E E^(-1) = I)$:
$
  bold(A = E^(-1)_n E^(-1)_(n-1) E^(-1)_(n-2)...E^(-1)_1 U)
$
The chain of elimination steps can of course be represented as a single lower matrix $bold(E)$, therefore:
$
  bold(A = E^(-1) U = L U)
$
Where $E^(-1)$ is very easy to find (non diagonal elements simply $times -1$ as mentioned earlier).

Using a combination of Elimination matrices and row + column permutations (these are needed to preserve the diagonal 1s of the resulting elimination matrix), the entire Gaussian elimination process can be encoded as one L matrix.

This is very powerful as the inverses of E and P matrices are easy to find and apply in reverse to the RHS in order to solve the LGS.

The decomposed system can then be used to solve $bold(x)$ in another more efficient way to typical Gauss elimination TODO: Understand exactly how from script
$
  A x = b\
  P A = L U\
  L c = P b\
  U x = c
$

TODO: Other decomposition methods (Cholesky etc)

== Vector Operations
*Euclidean Norm:*
$
  bold(x) in RR\
  abs(bold(x)) = sqrt(x_1^2 + x_2^2 + ... + x_n^2)\
  bold(x) in CC\
  abs(bold(x)) = sqrt(abs(x_1)^2 + abs(x_2)^2 + ... + abs(x_n)^2)\
  "Where" abs(x_1) = sqrt("re"(x_1)^2 + "im"(x_1)^2)\
$

TODO: Cross product

*Dot Product:*\
$
  <x, y> = abs(x)abs(y)cos(hat((x, y)))\
  hat((x, y)) = arccos (<x, y>) / (abs(x) abs(y))\
  x perp y "is Orthogonal" <=> <x, y> = 0
$
TODO: Only valid for certain angles!

== Orthogonale Matrizen
_Orthogonal matrix_ - A square matrix whose columns are perpendicular to each other (dot product 0) and their Euclidean Norms are 1. They do not change lengths or angles - ie they only rotate space.
$
  bold(Q^T Q = I) - "Orthogonal"\
  bold(Q^H Q = I) - "Unitär"\
$

*Rotation Matrix* - Matrix that rotates space by $alpha$ degrees anticlockwise:
$
  R(alpha) = mat(
  cos(alpha), -sin(alpha);
  sin(alpha), cos(alpha)
)
$
Due to the identity $bold(Q^(-1) = Q^T)$ (Orthogonal matrices):
$
  R(alpha)^T = R(-alpha) = mat(
  cos(alpha), sin(alpha);
  -sin(alpha), cos(alpha)
)
$

For a rotation in a certain plane of $RR^3$, simply replace certain elements of the $3 times 3$ identity matrix with the rotation matrix. For example a rotation in the $x times y$ plane:
$
  mat(
  cos(alpha), -sin(alpha), 0;
  sin(alpha), cos(alpha), 0;
  0, 0, 1
)
$
$x times z$ plane:
$
  mat(
  cos(alpha), 0, -sin(alpha);
  0, 1, 0;
  sin(alpha), 0, cos(alpha);
)
$
and so on in higher dimension...

Rotations which are not confined to a plane can be done through decomposition into several rotations. TODO

*Reflection Matrix* - Reflection of space (a vector $bold(x)$ which does not lie on the plane) across an arbitrary plane with normal *unit* vector $bold(u)$:
- Projection of x on the plane $= a u$
TODO: Derivation from script\
The matrix which achieves this transformation is called the Householder Matrix:\
$
  abs(bold(u)) = 1\
  bold(Q = 1-2 u u^T)
$

*"Fuer die Computer sind alle Zahlen schön"* - _Vasile Gradinaru_

== QR Zerlegung (QU Zerlegung)
In LU Decomposition, the matrices are not orthogonal which can lead to rounding errors. QR Decomposition is a different approach, where the matrix Q is orthogonal (which is useful).

Likewise, it can be used to solve LGSs, with the advantage of :
$
  bold(A x = b <=> Q R x + b <=> R x + Q^T b)
$
Advantage:
- reduced rounding errors
Disadvantage:
- 3 times as inefficient as LU-Zerlegung

TODO: What exactly are the rounding errors?

Calculation:
Create 0 in the lower half of R only using orthogonal transformations. It can be done with either rotations or Householder matrices (reflections):
1. Use a combination of rotation matrices with certain angles and clockwise / anti-clockwise to bring elements under the pivot to 0 without affecting others
2.

== Upcoming
_Determinant_ - The factor by which a linear transformation (usually represented as a matrix) changes any area / volume in space. Can only be computed for square matrices.

_Non-Zero determinant_ - No information is lost, there is precisely one transformation which reverses the effects on space (inverse matrix)

Next 3B1B Video - Dot products and duality
