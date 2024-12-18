#heading(outlined: false)[Lineare Algebra]

#set heading(numbering: (..nums) => nums.pos().map(str).slice(1, none).join("."))

#outline()

We live in a discrete, digital age.

Übungsstunde Notizen:
- https://n.ethz.ch/~jamatter/
- https://www.felixgbreuer.com/linalg

Nice Blog:
https://gregorygundersen.com/blog/tags/la/

Notation:\
_LGS_ - Lineare Gleichung System - linear system of equations\
$cal(A)(bold(x)) = bold(A x)$ - the corresponding Abbildung von the matrix A. Matrix multiplication is often referred to as a function

#pagebreak()

== Vector Operations
=== Euclidean Norm
$
  bold(x) in RR\
  abs(bold(x)) = sqrt(x_1^2 + x_2^2 + ... + x_n^2)\
  bold(x) in CC\
  abs(bold(x)) = sqrt(abs(x_1)^2 + abs(x_2)^2 + ... + abs(x_n)^2)\
  "Where" abs(x_1) = sqrt("re"(x_1)^2 + "im"(x_1)^2)\
$

=== Dot / skalar Product
$
  bold(x\, y) in RR^n\
  <bold(x\, y)> = x_1 y_1 + x_2 y_2 + ... + x_n y_n = bold(x^T y)\
  bold(x\, y) in CC^n\
  <bold(x\, y)> = overline(x_1) y_1 + overline(x_2) y_2 + ... + overline(x_n) y_n = bold(x^H y)
$
The dot product can be used to calculate the angle between two vectors:
$
  <x, y> = abs(x)abs(y)cos(hat((x, y)))\
  hat((x, y)) = arccos (<x, y>) / (abs(x) abs(y))\
  x perp y "is Orthogonal" <=> <x, y> = 0
$
$(<x, y>) / (abs(x) abs(y)) in [-1, 1]$ is proven by the Cauchy–Schwarz inequality.

=== Cross / Vektor product
The cross product is only defined in $RR^3$ and results in a vector orthogonal to both inputs, whose direction can be determined with the right hand rule.
$
  bold(x\, y) in RR^3\
  bold(x times y) = mat(delim: "|",
  bold(e^x), bold(e^y), bold(e^z);
  x_1, x_2, x_3;
  y_1, y_2, y_3)\
$
It can also be used for determining the angle between two vectors in $RR^3$ :
$
  bold(x\, y) in RR^3\
  bold(x times y) = abs(bold(x)) abs(bold(y)) bold(n) sin theta
$
($bold(n)$ is the unit vector normal to the plane spanned by $bold(x\, y)$)

== Fundamentals
=== Vectors
LTD: Review what linear algebra is all about: https://en.wikipedia.org/wiki/Linear_map

_Lineare kombination_ - Summe von skalierten Vektoren\
_Linearly dependent_ - When a vector can be expressed as a linear combination of the others and thus doesn't add any information to a LGS.\
_Basis_ - A set of linearly independent vectors $e_1 ... e_n$ that span all of space $R^n$

Matrix multiplication comes from the motivation for an efficient way of representing linear combinations / transformations of space.

=== Geometry of an LGS
An LGS can be viewed geometrically (2D/3D) in multiple different ways:
1. A linear combination of vectors (the columns of the matrix), where we are solving for the set of scalars where the superposition of the vectors is equal to the RHS. The columns of the matrix can be viewed as basis vectors of a custom coordinate system, in which we need to find the equivalent of the RHS vector.
2. Alternatively it can be viewed as a set of line / plane equations (where each row is the normal vector to the plane, unsure if the coefficients are meaningful in ax + by=c) and solutions are points / lines of intersection.

