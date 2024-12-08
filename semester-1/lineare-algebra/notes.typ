#heading(outlined: false)[Lineare Algebra]

#set heading(numbering: (..nums) => nums.pos().map(str).slice(1, none).join("."))

#outline()

https://students.aiu.edu/submissions/profiles/resources/onlineBook/Y5B7M4_Introduction_to_Linear_Algebra-_Fourth_Edition.pdf

We live in a discrete, digital age.

Übungsstunde Notizen:
- https://n.ethz.ch/~jamatter/
- https://www.felixgbreuer.com/linalg

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

=== Tips:\
- Never divide / subtract in Gaussian elimination. Simply multiply by $1/x$ or -x and add.
- Switch rows columns carefully *before* carrying out additions.
- *Only* add the row who's pivot is currently being pursued to other rows! Otherwise it is difficult to capture the operation in the elimination matrix (more on this later).
- When switching rows to get existing pivots in the correct place, it is usually best to swap a line with a zero pivot with the row that has the largest pivot in that place.

- _U - Upper (sometimes: R - right) Matrix_ - Matrix with 0s under the diagonal
- _L - Lower Matrix_ - Matrix with 0s above the diagonal
- _Identity Matrix_ - Matrix with 1s on the diagonal, everything else 0.
- _Tridiagonal Matrix_ - Matrix with 3 diagonals, and otherwise 0s everywhere
- $bold(A x) = 0$ only has the trivial solution $bold(x) = 0$, unless $bold(A)$ contains free variables.

=== Square Matrices ($m times n$):
*The following only applies to square matrices*

- _Regular Matrix_ - Rank = n - has exactly one solution for arbitrary RHS; only the trivial solution when homogenous
- _Singular Matrix (single = strange and uncommon)_ - Rank < n - has infinite / no solutions and has infinite non trivial solutions when homogenous

$m>n$ - An overdetermined LGS only has solutions for very specific RHS values (if the rows are not linearly dependent) and therefore has no inverse (singular).

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
If only the trivial solution exists for $bold(x)$ (A is regular), all vectors $bold(v_n)$ are linearly independent. This is most easily checked through elimination.

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


=== Dimensions
The number of elements in a basis of a space.

_Finite Dimensional Vector Space_ - A finite set of basis vectors spans the entire space.

Examples:
- Finite dimensional: $RR^n, cal(P)_n$ - Dimension = $n$. (Hence the awkward degree $<= n-1$ notation for $cal(P)_n$)
- Non-finite dimensional: $cal(P), C^k, L^2$

Sometimes non-finite dimensional spaces can be approximated using finite dimensional spaces (Taylor series).

#image("images/dimensions.png")

=== Fundamental Theorem of Linear Algebra (Gilbert Strang)
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

LTD: Review these proofs

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
This is a measure of the maximum a matrix increases the Euclidean norm (lengths) of vectors in space - an extremely useful result.

It can be calculated as follows:
$
  norm(bold(A))_2 = sqrt(lambda_"max" (bold(A^H A)))
$
If $bold(A)$ is symmetrical:
$
  norm(bold(A))_2 = abs(lambda_"max" (bold(A)))
$

In the symmetrical case, *n* real eigenvalues are ensured meaning that a linear combination of eigenvectors can cover the entire space and the maximum eigenvalue is the largest resulting norm of any unit vector.

$bold(A^H A)$ ensures the eigenvalues become real ($CC dot CC = RR$), which is then accounted for by the square root - this can be proven due to $bold(A^H A)$ being Hermetian symmetric and thus diagonalizable using unitary matrixes accoring to the spectral theorem.

Furthermore, the spectral norm a matrix's inverse can be intuitively calculated as:
$
  norm(bold(A)^(-1))_2 = 1 / sqrt(lambda_"min" (bold(A^H A)))
$

TODO: The intuition for what $bold(A^H A)$ is has something to do with the singulars of a matrix, revisit.

==== Condition Number
This is a measure of how accurately the inverse of a matrix can be computed:
$
  k(bold(A)) = norm(bold(A))_2 norm(bold(A^(-1)))_2