=== Superposition
In this example, one of the LHS vectors is a linear combination of the other two. This results in the LGS only being able to express vectors in a single plane rather than the entire 3D space (it doesn't contain a 3rd linearly independent basis dimension).

_Infinite solutions_ - if a 3D RHS vector lays in the plane spanned by a 2D basis, there are infinitely many combinations of the two dependent basis vectors that can reach the point.\
_No solutions_ - the vector does not lay perfectly on the plane, the LHS vectors lacks a component in its direction and no linear combination of the basis can reach it.

=== Line / Plane equations
The solution is the point at which the lines / planes represented by the horizontal equations intersect. There are many possible arrangements which we can visualise, especially in $3D$ space.

_Unique solution_ - Common point of intersection of $n$ non parallel lines /
planes.\
_Infinite solutions_ - Sheaf of planes or if all lines are the same.\
_No solution_ - Not all lines / planes meet at a common point, which is more likely the more equations are introduced into the system. Examples: Parallel lines, trianglular prism from 3 planes.

== Gaussian Elimination
Method for solving a $m times n$ system of equations, easy to implement algorithmically and works for all dimensions.

_Pivot_ - Element on the diagonal of an upper matrix that has a non 0 coefficient

_Rank_ - number of non 0 pivots, ie (number of rows - number of Kompatibilitaetsbedingungen) - the number of linearly independent rows / columns - the number of dimensions of the output of a linear transformation.

Row Rank = Column Rank:
$
  "Rank"(bold(A)) = "Rank"(bold(A^T))
$

_Compatibility Conditions_ - All-0 rows at the bottom of the matrix. If their result is not 0 then there are no solutions for the system. If their result is 0 and the number of equations $<=$ the number of variables, there are infinite solutions (the corresponding scalar can take any value and the RHS component remains 0).

_Free Variables_ - Any variables not accounted for due to no pivot in their column are called _free variables_. These can be thought of as degrees of freedom, we are free to give them any arbitrary value and the other variables for that specific solution in the linear combination then depend on these.

*"Order is half of the work in maths."* - _Dr. Vasile C. Gradinaru_

=== Tips
- Never divide / subtract in Gaussian elimination. Simply multiply by $1/x$ or -x and add.
- Switch rows columns carefully *before* carrying out additions.
- *Only* add the row who's pivot is currently being pursued to other rows! Otherwise it is difficult to capture the operation in the elimination matrix (more on this later).
- When switching rows to get existing pivots in the correct place, it is usually best to swap a line with a zero pivot with the row that has the largest pivot in that place.

- _U - Upper (sometimes: R - right) Matrix_ - Matrix with 0s under the diagonal
- _L - Lower Matrix_ - Matrix with 0s above the diagonal
- _Identity Matrix_ - Matrix with 1s on the diagonal, everything else 0.
- _Tridiagonal Matrix_ - Matrix with 3 diagonals, and otherwise 0s everywhere
- $bold(A x) = 0$ only has the trivial solution $bold(x) = 0$, unless $bold(A)$ contains free variables.

=== Types
Consider a $m times n$ matrix with rank $r$:
- *Square* _Regular Matrix_ - $r = n$ AND $m=n$ - has exactly one solution for arbitrary RHS; only the trivial solution when homogenous
- *Square* _Singular Matrix (single = strange and uncommon)_ - Rank < n - has infinite / no solutions and has infinite non trivial solutions when homogenous
- _Overdetermined_ - $m>n$ - An overdetermined LGS only has solutions for very specific RHS values (if the rows are linearly independent) and therefore has no inverse (singular). Solutions can however always be approximated (See @linear-least-squares).

== Matrices
=== Transposed Matrix
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

==== Conjugate Tranpose
$bold(A) in CC^(m times n), bold(A^H)$ - The same as a transposed matrix however each element becomes its complex conjugate $overline(a)$. In physics, this is often written as $bold(A^dagger)$

A matrix which satisfies $bold(A) = bold(A^H)$ is called a Hermitian matrix ie. a complex symmetric matrix.

LTD: Investigate thoroughly https://en.wikipedia.org/wiki/Hermitian_adjoint

==== Properties
- Vectors may be treated like $RR^(n times 1), CC^(n times 1)$ matrices and transposed in the same manner.
- Matrix addition / scalar multiplication is carried out in the same way as vectors.

==== Identities
$
  bold((A B)^T = B^T A^T)\
  bold((A B)^H = B^H A^H)\
  bold((A + B)^T = A^T + B^T)\
  bold((A + B)^H = A^H + B^H)\
$

The rank of a matrix is the same as its tranpose:
$
  "Rank"(bold(A)) = "Rank"(bold(A^T))
$

=== Minor Matrix
This is the matrix formed by removing a certain row and column, useful for computing the determinant in Laplace Expansion.

Consider the following matrix:
$
  bold(M) = mat(
  1, 2, 3;
  4, 5, 6;
  7, 8, 9
)
$
A certain minor can be written as $bold(M_(i, j))$ where $i$ and $j$ respectively are the row and column number (1-indexed) to remove from the matrix:
$
  bold(M_(1, 1)) = mat(
  square, square,square;
  square, 5, 6;
  square, 8, 9
) = mat(5, 6; 8, 9)\
  bold(M_(3, 2)) = mat(
  1, 3;
  4, 6
)
$

=== Block Matrix
A matrix that can be broken down into submatrices, used when performing Schur decomposition:

As an example, the following matrix can be split into partitions and written as sub matrices:
$
  bold(A) = mat(augment: #(hline: 2, vline: 3),
  1, 2, 3, 4;
  5, 6, 7, 8;
  9, 10, 11, 12
)\
  bold(M_1) = mat(1, 2, 3; 5, 6, 7), bold(M_2) = mat(4;8), bold(M_3) = mat(9, 10, 11)\
  bold(A) = mat(bold(M_1), bold(M_2);bold(M_3), 12)
$
As can be seen, not every element needs to be separated as a submatrix. This is simply chosen so that it represents the subject matter best.

=== Adjugate Matrix
TODO: cover adj matrix here https://en.wikipedia.org/wiki/Determinant#Adjugate_matrix

=== Matrix Multiplication\
Can be thought as the combination of transformations of space.

Two matrices may only be multiplied if they have the same inner dimensions:
$
  bold(A_(X times Y) times B_(Y times Z) = C_(X times Z))
$

Several LGS with the same LHS can be solved simultaneously with matrix multiplication with the inverse of $bold(A)$:
$
  bold(X) = [bold(x_1), ..., bold(x_n)], bold(B) = [bold(b_1), ..., bold(b_n)]\
  bold(A^(-1) X = B)
$

$"Rank"(bold(A X)) = min("Rank"(bold(A)), "Rank"(bold(X)))$

Matrix multiplication is usually not commutative, however always associative and distributive.

=== Inverse
The inverse of a square matrix $bold(A)$ is denoted as $bold(A^(-1))$, which reverses the transformation of space represented by matrix $bold(A)$. Therefore $bold(A A^(-1) = I)$.

The inverse can be used to solve a LGS for arbitrary RHS vectors and only exists for square matrices by definition.

*Regular, invertable and full rank* are synonyms meaning that a matrix has an inverse. Here are some equivalent conditions which show that a matrix $bold(A) in RR^(n times n)$ is regular:
- $bold(A)$ is square
- $"Rank"(bold(A)) = "Rank"(bold(A^T)) = n$
- $bold(A x = b)$ is solvable for any $bold(b)$
- $bold(A x = 0)$ only has the trivial solution $x=0$

*IMPORTANT*: Just because a matrix is not invertible, does not mean that an LGS it appears in has no solutions! It just cannot be guaranteed to have a single solution for arbitrary RHSs, for example an underdefined system of equations $m < n$ may have infinite solutions and an overdefined system $n < m$ only has a solution for very specific RHSs.

Identities:
$
  bold((A B)^(-1) = B^(-1) A^(-1))\
  bold((A^T)^(-1) = (A^(-1))^T)
$

=== Elimination Matrix
Matrix used for tracking the process of Gaussian elimination. The LHS / RHS multiplied by the elimination matrix results in the current state of the elimination!

The elimination matrix can be used with any $bold(b)$ to apply the steps of elimination, for example when the first row was multiplied by 2 and added to the 2nd row: $
mat(
  1, 0, 0;
  2, 1, 0;
  0, 0, 1;
) vec(b_1, b_2, b_3) = vec(b_1, 2b_1 + b_2, b_3)
$

It starts as the identity matrix, then the scalar by which another row was multiplied by before adding is written in the position of the currently eliminated variable of the row it was added to.

*Important*: Keep the elimination matrix lower! This means that for the current column, only the current row who's pivot we are pursuing may be added to other rows. If this doesn't work, use a permutation.

*Caution*: when swapping rows, do NOT forget adjusting the Elimination Matrix accordingly, by simply swapping all non diagonal values in the rows (this is done in a mathematical manner with Permutation matrices later).

*Properties of elimination matrices:*\
- The inverse of the elimination matrix is itself, but non diagonal values become negative. This makes sense intuitively, when considering the elements of $bold(E E^(-1) = I)$.
- Two lower elimination matrices (with no overlapping elements!) multiplied together is the identity matrix with the combination of both lower elements. This means we can combine steps of Gaussian elimination together nicely.

=== Permutation Matrix
Orthogonal Matrix used to track the permutation of rows during elimination. This is simply the identity matrix with the corresponding rows swapped.

==== Properties
$
  bold(P_13) := mat(0,0,1;0,1,0;1,0,0)\
  bold(P^(-1) = P^T)\
  "Row permutation:" space bold(P_13) mat(1,2,3;4,5,6;7,8,9) &= mat(7,8,9;4,5,6;1,2,3)\
  "Column permutation:" space mat(1,2,3;4,5,6;7,8,9) bold(P_13) &= mat(3,2,1;6,5,4;9,8,7)\
$
=== Calculating the Inverse
The inverse can be calculated through full Gaussian elimination (row-reduced echelon form, ie. with back substitution already carried out so the LHS matrix is the identity matrix) with a RHS of $bold(b) = vec(b_1, b_2, ..., b_n)$ and then finding which $bold(X)$ results in $bold(X^(-1)b)=$ our eliminated original matrix (by simply reading the coefficients of each component of $bold(b)$).

This can be simplified as the so-called *Gauss-Jordan Elimination*. This can be described as the following transformation through regular Gaussian elimination. All operations happen on both sides:
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

== LU Lower Upper (LR Left Right) Decomposition
A matrix can be decomposed into an upper and lower matrix, such that:
$
  bold(A = L U)\
  bold(P A = L U)
$

This can be used to decouple the factorization phase from the actual solving phase in Gaussian elimination. When the number of RHS we need to solve for is relatively small and $bold(A)$ is extremely large, it is more efficient to carry out LU Zerlegung and the additional steps to solve each system separately rather than to calculate the inverse through Gauss-Jordan elimination.

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

Using a combination of Elimination matrices and row + column permutations (these are needed to preserve the diagonal 1s of the resulting elimination matrix), the entire Gaussian elimination process can be encoded as one $bold(L)$ matrix.

=== Using the LU Decomposition
The decomposed system can then be used to solve for $bold(x)$ in the following way:
1. $A x = b$
2. Decompose into the form $P A = L U$
3. Replacing $A$ as LU, $P L U x =  b$
4. $U x = P^(-1)L^(-1) b$, now $x$ can be solved easily as $U$ is already in reduced form and just requires back substitution

LTD: Other decomposition methods (Cholesky etc)

== Unitary Matrices
_Orthonormal_ - Normalised orthogonal vectors; ie. a set of vectors that are orthogonal between one another and have length (norm) 1.

Orthonormality can be tested with dot products:
- $< u, v > = 0$ - Orthogonal
- $< u, u > = 1$ - Normal

_Unitary matrix_ A square matrix whose columns are perpendicular to each other (dot product 0) and their Euclidean Norms are 1, hence they have $det = 1$.
$
  bold(Q^H Q = I) <=> bold(Q) "is Unitary"\
$

The condition $bold(Q^H Q = I)$ ensures the dot product of every column with it self is 1 (they have length 1) and with other columns is 0 (the columns are orthogonal to each other) due to the 1s along the diagonal and 0s everywhere else in the identity matrix.

Furthermore, their eigenspaces are orthogonal to each other and $lambda = abs(1)$ - they are a subset of the normal matrices ($bold(A^H A = A A^H)$).

LTD: Investigate unitary matrix applications

=== Orthogonal Matrices
_Orthogonal matrix_ - A unitary matrix with only *real elements*. They do not change lengths or angles - ie they only rotate / reflect space.

The inverse of a rotation / reflection of space is logically its transpose (consider the rotation of base vectors to different axis):
$
  bold(Q^T Q = I) : "Q is Orthogonal"\
  "Sei P Orthogonal"\
  bold(Q P) "und" bold(P Q) "sind auch Orthogonal"
$

Orthogonal matrix multiplication is still generally not commutative.

==== Properties of orthogonal matrices
Let $bold(Q)$ be an orthogonal matrix:

- Preserves lengths: $
<bold(Q x\, Q y)> = <bold(x\, y)>\ abs(bold(Q x)) = abs(bold(x))
$
- Preserves angles $hat(bold(Q x\, Q y)) = hat(bold(x\, y))$
- Are always regular $<=>$ columns are linearly independent

==== Rotation Matrix
Matrix that rotates space by $alpha$ degrees anticlockwise:#footnote("Derivation through trigonometry in script by Dr. V Gradinaru")
$
  R(alpha) = mat(
  cos(alpha), -sin(alpha);
  sin(alpha), cos(alpha)
)
$
Due to the identity $bold(Q^(-1) = Q^T)$ rotation clockwise is:
$
  R(alpha)^T = R(-alpha) = mat(
  cos(alpha), sin(alpha);
  -sin(alpha), cos(alpha)
)
$
Alternatively, this can be calculated by inserting $-alpha$ into the anti-clockwise rotation matrix and applying the trigonometric symmetry identities.

For a rotation in a certain plane of $RR^n$, simply keep all columns and rows unaffected by the rotation as the identity matrix. For example a anti-clockwise rotation in the $x times y$ plane of $RR^3$:
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
and so on in higher dimensions...

_Given's Rotation_ $G(phi) = R(phi)$ - Simply a name for a rotation by the angle $phi$ on the plane spanned by two canonical unit vectors in the anti-clockwise direction

Rotations which are not confined to a plane can be achieved through a series of plane rotations multiplied together, still resulting in an orthogonal matrix. Alternatively, this can be found using a change of basis matrix and calculating a Given's rotation in the new basis.

==== Reflection (Householder) Matrix
The orthogonal Householder matrix $Q$ represents the reflection of space (a vector $bold(x)$ which does not lie on the plane) over an arbitrary plane with normal *unit* vector $bold(u)$:

$
  abs(bold(u)) = 1\
  bold(Q = I-2 u u^T)
$

*"Fuer die Computer sind alle Zahlen schön"* - _Vasile Gradinaru_

== QU Decomposition
QU Decomposition is a different approach to solving LGSs, where the matrix Q is orthogonal.

Likewise to LU decomposition, it can be used to solve LGSs:
$
  bold(A x = b <=> Q U x = b <=> U x = Q^T b)
$
Advantage:
- Reduced rounding errors due to the way computers represent floating point numbers
Disadvantage:
- 3 times as inefficient as LU-Zerlegung

The goal is to find a series of orthogonal transformations, which transform $bold(A)$ into an upper matrix when multiplying it. Since orthogonal matrices multiplied together result in an orthogonal matrix, they can easily be combined into one and used to solve the LGS as described above.

=== Givens rotations
Considering a vector, for example $vec(x_1, x_2)$. We can transform $x_2$ into 0 by rotating it *clockwise* onto the x-axis, resulting in $vec(r, 0)$ the following applies:
$
  r &= sqrt(x_1^2+x_2^2)\
  cos(theta) &= x_1 / r\
  sin(theta) &= x_2 / r
$
This works in $RR^n$ dimensions.

Using these formulas with the inverse of a Given's rotation, we can simply replace $cos$ and $sin$ in the matrix with the fractions, targeting the row we don't mind changing and the element we currently want to transform into 0:
$
  G(theta)^(-1) = G(theta)^T = mat(cos(theta), sin(theta);-sin(theta), cos(theta))
$

By applying a series of Givens rotations, we can carry out the full Gaussian elimination, ending up with an Upper / Right matrix.

=== Householder reflection
The goal is to find a Householder matrix that reflects a column of $A$ onto the axis of the row we are *not* trying to eliminate. As we know the resulting vector, for example $abs(bold(x)) dot e_x$, the unit vector $u$ is simply the normed vector between the original and resulting column of $A$:

$
  bold(x) in RR^n\
  bold(v) = bold(x) - abs(bold(x)) dot e_n\
  bold(u) = bold(v) / abs(bold(v))
$

The Householder matrix can then be found as before:
$
  bold(Q = I-2 u u^T)
$

When targeting inner columns, the reflection matrix should only be in the bottom right corner of the current $Q$, to avoid ruining our previous progress (the rest of it stays as $I$. This means that we ignore the upper row(s).

=== Which method to choose?
- Givens rotation is great for targeting specfic elements to turn into 0, and it needs a series of rotations to reduce several dimensions at once. It is ideal if there are already several 0s in the column.
- Householder reflections have the power to turn all except one element of a column into 0s at once (reflect a vector in $RR^3$ directly onto the x-axis for example)

== Linear Vector Spaces
*"Es macht Spaß"* - _Vasile Gradinaru_

_Linear_ - Lines are mapped to lines after the transformation

$RR^n$ and $CC^n$ are only two examples of many possible vector spaces. Considering the vector space $V$, the following axioms are defined:
#image("images/vector-space.png")

Two linear spaces can proved to be equal to one another by proving $A subset.eq B and B subset.eq A therefore A = B$

=== Continuous Differentiable Functions
$
  C^s [a, b] := {f: [a, b] -> RR, f "is continuous and has" s "derivatives"}
$

_Continuous_ - The function is continuous between [a, b], meaning there are no gaps or jumps in this interval.\
_Has s derivatives_ - The derivative exists at all points in the interval $[a, b]$ (ie. it is never a vertical line with an infinite gradient) and so on s times.

The following red function is a member of $C^1 [0, 1]$ but not $C^2 [0, 1]$, as its first derivative jumps from a positive to a negative value and its derivative therefore doesn't exist at the point of the jump (non-continuous).

#image("images/one-derivative.png", width: 20%)

The trigonometric functions have infinite continuous derivatives:
$
  {sin, cos} in C^oo [a, b]
$

The larger the value of s, the smaller the set. All functions in $C^2$ also belong in $C^1$ and so on...
$
  C^oo subset ... subset C^3 subset C^2 subset C^1 subset C^0
$

This set is a linear vector space, as addition and / or scalar multiplication result in a member of the same set, for example two continuous functions in an interval $[a, b]$ added together still result in a continuous function throughout the same interval.

=== Polynomials
$
  cal(P)_n := {"polynomials of degree" <= n-1}\
  cal(P)_1 subset cal(P)_2 subset cal(P)_3 subset ... subset cal(P)_oo
$

For example the polynomial $x^2+1$ with degree 2 is a member of $cal(P)_3$ but also all higher sets such as $cal(P)_4$ as the coefficient of $x^3$ is simply 0.

Addition and *scalar* multiplication are indeed valid operations that result in a member of the same set, therefore it is a linear vector space.

The Taylor Series in Analysis demonstrates how any continuous function in $C^0$ can be approximated using $cal(P)_n$.

=== Other Linear Spaces
- $L^2 [a, b] := {f: [a, b] -> RR, integral_a^b abs(f)^2 d t}$- Space of quadratically integrable functions
- $cal(l) := {a_n "converges"}$- Space of convergent sequences
- $cal(l) := {a_n "converges"}$- Space of convergent sequences

=== Linear Subspace
#image("images/subspace.png")
A linear subspace must also include a zero vector.

$
  U := {bold(x) in vec(x_1, 0) in RR^2}\
  U' := {bold(x) in vec(x_1, 5) in RR^2}
$
$U'$ is not a subspace, as vector addition leads to $vec(x_1', 10)$ which has left the space.

A single contradictory example must be found to prove that something is not a linear subspace.

=== Span
The set of all possible linear combinations of elements of a linear space. For example the span of basis vectors of $RR^3$ is the entire $RR^3$, as any point in 3D space can be expressed as linear combination of the basis.

The range of the transformation of space $cal(A)(x) = bold(A x)$ can be expressed as the span of its columns:
$
  cal(A): RR^n -> RR^m\
  "Range" cal(A) = "Span"{A_1, A_2, ..., A_n}
$

_Erzeugendensystem_ - Set of vectors which span a vector space $V$.

_Image / Column Space / Range / Codomain_ - of a transformation can be found by capturing any compatibility conditions in a vector (if there are any), for example of $b_3 - b_1 - b_2 = 0$, the range can be expressed as:
$
  {b_1, b_2 in RR, vec(b_1, b_2, b_1 + b_2)}
$

This can also be expressed as a span by breaking it into a linear combination:
$
  b_1 vec(1, 0, 1) + b_2 vec(0, 1, 1) = "Span" {vec(1, 0, 1), vec(0, 1, 1)}
$

_Monome_ - $p_n(t) = t^n$, for example $p_0(t) = 1, p_1(t) = t, p_2(t) = t^2, ...$\
The set of monomes is a linear subspace of the polynomials $cal(P_n)$, which can be spanned by $"Span"{p_k | k < n}$

=== Kernel (Null-Space / Kern)
Let $bold(A):= m times n$. The kernel is the set of vectors that is transformed to 0 by $bold(A)$.

The kernel can be found by solving the LGS $bold(A x = 0)$ with Gaussian Elimination. This provides infinite solutions for a singular matrix or the null vector for a regular system.

_Nullity_ - Dimensions of the null-space

Each linear space already has two simple subspaces:
- The kernel of its matrix
- The range of it as a transformation

=== Basis
_Linearly Dependant_ - A vector in the set is linearly dependent if other vectors in the set can express it as a linear combination. In the case of two vectors:
$
  alpha in RR\
  bold(v_1) = alpha bold(v_2)
$

This check can be restructured as a linear combination of several vectors $bold(v_n)$, where we find the kernel of them as a combined matrix, meaning the set of scalars which would express each column of the matrix as a linear combination of the other columns:
$
  bold(A) = mat(bold(v_1), bold(v_2), ..., bold(v_n)), bold(x) = vec(x_1, x_2, ..., x_n) in RR^n\
  bold(A x = 0)\
$
This can be rearranged for any columns of $bold(A)$:
$
  x_1 bold(v_1) + x_2 bold(v_2) + ... + x_n bold(v_n) = 0\
  bold(v_1) = (x_2 bold(v_2) + ... + x_n bold(v_n)) / (-x_1)
$
Therefore if only the trivial solution exists for $bold(x)$ (A is regular), all vectors $bold(v_n)$ are linearly independent. This is most easily checked through elimination.

_Basis_ - A set of linearly independent vectors that spans the entire linear space (minimal Erzeugenden system) and stay completely within the linear space (not allowed to span a parent space as well). There can be several independent bases in a space, but all bases have the same number of elements (dimension).

Any element in the linear space can be determined by a *unique* linear combination of the basis vectors.

_Canonical basis_ - Bases taken "as canon" (accepted standard) for each space, for example $e_x, e_y, e_z in RR^3$

#image("images/lu-base.png", width: 60%)
The basis of an erzeugenden system can be found through elimination, where the columns with a pivot are linearly independent of one another and therefore the corresponding columns in A are also a possible basis in the space.

==== Basis of $cal(P)_n$ are the monomes
Basis of $n in NN, cal(P)_n = {p_(i) = t^(i)| t in RR, i in NN_0 < n}$ - The monomes are linearly independent (proof in script) and span the entire polynomial space.

A trick for proving linear independence of certain items, for example polynomials $q_1, q_2, ...$ is expressing them in terms of another linear space that is known to be linearly independent, for example monomes and rearranging the basis check equation as follows:
$
  q_1 &= p_0 + p_2\
  q_2 &= p_0-p_2\
  q_n &= ...\
$
$
  x_1 q_1 + x_2 q_2 + ... &= 0\
  x_1(p_0 + p_2) + x_2 (p_0-p_2) + ... &= 0\
  (x_1 + x_2)p_0 + (x_1 - x_2)p_2 + ... &= 0\
  mat(1, 1, ...; 1, -1, ...; ...) vec(x_1, x_2, ...) = 0\
$
Since the monomes have already been proved to be linearly independent, we can construct the coefficients containing $x$ as an LGS with right hand side 0 and show that this matrix indeed only has the trivial solution (it is regular).

LTD: Continuous differentiable functions as monomes using the Taylor Series sounds like an interesting basis

==== Wronskian
Another method for checking the linear independence of $n$ differentiable functions $f_1, f_2, ... f_n$ is by finding the *Wronskian*:
$
  W(f_1, f_2, ... f_n)(
    x
  ) = det mat(
  f_1(x), f_2(x), ..., f_n(x);
  f'_1(x), f'_2(x), ..., f'_n(x);
  dots.v, dots.v, dots.down, dots.v;
  f^(n-1)_1(x), f^(n-1)_2(x), ..., f^(n-1)_n(x);
)
$
Where $f^(n)(x)$ is the n'th derivative of the function at $x$.

For only two functions:
$
  W(f, g) = f g' - g f'
$

If $W(...)(x) != 0 forall x in (a, b)$, the functions are linearly independent and suitable as a basis throughout the interval.

=== Dimensions
The number of elements in a basis of a space.

_Finite Dimensional Vector Space_ - A finite set of basis vectors spans the entire space.

Examples:
- Finite dimensional: $RR^n, cal(P)_n$ - Dimension = $n$. (Hence the awkward degree $<= n-1$ notation for $cal(P)_n$)
- Non-finite dimensional: $cal(P), C^k, L^2$

Sometimes non-finite dimensional spaces can be approximated using finite dimensional spaces (Taylor series).

#image("images/dimensions.png")

=== Fundamental Theorem of Linear Algebra (Gilbert Strang) <fundamental-theorem>
For a $n times k$ matrix $bold(A)$ with rank $r$:
$
  dim("Im"(bold(A))) = r\
  dim("Kernel"(bold(A))) = k -r = "Number of free variables"\
$
Transposing the matrix leads to ($"Rank"(bold(A)) = "Rank"(bold(A^T)$):
$
  dim("Im"(bold(A^T))) = r\
  dim("Kernel"(bold(A^T))) = n - r\
$
For example, considering a 3x3 matrix $P$ with rank 2:
- The transformation maps any $x$ onto a 2D plane due to only 2 independent vectors in the basis, the image has dimension 2. A solution only exists if the RHS vector is in this plane.
- The kernel of the matrix $P x=0$ includes an entire line of vectors, meaning that there is 1 free variable (the non-pivot column) that scales along this line.

LTD: Internalise / develop intuition

_Orthogonal Spaces_ - Two linear spaces are orthogonal $U perp V$ to one another when any two vectors in the spaces are always orthogonal to one another :$bold(<u\, v>) = 0$
$
  "Kernel"(A) perp "Im"(A^T)\
  "Im"(A) perp "Kernel"(A^T)
$
This law can be used to easily decompose any linear space into two orthogonal elements.

=== Coordinates
The coordinates of a specific element $x in RR^n$ formed using the basis $cal(B) = {v_1, v_2, v_3, ...}$ are written as:
$
  x = x_1 bold(v_1) + x_2 bold(v_2) + x_3 bold(v_3) + ...\
  cal(k_B): bold(V) -> RR^3:= vec(x_1, x_2, x_3, ...)
$
This mapping transforms a tuple of coordinates into the resulting point in $RR^n$ (commonly accepted canonical basis) using an abstract basis $cal(B)$ so that we can perform operations on elements in different abstract basis as one.

Coordinates can of course be transformed to coordinates of another basis in the same linear space:
- Both coordinates are unique for their underlying basis and both can be mapped to a unique element in a common linear space.
- Therefore each basis vector in the target basis can be represented as a linear combination of the original basis.

==== Change of Basis
Let us assume we are working in the linear space $RR^n$. We want to determine matrices that transform coordinates between bases $cal(B)_1$ and $cal(B)_2$:
+ Express the target basis $cal(B)_2$ vectors as coordinates in our basis $cal(B)_1$
+ Set these coordinates as columns of a matrix $bold(P): cal(B)_2 -> cal(B)_1$. The order should be consistent with the order of coordinates in $cal(B)_2$.
+ We can now multiply coordinates $bold(x) in cal(B)_2$, $bold(P x = b)$. This expresses the same linear combination of $cal(B)_2$ basis vectors, but in coordinates of $cal(B)_1$. $bold(b) in cal(B)_1 = bold(x) in cal(B)_2$
+ To convert from coordinates in $cal(B)_1 -> cal(B)_2$, we can simply use $bold(P)^(-1)$

This sheds a new light on transformations. Any square matrix with full rank can be interpreted to represent a change in basis.

=== Linear Transformations
Useful resource: https://www.3blue1brown.com/lessons/abstract-vector-spaces

Here is the formal definition of a linear transformation:
$
  cal(F): X -> Y\
  cal(F)(x_1 + x_2) = cal(F)(x_1) +cal(F)(x_2) forall x_1, x_2 in X\
  alpha cal(F)(x) = cal(F)(alpha x) forall x in X, alpha in RR
$
This therefore means that the origin stays fixed.

For example, derivation is a linear transformation:
#figure(
  image("images/linear-derivation.png", width: 50%),
) <fig-linear-derivation>

- Every linear transformation in a finite dimensional space can be represented as matrix multiplication.
- _Isomorphism_ - A structure-preserving mapping, ie a bijective linear transformation is a called an isomorphism. The inverse is clearly also an isomorphism. A non-square matrix changes dimensions and thus is not bijective and isomorphic - no inverse.
- _Automorphism_ - If the two sets the transformation maps between are the same.
- A linear transformation $cal(F)$ is injective when $"Kernel"(cal(F))={0}$.
- The same properties regarding dimensions sizes regarding basis apply to linear transformations:

#figure(
  image("images/linear-transformations.png", width: 80%),
) <fig-linear-transformations>

A linear transformation is independent of the basis / coordinates used and can be represented with respect to many different bases in the same space. The following diagram highlights these relationships well:
#figure(
  image("images/transformation-diagram.png", width: 80%),
) <fig-transformation-diagram>

==== Anti-linear (Conjugate-Linear) Transformation
$
  cal(A): X -> Y\
  cal(A)(x_1 + x_2) = cal(A)(x_1) +cal(A)(x_2) forall x_1, x_2 in X\
  alpha cal(A)(x) = cal(A)(overline(alpha) x) forall x in X, alpha in CC
$

==== Linear Form (Linear Functional)
Simply any *linear* transformation that maps a linear space to one dimension $V -> RR$ or $V -> CC$.

LTD: Quaternions

This can be something as simple as $phi(x) -> 0$ or the dot product.

===== Riesz Representation Theorem
Let $VV$ be a linear space with a dot product and linear form $phi$. There exists a unique vector $w in VV$ (called the Riesz representation) such that:
$
  phi(v) = space <w, v> forall v in VV
$
which can be represented in terms of any orthonormal basis ${b_1, b_2, ..., b_n} in VV$:
$
  w = overline(phi(b_1))b_1 + overline(phi(b_2))b_2 + ... + overline(phi(b_n))b_n
$
whereby the conjugation can be ignored if dealing with real linear forms.

This is a cool way of representing any linear form, essentially a regular linear transformation mapping to 1 dimension, as a single vector.

===== Dual Space
The linear vector space $V'$ of all linear forms of a linear vector space $V$, such that:
$
  phi, psi in V'\
  x in V, alpha in RR \/ CC\
  (phi + psi)(x) = phi(x) + psi(x)\
  alpha phi(x) = phi(alpha x)\
  alpha psi(x) = psi(alpha x)\
$