$
- $k=1$ - The matrix is said to be well-conditioned
- $k >> 1$ - Such a matrix is almost singular and is very prone to errors

For a symmetric matrix $bold(A)$:
$
  k(bold(A)) = sqrt(abs(lambda_"max" (bold(A)))/abs(lambda_"min" (bold(A))))
$

It is purely a property of the matrix based on how much bigger the maximum eigenvalue is than the minimum eigenvalue - ie how much more the matrix stretches vectors in a specific direction than the others - which makes it less "unitary" and more susceptible to computational errors.

LTD: Benchmark condition numbers of different types of matrices.

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

== Hilbert Space
_Metric Space (aka Pre-Hilbert space)_ - A space with an inner product that satisfies the previously defined criteria

TODO: Define cauchy completeness, may still come up in analysis though

_Hilbert Space_ - A complete metric space, limits are defined, which may be infinite dimensional

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

Once we find the eigenvalues of the matrix, the matrix $bold(A) - lambda bold(I)$ can be computed for each one and finding each set of eigenvectors simply becomes the task of finding the different nullspaces, for which we have already calculated the reduced form of $bold(A)$ whilst finding the characteristic equation:
$
  bold(A_(lambda_1) v) = 0\
  bold(A_(lambda_2) v) = 0\
  ...
$
If eigenvectors are needed as well as the eigenvalues, it is best to compute $det(bold(A) - lambda bold(I))$ using Gaussian elimination, so that the reduced form can be reused in the above eigenvector LGSs. However, handling the $lambda$s in elimination can be tricky when all other elements in that column are either 0 or in terms of $lambda$. Sometimes a row can be divided so a certain element becomes 1, which can then accordingly be multiplied by a term involving $lambda$ (for example $(lambda+2)$) allowing another row to eliminate that element.

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
0, 0, ..., lambda_n)
$
Therefore a similar diagonal matrix can simply be formed using its eigenvalues in any order (as long as $bold(S)$ is consistent with this order):
$
  bold(D) = "diag"(lambda_1, lambda_2, ...)
$
Those eigenvalues do not need to unique (although unique eigenvalues guarantee linear independence and diagonalization) - some may have geometric multiplicity $>1$. However, the chosen eigenvectors must be independent to ensure $bold(S)$ is invertible.

Calculating a diagonal form of the matrix (albeit in another basis) can be extremely useful for simplifying calculations, for example calculations where raw access to its eigenvalues is useful, or analyzing the properties of the transformation it represents.

#figure(
  image("images/diagonalisability.png", width: 90%),
) <fig-diagonalisability>
To be able to chose n independent eigenvectors, $sum "GM" = n$. The fundamental theorem of algebra states $n = sum "AM"$, hence if any eigenvalue's GM $<$ AM it cannot be diagonalized.

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

This is an incredibly useful statement for computation - computers love orthonormal and diagonal matrices! When visualising this decomposition, the orthogonal change of basis matrix has its orthonormal basis vectors as eigenvectors, meaning the eigenvectors become aligned with the basis. Space is then scaled accordingly by the diagonal eigenvalue matrix $Lambda$ and rotated / reflected back to the original basis.

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
These are symmetric matrices which have *only strictly-positive* (non-zero) eigenvalues and therefore only strictly positive pivots (and therefore full-rank; invertible).

Therefore the determinant (product of eigenvalues / pivots), as well as all determinants of "sub" matrices with $n-k$ dimensions are also positive (we can't only rely on the "total" determinant, it may have two negative eigenvalues).

Another way of checking this is ensuring the dot product of all vectors before and after the transformation is $>= 0$:
$
  forall bold(x) in RR^n | <bold(x), bold(A x)> = bold(x^T A x) >= 0\
  <bold(x), bold(A x)> = 0 => bold(x) = 0\
$
If the zero vector checking condition is not satisfied, the matrix is called *semi positive-definite* - in other words some non-zero vectors are either sent to the zero vector or become orthogonal. It must have at least one 0 eigenvalue.

== Non-Diagonalizable Decomposition
=== Schur Decomposition
All complex square matrices (not only normal) are unitarily similar (unitary change of basis matrices) to an upper matrix (may contain complex elements) with its eigenvalues as its pivots.
$
  bold(A = Q U Q^(-1) = Q U Q^(H))
$

If $bold(A)$ is real, it is orthogonally similar to a _block upper matrix_, such that when represented as a block matrix using $1 times 1$ and $2 times 2$ sub matrices, only entries on and above the diagonal are non-zero.

The existence of this decomposition is more relevant than using it and it as a useful ingredient in many fundamental proofs.

==== QU Algorithm
This is an algorithm based on QU decomposition for finding a similar matrix using unitary change of basis vectors, ie computing the Schur decomposition:
+ Compute the QU decomposition: $bold(A = Q U)$
+ Let $bold(A_(k+1) = U Q)$
+ $bold(A_(k+1)= Q^(-1) Q U Q = Q^H A Q)$
+ Keep iterating until $bold(A_(k+1))$ converges to an upper matrix, the Schur decomposition is then solved and can be rearranged to $bold(A = Q A_(k+1) Q^H)$

TODO: Jordan form

== Singular Value Decomposition
Diagonalization is only possible for square matrices with $n$ independent eigenvectors and Schur decomposition only leads to a similar upper matrix, not a diagonal one.

Singular value decomposition (SVD) allows us to "diagonalize" *all* matrices using unitary change of basis matrices, with the downside that the change of basis matrices are different and therefore need to be calculated twice:
$
  bold(A) in RR^(m times n), bold(U) in RR^(m times m), bold(V) in RR^(n times n)\
  bold(Sigma) in RR^(m times n) = "diag"(sigma_1, sigma_2, ..., sigma_p), p = "min"(
    m, n
  ), sigma_1 >= sigma_2 >= ... >= sigma_p >= 0\
  bold(A = U Sigma V^H)
$
There are multiple possible decompositions for a given matrix. SVD unlocks countless applications in all areas of science.

Alternatively, the decomposition can be written as (TODO: Useful for the best rank 1 representation of a matrix):
$
  bold(A) in RR^(m times n), bold(u_i) in RR^(m times 1), bold(v_i) in RR^(n times 1)\
  bold(A) = sum_(i=1)^r sigma_i bold(u_i (v_i)^H)
$
Where $r = "rank"(bold(A)$), $bold(u_i)$ is the corresponding column of $bold(U)$ and $bold(v_i)$ is the corresponding column of the matrix $bold(V)$ (*pre-transpose*, or alternatively the $i$-th row) such that $bold(v^T)_i$ has dimensions $1 times n$. The matrix in this sum with the largest singular value (weight) holds the most information about the matrix $bold(A)$, which can be used for data compression (only 2 single vectors must be stored).

Here are some examples of the dimensions involved in SVD:
#figure(
  image("images/svd-dimensions.png", width: 40%),
) <fig-svd-dimensions>

=== Calculating SVD
SVD is based on the fact that *any* matrix multiplied with its transpose results in a square, *symmetric* matrix, which can be diagonalised!
$
  bold(A^T A &= (U Sigma V^H)^H (U Sigma V^H) = V Sigma^H U^H U Sigma V^H)\
  bold(&= V Sigma^H Sigma V^H = V Sigma^2 V^H)\
  bold(A A^T &= (U Sigma V^H)(U Sigma V^H)^H = U Sigma V^H V Sigma^H U^H)\
  bold(&= U Sigma Sigma^H U^H = U Sigma^2 U^H)\
$

_Singular values_ - $sigma_i$ - Square roots of the eigenvalues of a matrix multiplied by its own transpose, usually listed in descending order.
- If a matrix is normal, $bold(sigma = abs(lambda))$:
$
  bold(A = U Lambda U^T)\
  bold(A^T A =  (U Lambda^T Lambda U^T))\
  bold(Lambda^T = Lambda)\
  therefore bold(sigma(A) = sqrt(lambda(A^T A)) = sqrt(lambda(A^2)))\
  = abs(bold(lambda(A)))