Each element of $V'$ can be represented as a vector thanks to the Riesz representation theorem.

== Norms
A norm is a function that transforms any element in a linear space to a positive real number. It must respect the following properties:
#figure(
  image("images/norm-properties.png", width: 80%),
) <fig-norm-properties>
#figure(
  image("images/norm-equivalence.png", width: 80%),
) <fig-norm-equivalence>

A basic example of a norm in $RR$ is the absolute function:
$
  x in RR\
  abs(x)
$
This is the only universal norm in one dimensional spaces.
TODO: How is this an isomorphism? https://en.wikipedia.org/wiki/Norm_(mathematics)

=== Taxicab Norm ($L^1$)
The name comes from the fastest zig zag path a taxi has to drive through in Manhattan's grid based street layout:
$
  norm(x)_1 := sum_(i=1) abs(x_i)
$
=== Euclidean Norm ($L^2$)
This ubiquitous norm represents the length of a vector and can alternatively be written in vector notation:
$
  x in RR^d\
  norm(x)_2 := sqrt(x^T x)\
  x in CC^d\
  norm(x)_2 := sqrt(x^H x)
$

=== p-Norm
$
  p in RR | p >= 1\
  norm(x)_p := (sum_(k=1) abs(x_k)^p)^(1 / p)
$
All $L^n$ norms can be generalised as the p-norm.

Any vector can be normed to a unit vector with respect to any p norm:
$
  x &in RR^d\
  e &= x / norm(x)_p\
  norm(e)_p &= 1
$
==== Maximum Norm ($L^oo$)
A special case of the p-Norm as p approaches $oo$:
$
  norm(bold(x))_oo := max(bold(abs(x_1)\, abs(x_2)\, ...))
$
The intuition behind this is that the largest element in the vector dominates the sum and therefore this norm effectively zooms in on the largest element.

Here is the unit circle as defined by various p-norms:
#figure(
  image("images/p-norm-unit-circle.png", width: 60%),
) <fig-p-norm-unit-circle>

Norming a vector with respect to this norm can be useful in proofs (for example the Gershgorin disks, we can prove an inequality for the largest element and ensure every other smaller element satisfies it too).

=== Cauchy-Bunjakovski-Schwarz Inequality
This is often regarded as the most important inequality in mathematics, it can be written in many different forms, the 3rd one is very intuitive:
$
  bold(v^T w) &<= bold(norm(v) norm(w))\
  bold(< v\, w > space &<= space <v\, v> dot <w\, w>)\
  bold(norm(v) norm(w)) cos(theta) &<= bold(norm(v) norm(w))
$
Where $norm(dot)$ is the Euclidean norm. This can be proven by induction.

Both sides are equal $<=>$ $v, w$ are linearly dependent (they point in the same direction and the angle between them is ${0degree, 180degree}$. Due to this, the angle definition of the dot product is actually an application of the inequality used throughout mathematics:
$
  cos(theta) = (<v, w>) / (norm(v) norm(w))
$

=== Matrix Norms
Every norm in $RR^n$ defines a corresponding matrix norm, which is a measure of how much that norm is affected after the matrix is applied as a linear transformation:
$
  bold(A) in RR^(m times n)\
  bold(x) in RR^n | norm(bold(x))_p = 1\
  norm(bold(A))_p := max(norm(bold(A x))_p)
$

Here are some examples:

==== Maximum Column Sum ($norm(dot)_1$)
In this case $x = vec(0, 0, ..., 1, ...)$ so that $norm(x)_1 = 1$.

$A x$ results in each column at a time. When the 1 norm is applied to each column, the sum of the column's elements is returned.

Therefore this simply returns the maximum column sum:
#figure(
  image("images/max-column-sum.png", width: 60%),
) <fig-max-column-sum>

==== Maximum Row Sum ($norm(dot)_oo$)
The maximum transformation allowed is when $x = vec(1, 1, 1, ...)$.

$A x$ results in the sum of each row:
#figure(
  image("images/max-row-sum.png", width: 60%),
) <fig-max-row-sum>

==== Spectral Norm ($norm(dot)_2$)
This is a measure of the maximum factor by which a matrix increases the Euclidean norm (lengths) of vectors in space - an extremely useful result.

It can be calculated as follows:
$
  norm(bold(A))_2 =sigma_"max" (bold(A)) = sqrt(lambda_"max" (bold(A^H A)))
$
If $bold(A)$ is normal:
$
  norm(bold(A))_2 = abs(lambda_"max" (bold(A)))
$
Therefore, if $bold(A)$ is diagonal this is simply the largest absolute diagonal value.

Furthermore, the spectral norm a matrix's inverse can be intuitively calculated as:
$
  norm(bold(A)^(-1))_2 = 1 / (sigma_"min" (bold(A)))= 1 / sqrt(lambda_"min" (bold(A^H A)))
$

The intuition stems from the fact that the SVD of *any matrix* $bold(A)$ can be rewritten as:
$
  bold(A V = U Sigma)
$
where $bold(Sigma)$ is a diagonal transformation, meaning it only scales space along an orthogonal basis. $bold(U)$ and $bold(V)$ are unitary and have no effect on lengths, therefore the largest diagonal element (singular value $sigma_i$) of $bold(Sigma)$ is the maximum increase in the Euclidean norm.

SVD also shows us that the singular values are equal to the magnitude of the eigenvalues in the case of a normal matrix $bold(A)$:
$
  bold(A = U Lambda U^T)\
  bold(A^T A =  U Lambda^T Lambda U^T)\
  bold(Lambda^T = Lambda)\
  therefore bold(sigma(A) = sqrt(lambda(A^T A)) = sqrt(lambda(A^2)))\
  = abs(bold(lambda(A)))
$

==== Condition Number
This is a measure of how sensitive an operation is to changes in input and how accurately the inverse of a matrix can be computed:
$
  k(bold(A)) = norm(bold(A))_2 norm(bold(A^(-1)))_2 = sigma_max(bold(A)) / sigma_min(bold(A))
$
For a symmetric matrix $bold(A)$:
$
  k(bold(A)) = sqrt(abs(lambda_"max" (bold(A)))/abs(lambda_"min" (bold(A))))
$

It is purely a property of a matrix based on how much bigger the maximum eigenvalue is than the minimum eigenvalue - ie how much more a matrix stretches vectors in a specific direction than the others - which makes it less "unitary" and more susceptible to rounding errors.

- $k=1$ - The matrix is said to be well-conditioned
- $k >> 1$ - Such a matrix is almost singular and is very prone to errors, a tiny change in the vector it is applied to has a drastic effect on the output.
- $k = oo$ - The matrix has a singular / eigenvalue 0 and part of space is sent to the origin, meaning numerical solutions involving the matrix are very unreliable.

When a matrix comes from the result of a previous calculation, and some of its singular values are very close, but not equal to 0, it can be suspected that this slight deviations arose due to rounding errors. Therefore, many Linear Algebra packages offer the option to define a *numerical rank*, which is a limit under which singular values are considered as 0. TODO: read chapter 3 numerical methods for linear control systems

LTD: Benchmark condition numbers of different types of matrices.

==== Entry-Based Matrix Norms
The general $L_(p, q)$ norms ignore the structure of a matrix and treat its entries as one big $m dot n$ vector, stemming from the *Frobenius inner product*, a finite dimensional version of the inner (dot) product on Tensor spaces (elements are matrices instead of vectors) $norm(A)_F := sqrt(bold(<A\, A>)_F)$.

The $L_(p, q)$ norms are defined as:
$
  bold(A in CC^(m times n))\
  norm(bold(A))_(p, q) := (sum_(j=1)^n (sum_(i=1)^m abs(a_(i j))^p)^(q / p))^(1 / q)
$

The *Frobenius Norm* is the special $L_(2, 2)$ case:
$
  norm(bold(A))_F := sqrt(sum_(j=1)^n sum_(i=1)^m abs(a_(i j))^2) = sqrt("trace"(bold(A^H A))) = sqrt(sum_(i=1)^(min(m, n)) sigma_i^2(bold(A)))
$

The Frobenius Norm in particular is also an example of a *Schatten norm*:
$
  norm(bold(A))_p := (sum_(i=1)^(min(m, n)) sigma_i^p(bold(A)))^(1 / p)
$

Another example is the so-called *Nuclear norm*:
$
  norm(bold(A))_* := sum_(i=1)^(min(m, n)) sigma_i(bold(A))
$

== Inner Products
In Euclidean space, the dot product is an inner product.
#figure(
  image("images/dot-products.png", width: 80%),
) <fig-dot-products>
A _positiv semi-definite_ operation is not an inner product.

Any operation that satisfies these properties leads to its corresponding norm being defined as:
#figure(
  image("images/norm-of-dot-product.png", width: 80%),
) <fig-norm-of-dot-product>
#figure(
  image("images/orthogonal-dot-product.png", width: 80%),
) <fig-orthogonal-dot-product>
$
  u perp v <=> <u, v> = 0
$

=== Hilbert Space
_Inner Product Space_ - A vector space with an inner product defined over its members\
_Complete Space_ - An inner product space where every Cauchy sequence with members in the space also converges towards a member of the space. This is a rigorous way of saying that the space is not missing any points.

The most obvious example is the Euclidean vector space, with the dot product defined as its inner product. However, the same can be done with other spaces, for example the inner product of the continuous differentiable functions:
$$
TODO: Find precise name for this space and explain intuitive similarity to dot product.

=== Projectors
_Projector_ - A linear transformation such that repeated application has no effect:
$
  bold(P_y P_y ... )&= bold(P_y)
$
Thus, projection is idempotent (can be applied arbitrarily many times without changing after the first application).

==== Orthogonal Projection
#figure(
  image("images/orthogonal-projection-definition.png", width: 80%),
) <fig-orthogonal-projection-definition>

Grahically, the projection of $bold(x)$ onto $bold(y)$ looks like this:
#figure(
  image("images/orthogonal-projection.png", width: 40%),
) <fig-orthogonal-projection>
Since $(bold(x-u)) perp bold(y)$, we can derive the scalar $alpha$ as:
$
  alpha = bold((<y, x>) / (<y, y>))
$
Thus, we can express the orthogonal projection of a vector onto $bold(y)$ as the following function:
$
  P_y: VV -> VV\
  P_y (x) := bold((<y, x>) / (<y, y>) y)
$

==== Projectors
_Projector_ - Projection represented in matrix form, for example the orthogonal projection in the previous example can also be calculated using a matrix:
$
  P_y (x) &= bold((y y^H) / norm(y)^2 x)\
  &= bold(P_y x)
$

Projectors have the following properties:
- Every "successful" projection lies along the target $"Im"(bold(P_y)) = "Span"{bold(y)}$.
- The kernel of every projector is the span of orthogonal vectors $"Kern"(bold(P_y)) = "Span"{bold(x) | bold(x) perp bold(y)}$; these are the eigenvectors with eigenvalue 0
- They are therefore non-invertible

#figure(
  image("images/orthogonal-hermetian.png", width: 80%),
) <fig-orthogonal-hermetian>

=== Unit Vectors
#figure(
  image("images/unit-vector.png", width: 80%),
) <fig-unit-vector>
In a linear space with dimensions $n$, $n$ orthogonal unit vectors therefore form a basis in this space, because they are all linearly independent.

The dot product of any vector $bold(x)$ with a unit vector is simply the component of $bold(x)$ in the direction of the unit vector, which is very useful throughout physics when dealing with components that are not along a predefined axis:
$
  bold(x) &in RR^n\
  bold(<e\, x>) &= bold(norm(x) norm(e))cos(theta) = bold(norm(x)) cos(theta)\
$

Furthermore, this implies that any point can be represented as the sum of its projections onto a basis $BB$. This is essentially what the coordinate function defined earlier does:
$
  bold(x) &= sum_(e in BB) P_(e) (x)\
  &= sum_(e in BB) bold((<e, x>) / (<e, e>) e)
$
If the basis $B$ uses unit vectors (normal), this simplifies to:
$
  &= sum_(e in BB) bold(<e\, x>) / 1 bold(e) = norm(bold(x)) cos(theta) arrow(bold(e))\
$
This can also be used to project a vector into a subspace through a smaller dimensional identity matrix looking ahh:

TODO: Lecture 14 & 15 Gilbert Strang, unsure what script means here

== Gram-Schmidt
LTD: Inner product or dot products?

=== Theorem
The span of any set of linearly independent vectors can be spanned by a set of orthonormal vectors.

In other words, any basis can be converted to an orthonormal basis.

It is very computationally advantageous to use an orthonormal basis whenever possible. Many commonly used operations are simplified, for example when projecting an element onto an orthonormal basis as mentioned in the previous chapter.

=== Method
We would like to transform the basis $VV = {v_1, v_2, ..., v_n} -> UU = {e_1, e_2, ..., e_n}$ where $UU$ is orthonormal.

This is carried out in 2 steps:
1. Orthogonalize the vectors by recursively subtracting the previous $n$ elements of the resulting basis, the first vector can remain unchanged:
$
  u_1 &= v_1\
  u_2 &= v_2 - P_(u_1)(v_2)\
  u_3 &= v_3 - P_(u_1)(v_3) - P_(u_2)(v_3)\
  ...\
  u_k &= v_k - sum_(i=1)^(k-1) P_(u_i)(v_k)
$
2. The resulting vectors are then normalised (this does not affect their orthogonality):
$
  e_k &= u_k / norm(u_k)\
$

The process is visualised in 3D here, showing how subtracting the projected vector results in the orthogonal "missing piece of the triangle" for each projection: https://upload.wikimedia.org/wikipedia/commons/e/ee/Gram-Schmidt_orthonormalization_process.gif

If the $bold(0)$ vector is output at any stage, the input vectors are linearly dependent.

=== Stability
When calculating the recursive method, the resulting vectors are usually not quite orthogonal due to rounding errors, which becomes worse after each iterative subtraction of projections.

This can be alleviated by instead projecting the "orthogonaler" $u_(k-1)$ at each stage of the iterative subtraction:
#figure(
  image("images/modified-gram-schmidt.png", width: 40%),
) <fig-modified-gram-schmidt>

This of course results in more computation but significantly reduces rounding errors. Other orthogonalisation algorithms seen in chapter *QR decomposition* using Householder matrices / rotations can have reduced error rates.

=== Legendre Polynomials
The most straight-forward bases for $cal(P_n)$ are the monomes, but they are not orthonormal. Using the Gram-Schmidt method, the *Legendre Polynomials* can be derived from them, allowing us to represent any polynomial through an orthonormal basis (for proof see `./exercises/legendre-polynomials.pdf`)

There are many other such sets of polynomials with special names, for example Hermite and Laguerre polynomials.

=== QR Decomposition
TODO: Consider moving to QR section, linear vector spaces, norms, dot products, orthogonal, gram-schmidt, qr,

The matrix $bold(A)$ with columns ${v_1, v_2, ..., v_n}$ can be decomposed into matrices $bold(Q R)$ because the Gram-Schmidt is an orthogonalization process just like rotation / reflection:
1. Calculate the corresponding orthonormal vectors ${e_1, e_2, ..., e_n}$ using the Gram-Schmidt process
2. Each column in $bold(A)$ can now be expressed as a linear combination of the new orthonormal basis as projections onto the unit vectors:
$
  v_k = sum_(i=1)^k P_(e_i) (v_k) = sum_(i=1)^k <e_i, v_k>e_i
$
3. Therefore this set of linear combinations can be represented as matrix multiplication $bold(Q R)$ where:
$
  bold(A &= Q R)\
  &=
  mat(e_1, e_2, ..., e_n)
  mat(
  <e_1\, v_1>, <e_1\, v_2>, ..., <e_1\, v_n>;
  0, <e_2\, v_2>, ..., <e_2\, v_n>;
  0, 0, ..., <e_3\, v_n>;
  dots.v, dots.v, dots.down, dots.v;
  0, 0, ..., <e_n\, v_n>;
)
$

Advantages:
- Straightforward implementation and slightly more computationally efficient
Disadvantages:
- Very numerically unstable compared to other orthogonalization methods

== Determinants
#figure(
  image("images/multilinear-function.png", width: 70%),
) <fig-multilinear-function>
The determinant is multilinear transformation only defined for square matrices:
$
  det: CC^(n times n) -> CC
$
#figure(
  image("images/determinant.png", width: 70%),
) <fig-determinant>
There is no other function that fulfils these properties.

=== Properties
- Adding a linear combination of other rows does not affect the matrix's determinant:$
  bold(A = L U) => det bold(A) = det bold(U)\
  bold(P A = L U) => det bold(A) = det bold(P) dot det bold(U)
$
- A zero column or row means the matrix must have $det dot = 0$, it doesn't have full rank.
- The determinant of any *upper* square matrix is the product of its diagonals
- $
    det bold(A B) = det bold(A) dot det bold(B)
  $
- $
    det bold(A^T) = det bold(A)\
    det bold(A^H) = overline(det bold(A))
  $
- $
    det bold(A^(-1)) = 1 / (det bold(A))
  $
- $
    det bold(Q) = 1 or -1
  $ Orthogonal matrices either rotate or reflect space and are unitary. However, this is no guarantee of orthogonality.
- It is the factor by which the n-dimensional volumes (the volume spanned by $n$ vectors) are scaled after the matrix's transformation is applied (LTD: relate to bivectors).
- A 0 determinant geometrically implies that it transforms the volume to 0 $->$ down a dimension. Information is lost and the transformation cannot be inverted.

These properties are useful for making statements about the singularity of various matrix products.

The determinant can be calculated using a variety of methods, however it is most commonly done alongside Gaussian elimination.

LTD: It can also be used to find the inverse and solve LGS: Cramer's Rule, although this isn't computationally efficient.

=== Gaussian Elimination
After the matrix has been eliminated to row-echelon form (upper matrix, pivots haven't been reduced to 1), the determinant is equal to the product of all the diagonal elements.

This makes intuitive sense - if the matrix doesn't have full rank (more columns than pivots) there will be a 0 on the diagonal and hence the diagonal product & determinant are also equal to 0; the matrix is not invertible.

It is perfectly fine to swap rows using a permutation matrix, the resulting determinant is simply $det bold(P) dot det bold(A)$. To avoid the need to calculate the permutation matrix's determinant: each time two rows are swapped the sign flips (multiply the determinant by $times -1$).

The following formulae for $2 times 2$ matrices can be derived from this method:
$
  abs(mat(a, b; c, d)) = a d - b c
$
Which is a useful result when performing Laplace Expansion.

=== Laplace Expansion
This method uses the determinant of minor matrices multiplied by signed elements of a row or column, making it useful for calculating low dimensional determinants where certain rows / columns already have many 0s.

+ Choose a row or column with as many 0 elements as possible to minimise the amount of minor determinants we need to calculate.
+ Traverse through the row, multiplying the element of the row by its minor. The signs alternate, starting with positive, and sum all of the individual results

For example when calculating the determinant of a $m times n$ matrix by traversing the first row:
$
  bold(M) = "Minors of A"\
  det bold(A) = sum_(j = 1)^n (-1)^(j+1) dot bold(A_(1,j)) dot det bold(M_(1, j))
$

== Eigenwerte und Eigenvektoren
_Eigenvectors_ - Vectors which a linear transformation scales onto the original line it spans.\
_Eigenvalues_ - The corresponding scalar by which a set of eigenvectors is multiplied by.\
_Eigenspace_ - The space containing all eigenvectors for a given eigenvalue - $"Span"{x | A x = lambda x}$
_Spectrum_ - The set of eigenvalues of a matrix.

These are very important when analyzing the effects of linear transformations without a standard basis. For example one can find the axis of a rotation of an arbitrary 3D rotation (vectors with eigenvalue 1).
LTD: More applications!

Some transformations, for example rotations, have no real, non-zero eigenvalues.

=== Properties
- The diagonal elements of an upper square matrix in reduced form are its eigenvalues; algebraic multiplicity can also be easily read from this form. LTD: Find / write proof
- $"det" bold(A) = product lambda_i$ - The determinant is equal to the product of eigenvalues.
- $"trace" bold(A) = sum lambda_i$ - Sum of diagonal elements of a matrix. This is equal to the sum of eigenvalues.
- Any vector which can be expressed as a linear combination of eigenvector(s) with the same eigenvalue is also also an eigenvector of the same eigenvalue (fundamental rules of linear transformations) - all vectors in the same line have the same eigenvalue. Furthermore, a single eigenvalue may have an $n >= 1$ dimensional eigenspace - any vector in this space also has the same eigenvalue.
$
  bold(x) &= alpha bold(y) + beta bold(b)\
  A(bold(x)) &= lambda(alpha bold(y) + beta bold(b))\
  &= lambda bold(x)
$
- If a matrix has an eigenvalue 0 it must be singular (there is a line of vectors that all become the same zero vector, information is lost and cannot be reversed). The eigenspace for $lambda = 0$ is simply the null space of the original matrix.
- The inverse of a matrix has the same eigenvectors, and eigenvalues $1/(lambda_n)$ (because it brings scaled eigenvectors back to their original length).
- The eigenvalues of repeated transformations $A^k$ are simply powered: $(lambda_n)^k$ because the same eigenvectors are simply repeatedly scaled.
- $bold(A)$ and $bold(A^2)$ do *not* necessarily have the same eigenvalues as signs are lost.
- Scalar multiplication of a matrix leads to eigenvalues multiplied by the same scalar - matrices represent linear transformations hence $alpha bold(A(x)) = bold(A)(alpha bold(x)) = alpha lambda bold(x)$.
- Addition / multiplication of matrices does not necessarily mean the eigenvalues can be added / multiplied, algebraic rearrangement can be used to find eigenvalues of a polynomial of a matrix.
- If $bold(A)$ is square, $bold(A^T)$ has the same pivots and therefore the same spectrum.
- (Scaled) rotation matrices have only complex pairs of eigenvalues, total amount n.

=== Finding Eigenvalues / Vectors
The eigenvalues $lambda$ and eigenvectors $bold(v)$ of a matrix $bold(A)$ relate as follows:
$
  bold(A v) = lambda bold(v)\
$
Which can be rearranged using a scalar matrix, allowing us to find the eigenvectors for a given eigenvalue:
$
  bold(A v) = lambda bold(I v)\
  (bold(A) - lambda bold(I))bold(v) = 0
$
The infinite non-zero solutions (eigenvectors) for $bold(v)$ are only possible when $det(bold(A) - lambda bold(I)) = 0$. Computing this determinant results in a polynomial in terms of $lambda$ with degree $n$ which can be solved to find all possible eigenvalues. This is called the *characteristic polynomial*.

- Polynomials can also have complex solutions, hence real matrices can have $lambda in CC$, which come in pairs with their conjugates.
- Multiplication by $times -1$ whilst swapping rows during elimination to find the characteristic polynomial can be ignored, because it is $=0$ anyway.
- An $n times n$ matrix has $[1, n]$ real eigenvalues due to the fundamental theorem of algebra.
- _Algebraic Multiplicity_ - This tells us how many times a root is repeated. For example the characteristic equation $(lambda - 1)^2 (lambda-4)=0$ has AM 2 for $lambda = 1$.
- _Geometric Multiplicity_ - Dimensions of an eigenspace. If the eigenvectors for an eigenvalue are linearly independent, this is the same as the AM, otherwise it's less:
$
  1 <= "GM"(lambda) <= "AM"(lambda) <= n
$

Once we find the eigenvalues of the matrix, the matrix $bold(A) - lambda bold(I)$ can be computed for each one and finding the eigenspaces (each set of eigenvectors) simply becomes the task of finding the different nullspaces, for which we have already calculated the reduced form of $bold(A)$ whilst finding the characteristic equation:
$
  bold(A_(lambda_1) v) = 0\
  bold(A_(lambda_2) v) = 0\
  ...
$
The dimensions of each eigenspace can be calculated thanks to the Fundamental Theorem of Linear Algebra:
$
  dim("Kernel"(bold(A_(lambda_i)))) = "Columns" -"Rank" = "Number of free variables"
$
Where $bold(A_(lambda_i)) = bold(A) - lambda_i bold(I)$.

==== Solving the Characteristic Polynomial
If eigenvectors are needed as well as the eigenvalues, it is best to compute $det(bold(A) - lambda bold(I))$ using Gaussian elimination (IMPORTANT: This is not equal $det(bold(A)))$, so that the reduced form can be reused in the above eigenvector LGSs.

Handling the $lambda$s in elimination can be tricky when all other elements in that column are either 0 or in terms of $lambda$. Sometimes a row can be multiplied / divided by a term involving $lambda$ (for example $(lambda+2)$) allowing it to eliminate another element in the same column. However, this often results in characteristic polynomials too complicated to solve (in which case Laplace expansion is often better) and is more useful for inserting $lambda$ and finding the eigenspaces.

*Vieta's Formulae* are useful finding / checking eigenvalues, especially when some are already known / can be deduced from the constant term:
$
  a x^3 + b x^2 + c x + k = 0 => -k "is a root"
$
They are as follows:
$
  -b / a &= sum alpha\
  c / a &= sum alpha beta\
  -d / a &= sum alpha beta gamma\
  ...
$
Where $sum alpha$ represents the sum of roots, $sum alpha beta$ the sum of root pairs and so on.

=== Gershgorin Disk Theorem
Polynomials of degree $n >= 5$ have no definite formula for solutions, eigenvalues of matrices with more than 4 columns must be found using numerical methods, expensive and numerically unstable operations.

A matrix norm (measure of how much a transformation affects space) is by definition the maximum scalar by which vector lengths are multiplied. Therefore:
$
  abs(lambda) <= norm(bold(A))
$

The Gershgorin Disk Theorem defines an easy-to-compute area in which all eigenvalues can be found:
#figure(
  image("images/gershgorin-theorem.png", width: 80%),
) <fig-gershgorin-theorem>
In simple terms, all eigenvalues of a matrix can be found in the circles with centers at the diagonal value, such that the radius is less than the absolute sum of all other terms on the row.