$

== Applications
Finally, we can enjoy the wide variety of real world uses for linear algebra!

=== Linear Regression
This is one the fundamental algorithms in machine learning used for finding the best (this can have different interpretations) linear relationship between $n$ independent variables and a dependent variable(s). In other words, the dependent variable(s) is / are assumed to be a linear combination of the inputs and we are trying to determine the best linear combination for a set of sample points.

Most real-world applications are expected to depend on not only one but several quantifiable inputs, for example the likelihood of getting cancer depending on several lifestyle choices.

This most often uses the *least squares* approach for reducing error, which is carried out using techniques in linear algebra

==== Linear Least Squares
This can also be used to solve non-linear relationships by finding the multivariable minima through means of calculus, maybe a good LTD topic...

LTD: Generalise for multiple dependent variables (https://en.wikipedia.org/wiki/General_linear_model) essentially performing multiple linear regressions simultaneously

We suspect that there is a linear relationship between $n$ independent variables $bold(x) in RR^n$ and the dependent scalar $y in RR$ such that:
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
  bold(X) &= mat(
  1, bold(x_1), ...;
  1, bold(x_2), ...;
..., ..., ...;
  1, bold(x_s), ...;
)\
  bold(X a - y &= r)
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
In other words, $bold(y)$ is probably not in $"Im"bold(X)$. However, we are able to find the closest answer vector $bold(a) in "Im"bold(X)$ thanks to orthogonal projections!

===== Orthogonal Projection Method
The current goal is to find the best answer $bold(a)$ such that $bold(X a &= y)$. We can express $arrow(y)$ as the sum of the closest vector in the image $bold(p) in "Im"bold(X)$ and another vector $bold(c) in "Kern" bold(A^T)$ which we know are orthogonal to one another thanks to the Fundamental Theorem of Linear Algebra:
$
  bold(X a &= y = p + c)\
  bold(p &perp c)\
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
This method solves the rounding error issues, although it still only works if $bold(X)$ has full rank (the upper $bold(R)$ matrix has the same rank as the input). Quite wasteful data cleaning can be done to ensure these methods are fit for use, hence why singular value decomposition is used much more commonly in practice.

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

We can now solve $bold(R|_n a = (Q^H y)|_n)$ The rest of the elements of $bold(Q^H y)$, named $r_(n+1), ..., r_s$, represent the residuals of the optimal solution - their norm shows exactly what the lowest possible error is for the sample.

LTD: The same technique can be used to find a polynomial of degree $n$ solution TODO: Bespiel 5.1.0.4, think about how this corresponds to curved surfaces in 3D space.

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

=== Fourier-Transform
Shift matrix multiplying vector can be used to create shifted circulation matrix - it shifts columns, which can then be transposed.
$
  S^T S = I
$

Shifts the vector through one complete cycle
$
  S^n x = x
$

Finding Eigenvalues of a a shift matrix:
$
  S v = lambda v\
  S^n v = lambda^n v\
  v = lambda^n v
$
A shift matrixes eigenvalues are the complex roots of unity, its eigenvectors' elements are the eigenvalues.

The different shifted eigenvectors are an orthogonal basis in $CC^n$

sum of complex roots of unity is 0? 1 is also a root, hence:
$
  sum omega^(k j) = n or 0\
  V^H v = n I
$
Therefore diagonalisation of shift matrix:

Matrix defining some polynomial using the monome base with shift transformation inside:
$
  p(S_n(x))= ...
$
Can be diagonalized as:
$$

All circulation matricex have the same eigenspaces!

TODO: Revise basis change matrix
DFT matrix, Vandermonde matrix, what actually is a Fourier Transform
Study of how signals can be broken down into linear ocmbinations of trigonometric functions. Understand how frequency domain works etc

Gleichtzeitig diagonalisierbar => AB = BA and alle EW haben AM 1, sie haben dieselbe eigenbasis

== Upcoming
LTD:
- 4D, Flatland trick, hyperplane, cube etc
- Jacobian