This allows us to narrow down the range of values checked in numerical methods, vastly reducing computation.

#figure(
  image("images/diagonal-dominant.png", width: 80%),
) <fig-diagonal-dominant>
Each Gershgorin circle of the matrix has a radius smaller than its center position, hence 0 is never an eigenvalue and it must be regular.

== Diagonal Matrices
_Diagonal Matrix_ - A matrix with 0 entries everywhere except the diagonal.

They are very useful in applications as multiplying by a diagonal matrix only affects the same row:
$
  mat(
  a_1, 0, 0;
  0, a_2, 0;
  0, 0, a_3;
) vec(bold(x_1), bold(x_2), bold(x_3)) = vec(a_1 bold(x_1), a_2 bold(x_2), a_2 bold(x_3))
$
which is for example useful when solving linear differential equations. It is also extremely computationally efficient

They are square most of a time, but a non-square diagonal matrix simply takes the form:
$
  mat(
  a_1, 0, 0;
  0, a_2, 0;
  0, 0, a_3;
  0, 0, 0
)
$

$"diag"(a_1, a_2, ...)$ notation can be used to specify a diagonal matrix with diagonal entries in that order.

The inverse of a diagonal matrix $bold(D^(-1))$ can be computed if there are no 0s (full-rank) on the diagonal and the matrix is square. It simply involves replacing diagonal elements with their reciprocal $1/x$.

_Scalar Matrix_ - Diagonal matrix with the same diagonal entries, multiplying by it has the same effect as scalar multiplication.

=== Similar Matrices
Two $n times n$ matrices $bold(A)$ and $bold(B)$ are similar if there exists an invertible matrix $bold(P)$ such that:
$
  bold(A = P^(-1) B P)
$

Transformations in this form are ubiquitous, for example a transformation which is awkward to calculate in the canonical basis can be written using a change of basis matrix $bold(P)$, the easier to compute equivalent transformation $bold(B)$ in the new basis, followed by a return to the original basis $bold(P^(-1))$.

Intuitively the matrices $bold(A)$ and $bold(B)$ represent the same transformation in different bases, hence the name *similar*.

As a result of this, similar matrices have *the same eigenvalues* which all have *the same algebraic multiplicity*.

=== Diagonalization
A matrix which is similar to a diagonal matrix $bold(D)$ can be called *diagonalizable*:
$
  bold(A = P^(-1) D P)
$

*An $n times n$ matrix $bold(A)$ with $n$ linearly independent eigenvectors can be diagonalized* by setting those eigenvectors ${bold(s_1), bold(s_2), ..., bold(s_n)}$ as columns of a matrix $bold(S)$:
$
  bold(S) &= mat(bold(s_1), bold(s_2), ..., bold(s_n))\
  bold(S^(-1) A S = Lambda) &= mat(
  lambda_1, 0, ..., 0;
0, lambda_2, ..., 0;
dots.v, dots.down, dots.v, dots.v;
0, 0, ..., lambda_n)\
  bold(A &= S Lambda S^(-1))
$
Therefore a similar diagonal matrix can simply be formed using its eigenvalues in any order (as long as $bold(S)$ is consistent with this order):
$
  bold(D) = "diag"(lambda_1, lambda_2, ...)
$
Those eigenvalues do not need to be unique (although unique eigenvalues guarantee linear independence and diagonalization) - some may have geometric multiplicity $>1$. However, the chosen eigenvectors must be independent to ensure $bold(S)$ is invertible and represents a basis one can switch to.

When visualising this decomposition in the order $bold(S^(-1) A S = D)$, the change of basis matrix $bold(S)$ changes the canonical basis to an eigenvector basis. $bold(A)$ is then applied, which of course scales the eigenvector basis by $lambda_i$ (every vector is also scaled accordingly, as they are simply combinations of the eigenvector basis), after which $bold(S^(-1))$ rotates / reflects space back to the original canonical basis. The basis vectors have been scaled by the eigenvalues, such that the original canonical unit vectors now have length $lambda_i$, forming the diagonal $Lambda$ matrix.

Calculating a diagonal form of the matrix (albeit in another basis) can be extremely useful for simplifying calculations, for example calculations where raw access to its eigenvalues is useful, or analyzing the properties of the transformation it represents.

#figure(
  image("images/diagonalisability.png", width: 90%),
) <fig-diagonalisability>
To be able to chose n independent eigenvectors, $sum "GM" = n$. The fundamental theorem of algebra states $n = sum "AM"$, hence if any eigenvalue's GM $<$ AM it cannot be diagonalized - such eigenvalues are called *defective*.

== Normal Matrices
Identities in terms of the Hermetian $bold(A^H)$ of a matrix will also be assumed to be valid for the real tranpose unless stated otherwise.

$
  bold(A) "is normal" <=> bold(A^H A = A A^H)
$

A useful property of *only* normal matrices is that $n$ eigenvectors *can always be chosen to be orthogonal* to each other:
- If there are $n$ distinct eigenvalues, these eigenspaces are *orthogonal* to one another
- If there are eigenvalues with geometric multiplicity $> 1$ this is not an issue. For example, all vectors are eigenvectors of the identity matrix's only eigenvalue $lambda = 1$, and we can choose any $n$ dimensional orthogonal basis without issues to satisfy this statement.
$
  bold(A) "is normal" <=> bold(A) "has n orthogonal eigenvalues" => bold(A) "is diagonalizable!"
$
However, the only condition for diagonalizability is *linearly independent* eigenvectors (they do not need to be perfectly orthogonal), hence not all diagonalizable matrices are normal.

Therefore, they are diagonalisable through an ortho(normal) change of basis matrix - the chosen eigenvectors are not just linearly independent but also orthogonal to each other:
$
  bold(A = Q Lambda Q^(-1)= Q Lambda Q^T)\
$
Dividing each column by its norm can make the orthogonal matrices orthonormal.

This is an incredibly useful statement for computation - computers love orthonormal and diagonal matrices!

This is be generalised with unitary matrices (entries can be complex) as the so called *Spectral Theorem*:
$
  bold(A) "is normal" => bold(A = U Lambda U^H)
$
The inverse does *not* always apply - not all diagonalizable matrices are normal!

LTD: Reason for name, investigate optics applications

=== Symmetric Matrices
A square matrix may be symmetric across its diagonal:
- _Symmetric_ - $bold(A^T) = bold(A)$
- _Antisymmetric_ - $bold(A^T) = -bold(A)$
- _Hermetian Symmetric_ - $bold(A^H) = bold(A)$

Hence, symmetric matrices are a subset of the normal matrices:
$
  bold(A^H A = A A = A A^H)
$

=== Properties
- The sum of two symmetric matrices is also symmetric
- $A^n$ is also symmetric
- $A "is symmetric" <=> A^(-1) "is symmetric"$
- Since they are normal, eigenvectors can always be chosen to be orthogonal.
- Additionally, *eigenvalues* of a symmetric (including Hermetian symmetric!) matrix are *guaranteed to be real*!
- The number of positive pivots is equal to the number of positive eigenvalues (and vice versa for negatives). This is of similar use as Gershgorin's Circle theorem for estimating eigenvalues of matrices with high order characteristic polynomials.
- All eigenvalues of an antisymmetric matrix are purely imaginary $lambda = b i | b in RR$, despite this their eigenvectors can still be chosen as orthogonal.
- $<x, A y> = x^H A y = x^H A^H y = <A x, y>$ is valid for a symmetric matrix $A in RR^(n times n) union CC^(n times n)$

=== Symmetric Positive-Definite Matrices
These are symmetric matrices which have *only strictly-positive* (non-zero) eigenvalues and therefore only strictly positive pivots (and therefore full-rank; *invertible*).

Therefore the determinant (product of eigenvalues / pivots), as well as all determinants of "sub" matrices with $n-k$ dimensions are also positive (we can't only rely on the "total" determinant, it may have two negative eigenvalues).

Another way of checking this is ensuring the dot product of all vectors before and after the transformation is $>= 0$:
$
  forall bold(x) in RR^n | <bold(x), bold(A x)> = bold(x^T A x) >= 0\
  <bold(x), bold(A x)> = 0 => bold(x) = 0\
$
If the zero vector checking condition is not satisfied, the matrix is called *semi positive-definite* - in other words some non-zero vectors are either sent to the zero vector or become orthogonal. It must have at least one 0 eigenvalue.

== Non-Diagonalizable Decomposition
Regular diagonalization only works for square matrices with $n$ independent eigenvectors. However, there are some slightly less convenient methods which are able to almost diagonalize rectangular / defective matrices.

=== Schur Decomposition
All complex *square* matrices (not only normal) are unitarily similar (unitary change of basis matrices) to an upper matrix (may contain complex elements) with its eigenvalues as its pivots.
$
  bold(A = Q U Q^(-1) = Q U Q^(H))
$

If $bold(A)$ is real, it is orthogonally similar to a _block upper matrix_, such that when represented as a block matrix using $1 times 1$ and $2 times 2$ sub matrices, all entries below the diagonal are zero.

The existence of this decomposition is more relevant than using it and it as a useful ingredient in many fundamental proofs.

==== QU Algorithm
This is an algorithm based on QU decomposition for finding a similar matrix using unitary change of basis vectors, ie computing the Schur decomposition:
+ Compute the QU decomposition: $bold(A = Q U)$
+ Let $bold(A_(k+1) = U Q)$
+ $bold(A_(k+1)= Q^(-1) Q U Q = Q^H A Q)$
+ Keep iterating until $bold(A_(k+1))$ converges to an upper matrix, the Schur decomposition is then solved and can be rearranged to $bold(A = Q A_(k+1) Q^H)$

=== Jordan Form
This is based on the same principle as regular diagonalisation, with the difference that the eigenvectors which would be columns of $bold(S)$ are not required to be linearly independent, hence $bold(S)$ would not be guaranteed invertible. The set of eigenvectors are extended through linearly independent *generalized eigenvectors*, allowing them to be always be used as a change of basis matrix.

An almost diagonal, similar _Jordan matrix_ can be found for square non-diagonalizable matrices, which is composed of so-called _Jordan Blocks_:
$
  bold(J_(lambda, n)) in RR^(n times n)\
  bold(J_(lambda, n)) = mat(
  lambda, 1, ,0;
  ,dots.down,dots.down,;
  ,,dots.down,1;
  0,,,lambda
)
$
which consist of an eigenvector of the original matrix on the diagonals, 1s directly above each diagonal element (superdiagonal) and 0s everywhere else.
- They can also be formed with 1s under the diagonal (subdiagonal), in which case all of the following information still applies.
- These blocks can also have dimensions $1 times 1$, meaning that that particular eigenvalue has the same AM and GM (and its block appears AM / GM times).

Consider the *square* matrix $bold(A) in RR^(n times n)$, which has eigenvalues $lambda_1, lambda_2, ..., lambda_k$. There is an invertible matrix $bold(S)$ such that:
$
  bold(A = S "diag"(J_(lambda_1, "AM"(lambda_1)), J_(lambda_2, "AM"(lambda_2)), ..., J_(lambda_k, "AM"(lambda_k))) S^(-1))
$

Here is an example of a Jordan Matrix, where eigenvalue $lambda_1$ has AM 3:
#figure(
  image("images/jordan-matrix.png", width: 40%),
) <fig-jordan-matrix>
The decomposition is not unique but there is only one possible $bold(S)$ for a specific order of Jordan Blocks along the diagonal.

We can read the following properties about $bold(A)$ by looking at its corresponding Jordan Matrix:
- All of its eigenvalues are along the diagonal
- The total number of times an eigenvalue appears on the diagonal indicates its algebraic multiplicity (sum of dimensions of all blocks belonging to that eigenvalue).
- The number of discrete Jordan blocks for a specific eigenvalue indicates its geometric multiplicity.

==== Finding S
_Generalized Eigenvectors_ - These are a sequence of linearly independent vectors for an eigenvalue $lambda$ generated by starting with a real eigenvector $bold(v_1)$ and calculated iteratively using:
$
  bold((A - lambda I) v_(n+1) = v_n)
$
Where $v_(n+1)$ is the next generalized eigenvector and can be found using Gaussian elimination.

+ Find the characteristic polynomial of $bold(A)$ and its eigenvalues + their AMs. Calculate the GM of each eigenvalue by calculating the nullity of $bold(A - lambda I)$ (n - rank)
+ Construct the set of Jordan Blocks accordingly and place them along the diagonal to form the Jordan Matrix.
+ For each column with *no super- / subdiagonal 1* in the Jordan Matrix, we can simply set a linearly independent eigenvector in the corresponding column of $bold(S)$ and move on.
+ For each column *with a super- / subdiagonal 1*, the eigenspace lacks enough linearly independent vectors and we have to create a new generalized eigenvector based on the previous column eigenvector / generalized eigenvector in the block.
+ Once $bold(S)$ is complete, calculate its inverse using Gauss-Jordan elimination and assemble the final decomposition: $bold(A = S A S^(-1))$

=== Singular Value Decomposition
Singular value decomposition (SVD) allows us to "diagonalize" *all* matrices using unitary change of basis matrices, with the downside that the "change of basis" matrices are different and therefore need to be calculated twice:
$
  bold(A) in RR^(m times n), bold(U) in RR^(m times m), bold(V) in RR^(n times n)\
  bold(Sigma) in RR^(m times n) = "diag"(sigma_1, sigma_2, ..., sigma_p), p = "min"(
    m, n
  ), sigma_1 >= sigma_2 >= ... >= sigma_p >= 0\
  bold(A = U Sigma V^H)
$
There are multiple (but finite) possible decompositions for a given matrix. This depends on order of singular values on the diagonal and their underlying geometric multiplicy.

This can be rearranged to:
$
  bold(A V = U Sigma)\
  therefore bold(A V x = U Sigma x)
$
Which leads to a *beautiful* geometric interpretation:
#quote(block: true)[*Any matrix* $bold(A)$ can be modified to behave as a diagonal matrix $bold(Sigma)$ (only scales along orthogonal basis vectors, no shearing), followed by a rotation / reflection $bold(U)$, by rotating space before applying the transformation $bold(A)$ (change the basis) with the unitary matrix $bold(V)$.]
#figure(
  image("images/svd-geometrical.png", width: 60%),
) <fig-svd-geometrical>

Alternatively, the decomposition can be written as (TODO: Useful for the best rank 1 representation of a matrix, image compression):
$
  bold(A) in RR^(m times n), bold(u_i) in RR^(m times 1), bold(v_i) in RR^(n times 1)\
  bold(A) = sum_(i=1)^r sigma_i bold(u_i (v_i)^H)
$
Where $r = "rank"(bold(A))$ (the number of non-zero singular values), $bold(u_i)$ is the corresponding column of $bold(U)$ and $bold(v_i)$ is the corresponding column of the matrix $bold(V)$ (*pre-transpose*, or alternatively the $i$-th row) such that $bold(v^T)_i$ has dimensions $1 times n$. The columns of $bold(U)$ and $bold(V)$ corresponding to the largest singular value (weight) holds the most information about the matrix $bold(A)$, which can be used for data compression (only 2 single vectors must be stored).

Here are some examples of the dimensions involved in SVD:
#figure(
  image("images/svd-dimensions.png", width: 60%),
) <fig-svd-dimensions>

==== Properties
$
  bold(A) in RR^(m times n)
$
The SVD has strong connections to Strang's Fundamental Theorem of Linear Algebra:
- $bold(A V = U Sigma)$ shows that the left singular vectors (columns of $bold(U)$) are in the column space (image) of $bold(A)$
- Rearranging to $bold(A^H U = V Sigma)$ shows that the right singular vectors (columns of $bold(V)$) are in the row space of $bold(A)$
- Let $r := "Rank"(bold(A))$. To span the entire row / column space, $bold(V)$ and $bold(U)$ only need $r$ vectors but have dimensions $n times n$ and $m times m$ respectively. Therefore the remaining $n - r$ *right* singular vectors are a basis for $"Kernel"(bold(A))$.
- The remaining $m - r$ *left* singular vectors are a basis for $"Kernel"(bold(A^H))$. The orthogonality properties discussed in @fundamental-theorem apply to these spaces as usual.
#figure(
  image("images/fundamental-theorem-svd.png", width: 80%),
) <fig-fundamental-theorem-svd>

==== Calculating SVD
SVD is based on the fact that *any* matrix multiplied with its transpose results in one of 2 square, *symmetric* matrices with the *same eigenvalues* and which can be diagonalised!

$bold(U)$ and $bold(V)$ can be isolated as follows:
$
  bold(A^H A &= (U Sigma V^H)^H (U Sigma V^H) = V Sigma^H U^H U Sigma V^H)\
  bold(&= V Sigma^H Sigma V^H = V Sigma^2 V^H)\
  bold(A A^H &= (U Sigma V^H)(U Sigma V^H)^H = U Sigma V^H V Sigma^H U^H)\
  bold(&= U Sigma Sigma^H U^H = U Sigma^2 U^H)\
$
Showing us that $bold(U)$ and $bold(V)$ are simply orthonormal eigenvectors of multiplications with the transpose (the so-called *singular vectors*). These identities can be used to check which singular vectors belong to $bold(U)$ and $bold(V)$ if this is not obvious from the dimensions.

_Singular values_ - $sigma_i$ - *Positive* square roots of $lambda(bold(A^H A)) = lambda(bold(A A^H))$, usually listed in descending order. Recall that the maximum singular value is the spectral norm $norm(.)_2$ of a matrix.
- The rank of $bold(A)$ is equal to the number of *non-zero* singular values because $"Rank"(bold(A))="Rank"(bold(Sigma))$, unitary transformations do not affect rank
- If a matrix is normal, $bold(sigma = abs(lambda))$:
$
  bold(A = U Lambda U^H)\
  bold(A^H A =  (U Lambda^H Lambda U^H))\
  bold(Lambda^H = Lambda)\
  therefore bold(sigma(A) = sqrt(lambda(A^H A)) )\
  = bold(sqrt(lambda(A^2)) = sqrt(lambda(S D^2 S^(-1))) = abs(lambda(D)))\
  = abs(bold(lambda(A)))
$

Hence to calculate the SVD of a matrix $bold(A)$:
+ Calculate $bold(A^H A)$ and $bold(A A^H)$
+ Find the eigenvalues of the simpler product (they are the same for both) and use them to find both sets of orthogonal eigenvectors (singular vectors)
+ Arrange them in order of descending singular value as the columns of $bold(U)$ and $bold(V)$ respectively ($bold(A A^H -> U\, A "and" U "come before")$ and $bold(A^H A -> V\, A "and" V "come after")$)
+ Norm the columns of $bold(U)$ and $bold(V)$ if needed so their $norm(.)_2 = 1$
+ $bold(Sigma)$ has the singular values in descending order along its diagonal
+ It is often quicker to find $bold(U)$ using $bold(U = Sigma^(-1) A V)$ if $bold(Sigma)$ is invertible (strictly positive singular values).

== Applications
Finally, we can enjoy the wide variety of real world uses for linear algebra!

=== Linear Regression
This is one the fundamental algorithms in machine learning used for finding the best (this can have different interpretations) linear relationship between $n$ independent variables and a dependent variable(s). In other words, the dependent variable(s) is / are assumed to be a linear combination of the inputs and we are trying to determine the best linear combination for a set of sample points.

Most real-world applications are expected to depend on not only one but several quantifiable inputs, for example the likelihood of getting cancer depending on several lifestyle choices.

This most often uses the *least squares* approach for reducing error, which is carried out using techniques in linear algebra

Non-linear relationships can also be found using the multivariable minima through means of calculus, maybe a good LTD topic...

LTD: Generalise for multiple dependent variables (https://en.wikipedia.org/wiki/General_linear_model) essentially performing multiple linear regressions simultaneously

==== Linear Least Squares <linear-least-squares>
This is a method for finding the best approximation of an overdetermined system of equations:
$
  bold(X a approx y)\
  bold(X a - y -> 0)\
  therefore min norm(bold(X a - y))_2
$

Applying it to the context of linear regression, we suspect that there is a linear relationship between $n$ independent variables $bold(x) in RR^n$ and the dependent scalar $y in RR$ such that:
$
  bold(m) in RR^n, c in RR\
  bold(m^T x) + c = y\
$
This linear combination + constant can be written in an easily-extendible matrix form as the proposed answer vector $bold(a) in RR^(n + 1)$ and input matrix $bold(X) in RR^(1 times (n+1))$:
$
  bold(a) = vec(c, bold(m), ...)\
  bold(X) = mat(1, bold(x), ...)
$
Such that:
$
  bold(X a) = c dot 1 + bold(<x\, m>) = y
$

To create a measure of error for an answer vector $a$, we can represent the *residual* for a proposed answer vector $bold(a)$ and an actual input (inside $bold(X)$) and output $y_1$:
$
  bold(X a) - y_1 = r\
$
Let us consider we have $s$ samples available to optimise our answer vector against. We can extend $bold(X)$ with each sample ${bold(x_1), bold(x_2), ..., bold(x_s)}$ and subtract the corresponding sample outputs $bold(y) = vec(y_1, y_2, ..., y_s)$ to calculate the set of residuals $bold(r) in RR^s$:
$
  bold(X) = mat(
  1, bold(x_1), ...;
  1, bold(x_2), ...;
..., ..., ...;
  1, bold(x_s), ...;
)\
  bold(X a - y = r)
$
We can now convert this set of residuals into an unsigned scalar representing how "bad" the current answer vector $bold(a)$ is using a norm, usually the Euclidean $L_2$ norm:
$
  r &= norm(bold(r))
$
Our goal is to find the answer vector $bold(a)$ to minimise:
$
  norm(bold(X a - y))
$
for a given sample set encoded as $bold(X)$ and $bold(y)$.

Of course in the vast majority of cases there is no perfect solution such that:
$
  r &=norm(bold(X a - y)) = 0\
  bold(X a &= y)
$
In other words, $bold(y)$ is probably not in $"Im"bold(X)$. However, there are several techniques available for approximating the closest answer vector $bold(a) in "Im"bold(X)$.

===== Orthogonal Projection Method
The current goal is to find the best answer $bold(a)$ such that $bold(X a &= y)$. We can express $arrow(y)$ as the sum of the closest vector in the image $bold(p) in "Im"bold(X)$ and another vector $bold(c) in "Kern" bold(A^T)$ which we know are orthogonal to one another thanks to the Fundamental Theorem of Linear Algebra:
$
  bold(X a = y = p + c)\
  bold(p perp c)\
$
Their orthogonality means that $bold(c)$ is the shortest possible error from the real $arrow(y)$ possible. We can find $bold(p)$ by simply projecting $bold(y)$ onto the image subspace of $bold(X)$.

Thus we can now find a solution for answer vector $bold(a)$, because $bold(p)$ is guaranteed to be in the image of the matrix $bold(X)$:
$
  bold(X a &= p)\
$
This is the optimal solution to our regression problem :)

To summarise the entire process, we can find the optimal solution for $bold(a)$ using the following formula (derived based on the discussed method), $bold(X)$ and the corresponding $bold(y)$ samples are given:
$
  bold(X^T X a = X^T y)
$
However, this is still not guaranteed to have a solution, namely when $bold(X)$ doesn't have full rank (can happen quite often for perfectly reasonable samples). Furthermore, it is very sensitive to rounding errors.

===== QR-Decomposition Method
This method solves the rounding error issues, although it *still only works if $bold(X)$ has full rank* (the upper reduced $bold(R)$ matrix has the same rank as $bold(X)$ and needs to be invertible to deliver a single solution). Wasteful data cleaning would have to be done to ensure these methods are fit for use, therefore why singular value decomposition is used much more commonly in practice.

We can rewrite $bold(X a &= y)$ using the QR decomposition of $bold(X)$:
$
  bold(X &= Q R)\
  bold(Q R a &= y)\
  bold(R a &= Q^H y)
$
Assuming the matrix $bold(X)$ has rank $n$, only the first $n$ rows contain are non-0 in the $bold(R)$ matrix, and therefore only the first $n$ rows of the RHS matter when solving for $bold(a)$. In block form this looks something like this:
$
  vec(bold(R |_n), 0) bold(a) = vec(bold((Q^H y)) |_n, r_(n+1), ..., r_s)
$
Where $dot |_n$ represents the first $n$ rows of a matrix / vector.

We can now solve $bold(R|_n a = (Q^H y)|_n)$ The rest of the elements of $bold(Q^H y)$, named $r_(n+1), ..., r_s$, represent the residuals of the optimal solution - their norm shows exactly what the lowest possible error is for the sample. TODO: Apply method and check what the residuals look like in practice

LTD: The same technique can be used to find a polynomial of degree $n$ solution TODO: Bespiel 5.1.0.4, think about how this corresponds to curved surfaces in 3D space.

===== SVD / The Pseudoinverse
This powerful method works regarding the rank of the matrix $bold(X)$.
$
  bold(X = U Sigma V^H)\
  bold(U Sigma V^H a = y)\
  bold(a = V Sigma^+ U^H y)\
  bold(X^+ := V Sigma^+ U^H)
$
Where $bold(X^+\, Sigma^+)$ denote the so-called *Pseudoinverses*. Professor Gradinaru uses dagger notation $bold(X^dagger)$.

The Pseudoinverse of a diagonal matrix, for example $bold(Sigma^+)$, is simply the reciprocal of non-zero values along the diagonal followed by tranposing the matrix (to satisfy SVD dimensions).

Intuitively, 0 singular values represent the least important rank 1 approximations of the matrix hence they can be "ignored" whilst taking the inverse of the matrix's SVD, creating the optimal least squares solution inverse.

A *unique* (no matter the order of the singular values) Pseudoinverse exists for *every matrix* and is calculated using the SVD $bold(A^+ := V Sigma^+ U^H)$ as seen above and exhibits the following properties:
- If $bold(A)$ is invertible $bold(A^(-1) = A^+)$
- $bold((A^+)^+ = A)$
- $bold(A A^+ A = A)$
- $bold((A^+ A)^T = A^+ A)$
- $bold((A A^+)^T = A A^+)$

=== Optimization
==== Quadratic Forms
A quadratic form is a multivariable polynomial who's terms are all degree 2, for example:
$
  f(x_1, x_2) = a(x_1)^2 + 2 b x_1 x_2 + c(x_2)^2
$
We can represent such equations using the following operation with a symmetric matrix:
$
  bold(A) = mat(a, b; b, c), bold(x) = vec(x_1, x_2) \
  bold(x^T A x) = f(x_1, x_2)
$
If $bold(A)$ is positive-definite, it satisfies the properties of an inner product:
$
  forall x_1, x_2 in RR, f(x_1, x_2) >= 0\
  f(0, 0) = 0
$
This shows us that $f(x_1, x_2)$ has a global minimum at $(0, 0)$. This can be generalized by introducing translational parameters to the quadratic form, allowing us to find the minimum of an $n$-dimensional quadratic form.

==== Generic Multivariable Functions
Furthermore, linear algebra allows us to define easy to calculate criteria for checking if a point is a local minimum / maximum of a multivariable function.

Let $f: RR^n -> RR$ be differentiable within a specific domain of our interest. We can check if a point is critical if all of the partial derivatives are equal to 0:
$
  vec((diff f(bold(x))) / (diff x_1), ..., (diff f(bold(x))) / (diff x_n)) = bold(0)
$
To check if it's a local minima, the second partial derivatives must all be greater than 0. Modelling them as a matrix:
$
  mat(
  (diff^2 f(bold(x)))/ (diff x_1 diff x_1), ..., (diff^2 f(bold(x)))/(diff x_i diff x_1);
  dots.v, dots.down, dots.v;
  (diff^2 f(bold(x)))/ (diff x_1 diff x_j), ..., (diff^2 f(bold(x)))/(diff x_i diff x_j);
)>= bold(0)
$
This matrix's and the first derivative vector's entries can be calculated using numerical methods. The vector check is straightforward; we can check if the 2nd derivative condition is satisfied by rearranging it as an inner product $bold(x^T A x)$, performing Gaussian elimination on $bold(A)$ and ensuring it is *semi positive-definite*.

LTD: Define similar criteria for multi-variate (n dimensional output) functions

=== Contour Lines
A contour line and the corresponding level set (set of points for which a function gives the same output) can be determined with the help of linear algebra:
$
  L_c(f) = {bold(x) | f(bold(x)) = c}
$

==== Quadratic Form
#figure(
  image("images/quadratic-contour-line.png", width: 30%),
) <fig-quadratic-contour-line>
As seen in the optimization examples, a quadratic form can be expressed using a symmetric positive-definite matrix $bold(A)$:
$
  f(x_1, x_2) = bold(x^T A x)
$

As $bold(A)$ is symmetric and therefore normal, the contour line at $f(x_1, x_2)=c$ can be diagonalized (thanks to the spectral theorem):
$
  c&= f(x_1, x_2)= bold(x^T A x) = bold(x^T Q D Q^(-1) x)\
  &= bold(x^T Q D Q^(T) x)
$

The diagonalization now allow us to make better sense of the contour line in a helpful basis, which in the case of a quadratic form is an n-dimensional ellipse. Let $vec(y_1, y_2)$ be axes in our new basis:
$
  bold(y &= Q^(T) x)\
  c &= bold(y^T D y)\
  &= mat(y_1, y_2) mat(lambda_1, 0;0, lambda_2) vec(y_1, y_2)\
  &= lambda_1(y_1)^2 + lambda_2 (y_2)^2
$

Therefore the radii of the n-dimensional ellipse (contour line) are $c/sqrt(lambda_n)$.

=== Linear Differential Equations
Extremely useful in physics! I will just cover the ways linear algebra can be used to solve them, see analysis notes for more background.

==== First-order
TODO: https://tutorial.math.lamar.edu/Classes/DE/Linear.aspx , 7.1
The solution satisfies an equation in the form:
$
  dot(y)(t) + a() y(t) =
$

=== Markov Matrices
TODO:
Method for finding steady state of probability based change using eigenvectors and special form of matrix with columns adding to 1 (all possibilities covered) and elements >0 (no negative probabilities). Name city movement example / maybe find some physics related one.

=== Discrete Fourier Transform and FFT
The change-of-basis nature of the discrete Fourier transform makes a matrix implementation the obvious choice and allows us to recognize the optimized FFT variant of the algorithm. See `../../semester-2/mathematische-methoden/notes.pdf` for explanation of how the formula works:
$
  X_k = sum^(N-1)_(n=0) x_n e^(-i 2 pi k / N n)
$

Multiplying a sample vector $bold(S) in CC^(N times 1)$ by the following *Fourier matrix* performs the complete analysis:
$
  bold(F_(k, n in ZZ_[0, N-1])) = e^(-i 2 pi k / N n) / sqrt(N)\
$
Here is an example of a DFT matrix for $8$ samples:
#figure(
  image("images/dft-matrix.png", width: 60%),
) <fig-dft-matrix>
The resulting vector $bold(F S = T in CC^(N times 1))$ contains the complex number representing the amplitude and phase shift each bin frequency.

==== Properties
- The Fourier matrix is unitary. The scalar multiplication $1/sqrt(N)$ makes each column have norm 1 (do not forget complex conjugation in the complex inner product $norm(bold(c)) = sqrt(bold(c^H  c))$) and all columns are orthogonal to each other $bold(<a\, b> = 0)$.
- The inverse discrete Fourier transform can be performed by taking the inverse of the matrix $bold(F^(-1) = F^H = overline(F))$, simply the complex conjugate of each element as it is also symmetric.

==== Cooley-Tukey FFT
This famous algorithm is based on maximizing the number of 0s (skipped operations) in the Fourier matrix thanks to a set of permutations and recognizing the symmetry of roots of unity. It reduces the number of operations from $N^2$ to $N log N$ transforming digital sampling (alongside the development of high frequency ADCs).

_Operation_ - A single operation involves a complex multiplication followed by a complex addition. For example multiplying a $CC^(N times 1)$ vector by a $CC^(N times N)$ matrix involves $N$ operations for computing each element of the resulting vector, hence $N^2$ in total during the normal DFT.

The rows of a Fourier matrix are simply the k'th roots of unity $z^N = 1$:
$
  e^(i n (2 pi ) / N)
$
Multiplication by a fundamental root of unity ($n=1$) twice is equal to the fundamental root of unity for $z^(N/2) = 1$:
$
  (e^(i (2 pi) / N))^2 = e^(i 2 (2 pi) / N )
$
Therefore with some slight adjustment, a $N$ dimensional Fourier matrix can be calculated using a Fourier matrix half the size + some permutation and correction factors, reducing half of the Fourier matrix to 0s (operations we can skip):
$
  bold(F_64) = bold(mat(I, D; I, -D) mat(F_32, 0;0, F_32) C)
$
Where $bold(C)$ is a *circulant matrix* (LTD: Describe properties) which rearranges the order of the signal samples and $bold(D)$ has the roots of unity along its diagonal. Furthermore, the circulant matrix can be "hardwired" into the application and does not require any significant computation. This decomposition can be iteratively carried out, further reducing the dimensions of the Fourier matrices and the number of operations.

Gleichtzeitig diagonalisierbar => AB = BA and alle EW haben AM 1, sie haben dieselbe eigenbasis

== Upcoming
LTD:
- 4D, Flatland trick, hyperplane, cube etc
- Jacobian
