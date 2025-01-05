#heading(outlined: false)[Analysis 1]

#set heading(numbering: "1.")
#show terms.item: it => {
  let term = it.term

  [=== #term
    #it.description]
}

#outline()

Literature:
- #link("https://metaphor.ethz.ch/x/2023/hs/401-1261-07L/ex/LectureNotes.pdf")[Alessio Figalli's 2023 Lecture Notes]
- #link("https://link.springer.com/book/10.1007/b137107")[Analysis 1 by H. Amann & J. Escher]

What I would like to take notes of:
+ State the theorem / definition, expand with some intuition / memory aids
+ Write the proof by myself if deemed useful for an exam
+ Name some examples only if very helpful

These notes should serve as condensed revision material - only the minimal, important facts to remember before solving problems

Note on order: Many scripts used for teaching introduce concepts as they become relevant. My goal is to build a revision reference, not a learning resource, therefore over time the order will be rearranged to group relevant definitions and theorems together.

Proofs heavily involve decomposition; to progress, smaller Lemmas need to be brought in along the way and proven (or taken as true since someone else proved them). However first of all, you need to understand and remember the axioms (rules of the game).

Mathematics - Abstracting enough to focus on the matter

Contradiction is a useful tool for linking statements about $>$ and $>=$.

#pagebreak()

= Fundamentals

/ Definition - Set: An *unordered* collection of *distinct* (${x, x} equiv {x}$) elements such that:
+ It is defined by the elements it contains
+ It is not an element of itself, this prevents Russell's Paradox: ${x | x in.not x}$
+ Its elements can be filtered by a series of statements which hold true, for example the set of even integers: $
    {n in ZZ | exists m in ZZ: n = 2m}
  $ Where $|$ and $:$ both mean "such that".
+ The empty set $emptyset$ contains no elements

/ Definition - Interval Notation: Interval notation allows us to succinctly express common sets of real numbers between limits $a, b in RR$:
- Closed interval $
[a, b] := {x in RR | a<= x <= b}
$
- Open interval $
(a, b) := {x in RR | a< x < b}
$
- Half-open interval $
[a, b) := {x in RR | a<= x < b}
$
- Unbounded interval $
[a, oo) := {x in RR | a <= x}
$
- For a non-empty interval, the *length* is defined as $b - a$
- Sometimes inverted square brackets are used to specify an open bound, ex. $[a, b[$
- The intersection of a finite number of intervals is also an interval, such that the lower bound is the smallest lower bound and vice versa for the upper bound
- Sets aren't doors, they don't need to be either open or closed.


/ Definition - Set Operations: This allows us to construct common sets from component sets $P, Q$:
- Intersection: $
P sect Q := {x in P | x in Q}
$
- Union: $
P union Q := {x in P or x in Q}
$
- Relative Complement: $
P \\ Q := {x in P | x in.not Q}
$
- Complement of a Subset: $
R subset.eq X\
R^complement := {x in X | x in.not R}
$
- Symmetric Difference: $
P triangle.small Q := (P union Q) \\ (P sect Q)
$
- They are distributive: $
  A union (B sect C) = (A union B) sect (A union C)\
  A sect (B union C) = (A sect B) union (A sect C)\
$
- Let $AA$ be a set of sets, we can also define:
$
  sect.big_(A in AA) A := {x | exists A in AA | x in A}\
  union.big_(A in AA) A := {x | forall A in AA | x in A}
$

/ Theorem - De Morgan's Laws: This states:
$
  (A sect B sect ...)^complement = A^complement union B^complement union ...^complement\
  (A union B union ...)^complement = A^complement sect B^complement sect ...^complement\
$
It is commonly applied to Boolean logic, where $A, B subset.neq {0, 1}$:
$
  overline(A and B and ...) equiv overline(A) or overline(B) or ...
$

= Topology

/ Definition - Ball / Disk: A topological ball with radius $r$ and center $x_0$ in dimension $RR^d$ is defined as the set of points:
$
  B_r^d (x_0) = {x in RR^d | abs(x - x_0) < r} - "Open ball"\
  overline(B_r^d)(x_0) = {x in RR^d | abs(x - x_0) <= r} - "Closed ball"\
  S_r^(d-1)(x_0) = {x in RR^d | abs(x - x_0) = r} - "Sphere (boundary of ball)"
$
Where $abs(x - x_0)$ is the length of the vector from $x_0 -> x$ ie the radius.
It follows:
$
  B_0(x_0) = emptyset\
  overline(B_0)(x_0) = {x_0}\
  B_oo^d (x_0) = overline(B_oo^d)(x_0) = RR^d\
$
- Man muss immer am $B_r^d$ bleiben!
The sphere has dimensions $d-1$ because its points only form a subspace in the dimension below the ball which it is enclosing:
- $S_r^1$ - Is the line of points around a circle ie 1 dimensional
- $S_r^2$ - Every point in the surface of a 3D ball can be reached with linear combinations of two basis vectors (such that they stay within the subspace).

/ Definition - Inner Point: A point $x in S^n$ is inner $<=> exists r in (0, oo) | B_r^n (x)subset.eq S$ - there is an open ball with a radius $>0$ around $x$ such that it is entirely a subset of / equal to S.

/ Definition - Interior: - The interior of a set is the set of all its inner points:
$
  "Int" S := {"inner points of S"}
$
- $"Int" S subset S$ is always true.
- Alternatively, the interior can be defined as the union of open balls:
$
  "Int" S := union.big_(B_r^n (x) | B subset.eq S) B
$

/ Definition - Open Set: A set which is equal to its interior: $S = "Int" S$. In other words, it is defined with $>$ or $<$ relations.
- It has no maximum / minimum, only an infimum / supremum.
- Every point of an open ball is an inner point, hence making the ball "open".
$
  "Int" overline(B_r^d)(x_0) = B_r^d (x_0)\
  x in RR, {x} "is not open"
$
- The union of arbitrarily many open sets is open (the outer boundaries will remain open no matter what)
- The intersection of finitely many open sets is also open

/ Definition - Closed Set: The definition is built upon that of an open set:
Let $A subset.eq RR^n$:
$
  A "is closed" <=> (RR^n \\ A) "is open"
$
For example, $[a, b] | a< b$ can instead be expressed as $(-oo, a) union (b, oo)$, which is open.
- ${x}$ is closed
- $emptyset, RR^n$ are both open and closed, since $emptyset^complement = RR^n$ and $RR^complement = emptyset$
- $[a, b) subset.neq RR$ is neither open or closed

/ Definition - Closure: The closure of $overline(S)$ is the smallest possible closed set which entirely includes the set $S$, this can be formed using the intersection of all possible closed balls with different radii and centers, as long as they entirely contain $S$:
$
  overline(S) := "clos"(S) := union.big_("All" overline(B)_r^n (c) | S subset.eq overline(B)) overline(B)
$
For example:
$
  S := (0, 1]\
  overline(S) = [0, 1]
$
- $S subset.eq overline(S)$ - The closure of a set contains the set itself
- A topological set can only be called *closed* if it is equal to its closure

/ Definition - Boundary: The boundary of a set $diff S$ is:
$
  diff S := overline(S) \\ "Int" S
$
Characterized more fundamentally:
$
  diff S := {x in RR^n | (forall r in (0, oo) | (B_r^n (x) sect S) != emptyset != B_r^n (x) \\ S)}
$
The boundary of a set S is the set of points such that:
- A ball with increasing radius (starting just above 0) always continues to overlap with some elements of S ($(B_r^n (x) sect S)!= emptyset$), ie the ball must be actually in or right next to S
- The points themselves are part of $B_r^n (x) \\ S$, which is never equal to the empty set, ie the point itself is never in S
By definition, a topological sphere is the boundary of a ball:
$
  diff B_r^(n) (x) = diff overline(B_r^(n)) (x) = S_r^(n-1) (x)
$
Furthermore, a boundary is a closed set:
$
  (RR^n \\ diff S = ("Int" S union RR^n \\ overline(S))) "which is open" => diff S "is closed"
$

/ Definition - Bounded: A set which is a subset of a closed set (other than $RR^n$)

/ Definition - Compact: A set which is closed *and* bounded
- A closed ball is by definition compact.
- $RR^n$ is not compact, because it is an infinitely large (albeit open & closed) set.

/ Definition - Neighborhood (Umgebung): A subset $U subset.eq X$ is considered a *neighborhood* of a point $x_0$ relative to a set $X$ if:
$
  x_0 in O subset.eq U subset.eq X
$
Where $O$ is a non-empty open set.
- For example, there are many possible neighborhoods around a point in the middle of a non-empty set.
- Points on the boundary of $X$ have no neighborhood $U$ as no non-empty open set contains only points which remain in $X$

= Axioms of The Real Numbers

An axiomatic approach to defining the set of real numbers $RR$.

/ Definition - Group: A *non-empty* set $G$ endowed with an operation $star$ which satisfies the following criteria $forall a, b, c in G$:
+ _Associativity_ - $a star (b star c) = (a star b) star c$
+ $exists$ _Neutral Element_ $n$ - $a star n = n star a = a$ - Examples:
  - $a + 0 = 0 + a = a$
  - $a dot 1 = 1 dot a = a$
+ $forall a exists$ _Inverse Element_ $i$ - $a star i = i star a = n$ - Examples:
  - $a + (-a) = (-a) + a = 0$
  - $a !=0 => a dot a^(-1) = a^(-1) dot a = 1$
+ If $a star b = b star a$ it is a *commutative group*, although this is not required.
Properties:
- The _Neutral Element_ is unique. Proof: $
    "Let" n, n' in G "be neutral elements"\
    n star n' = n = n'
  $
- There is unique _Inverse Element_ for all elements. Proof: $
    "Let" i, i' in G "be inverse elements for" a\
    i star (a star i') = (i star a) star i'\
    i star n = n star i'\
    i = i'
  $
Examples:
- The non-zero rational numbers $QQ := {p/q | p, q in ZZ: p, q != 0}$ with operation $dot$ is a group, where $n=1/1$ and $i(p / q) = q/p$
- The natural numbers $NN$ with operation $+$ is *not* a group, as there are no negative inverse elements

/ Definition - Ring: A non-empty set $R$ with operations $+$ and $dot$.
+ Addition is *always commutative* with $n=0, i=-a$
+ Multiplication is not necessarily commutative, for example a matrix ring
+ If multiplication is commutative, it is a *commutative ring* and has neutral element $n=1$
+ It is *not necessarily* a group for multiplication as $0$ may be included and has no inverse element $0 dot i != 1$

/ Definition - Field: A commutative ring $K$ (Körper) where $forall a in K | k != 0$ the inverse element for multiplication exists.
+ Addition: $n = 0, i = -a, -(-a) = a$
+ Multiplication: $n = 1, i = a^(-1), (a^(-1))^(-1) = a | a != 0$
Examples:
- $ZZ$ is a ring but not a field as there is no multiplicative inverse element for all non-zero elements
- The complete set of rational numbers $QQ := {p/q | p, q in ZZ: q != 0}$ is a commutative ring and a field.
- $0 dot a = 0$. Proof: $
    0 = 0 dot a - 0 dot a = (0-0) dot a = 0 dot a
  $

/ Definition - Cartesian Product: For the sets $X, Y$, the Cartesian product is the set of tuples (ordered lists): $X times Y := {(x, y) | x in X, y in Y}$
- The number of elements in the set is: $
    abs(X times Y) = abs(X) dot abs(Y)
  $
Example:
$
  X :={0, 1}, Y := {alpha, beta}\
  X times Y := {(0,alpha), (0, beta), (1, alpha), (1, beta)}\
$

/ Definition - Subset: A set whose elements are entirely contained in a parent set with the following notation:
- $P subset.eq Q$ - $P$ is a subset of $Q$ and they may be equal
- $P subset.neq Q$ - $P$ is a *proper* subset of $Q$; $Q$ has at least 1 additional element
- $P subset.not Q$ - There is at least one element in $P$ that is not in $Q$
- The same applies in reverse using sup(er)set notation $supset.eq$
- The symbols $subset$ and $supset$ are ambiguous in meaning
- Two sets can be shown to be equal if $P subset.eq Q and Q subset.eq P$ holds true

/ Definition - Relationship: A relationship on $X$ is the subset $Re := { (a, b) in X times X | a ~ b}$ where $~$ is an operator for expressing conditions called a relation and may have the following properties if the corresponding condition holds true $forall x, y ,z in X$:
- Reflexive - $x ~ x$ - Example: $<=$
- Transitive - $x ~ y and y ~ z => x ~ z$ - Example: $<$
- Symmetric - $x ~ y => y ~ x$ - Example: $=$
- Anti-Symmetric - $x ~ y and y ~ x => x = y$ - Example: $<=$ - Although such relations are often reflexive too, this is not a requirement, consider $<$, which is anti-symmetric (no such $x, y$ exist) but not reflexive.
- A relation is called *equivalence relation* if it is reflexive, transitive and symmetric. For example $=$ is an equivalence relation, $<=$ is not (not symmetric).
- A relation is called *order relation* if it is reflexive, transitive and anti-symmetric. For example $<=$

/ Definition - Ordered Field: This extends the definition of a field $K$ with the relation $<=$, which is denoted as $(K, <=)$, under which all elements $x, y, z in K$ satisfy the following:
+ Linearity of the order: $
x <= y or y <= x
$
+ Compatibility of order and addition: $
x <= y => x + z <= y + z
$
+ Compatibility of order and multiplication: $
 0 <= x and 0 <= y => 0 <= x dot y
$ This can be combined with the Inverse Element of addition (which exists in all fields) to make statements about multiplication of negative numbers.
Axioms 2 and 3 *also* apply to the relation $<$, which significantly simplifies proofs. Proof: https://math.stackexchange.com/a/3271338\
These conditions allow us to define conventions such as:
- Positive $:= x>0$
- Non-negative $:= x>=0$
- $(x <= y = z) equiv (x <= y and y = z)$
- An example of an ordered field is the set of rational numbers $QQ$.
- An example of a non-ordered field is the set of complex numbers $CC$, upon which an order relation cannot be defined in a way that satisfies the ordered field axioms. Proof: $
"Let" 0<= i, "condition 3. implies" 0<= i dot i = -1 "which is false" therefore i <= 0\
"Applying condition 2." i + -i <= 0 + -i => 0 <= -i\
"Applying condition 3." 0 <= -i dot -i = i^2 = -1 "which is also false and contradicts" i<= 0 qed
$
The conditions of an ordered field lead to many properties we take as given. Here are some interesting proofs:
- $(x < y and y <= z) => x < z$ - Proof: $
x < y => x <= y. <= "is a transitive relation, hence" x <= z\
"We must now show that" x< z.\
"Assume by contradiction that" not(x < z) equiv x >= z "holds true"\
"Due to" x<=z and x>= z, x = z\
"Recalling" x < y "this implies" z < y "which contradicts" y <= z\
therefore x < z qed
$
#list.item[
  If $x !=0$, $x^2 > 0$ holds true. Proof:\
  As $x !=0$ there are 2 cases:
  - $x>0$
  - $x<0$
  The ring is only guaranteed to be valid for the relation $<=$, so we will prove $x^2 >= 0$ first.\
  If $x > 0$, $x >=0$ also holds true and also $x^2>= 0$ per condition 3.\
  If $x < 0$, $x<=0$ also holds true. Applying condition 2, $(x-x <= 0-x) equiv (0 <= -x)$. Applying condition 3, $-x dot -x = x^2 >= 0$.\
  Lastly, we must show that $x^2 >= 0 => x^2 > 0$. Assume by contradiction that $exists x !=0: x^2 <= 0 => x^2 < 0$. This contradicts $x^2 >= 0$, which we have proven for all $x != 0$ in the field. Hence $x^2>0$ must also be true $qed$
]
#list.item[
  $0 < 1$. Proof:\
  Lemma: $0!= 1$ (Neutral Elements of addition and multiplication are not the same)\
  Lemma: If $x !=0$, $x^2 > 0$ holds true.
  Therefore $1^2 = 1 > 0$ $qed$
]
Based on the fact that $0 < 1$ and the compatibility + inverse element of addition, it is clear that the integers $ZZ := ..., < -1 < 0 < 1 < ...$ are a subset of any ordered field. Furthermore, the rational numbers are defined from the set of integers, which are also a subset of all ordered fields $K$:
$
  ZZ subset.neq QQ subset.eq K
$

/ Definition - Absolute Function: A function $abs(x): K -> K_+$ defined on every *ordered field* such that:
$
  abs(x) := cases(
  x & "if" x>= 0\
  -x space & "if" x <0
  )
$
- $(abs(x) <= y) equiv (-y <= x <= y)$
- $abs(x y) equiv abs(x) abs(y)$

/ Definition - Sign Function: A function $abs(x): K -> {-1, 0, 1}$ defined on every *ordered field* such that:
$
  "sgn"(x) := cases(
  1 & "if" x> 0\
  0 & "if" x= 0\
  -1 space & "if" x <0
  )
$
- Every $x in K$ can be expressed as $x= "sgn"(x) dot abs(x)$

/ Theorem - Triangle Inequality: It holds $forall x, y in K$ elements of an ordered field that:
$
  abs(x + y) <= abs(x) + abs(y)
$
The name stems from considering a triangle spanned by two vectors. It is clear that the length of their vector sum is $<=$ the sum of both side lengths. Proof (on an ordered field):\
Lemma: $abs(x) => -abs(x) <= x <= abs(x)$\
Therefore we can state the following:
$
  -abs(x) <= x <= abs(x)\
  -abs(y) <= y <= abs(y)\
$
Lemma: $x <= y => x + z <= y + z$:
$
  -abs(x) + - abs(y) <= x + -abs(y)\
  -abs(y) + x <= y + x\
$
Lemma: $x <= y and y <= z => x <= z$
$
  therefore -(abs(x) + abs(y)) <= x + y\
$
Applying the same procedure to $x <= abs(x)$ and $y <= abs(y)$ we get:
$
  -(abs(x) + abs(y)) <= x + y <= abs(x) + abs(y)
$
Lemma: $(abs(x) <= y) equiv (-y <= x <= y)$\
$
  therefore abs(x + y) <= abs(x) + abs(y) qed
$

/ Definition - Completeness Axiom: The definition of an *ordered field* so far is unsuitable as we need to "fill in the gaps". The completeness axiom is an alternative but equivalent approach to Dedekind cuts (which define the cuts first and then operations in terms of cuts) which defines a *complete ordered field* if the completeness axiom holds true:
+ Let $X, Y subset.neq K | X, Y != emptyset: forall x in X forall y in Y$ the inequality $x <= y$ holds true. If there exists $c in K | x <= c <= y$ for all such subsets $X$ and $Y$, the ordered field is complete.
- The field of real numbers $RR$ is a completely ordered field
- The reason subsets are checked instead of individual elements $x, y$ is because subsets can be defined in terms of inequalities. For example, consider checking the existence of $sqrt(2)$ in $QQ$. The set of rational numbers is *dense*, therefore no matter which lower bound $x$ we choose, there is *always* a rational number closer to $sqrt(2)$ and therefore the check $x<=c<= y$ holds true (although $sqrt(2)$ is not a member of $QQ$). On the other hand if we choose the subset $X = {x in QQ | x <= sqrt(2)}$, this contains the true infimum of $sqrt(2)$ and checks *completeness* rather than *density*. Of course, both approaches would involve checking infinitely many elements but luckily we can arrive at such an inequality from the axioms of an ordered set.

= Complex Numbers
TODO

= Functions of One Real Variable
/ Definition - Function: A function $f: X -> Y$ is a mapping from the domain $X$ to range / codomain $Y$. It *may* have the following properties:
+ _Injective_ - $forall x, x' in X : x != x' => f(x) != f(x')$ - Assigns each element of $X$ a *unique* element in $Y$
+ _Surjective_ - $forall y in Y exists x in X: f(x) = y$ - Every element in the range is a possible output of the function
+ _Bijective_ - It is both injective and surjective, and therefore an inverse function can be defined
+ Two functions are *equal* $<=> X_1 = X_2 and Y_1 = Y_2 and forall x in X, f_1(x) = f_2(x)$

/ Definition - Image and Preimage (Urbild) of a Function: Consider a function $f: X -> Y$.
- The Image $f(A)$ of $A subset.eq X$ under $f$ is defined as: $
f(A) := {y in Y | exists x in A: f(x) = y}\
f(A) subset.eq Y
$
- The Preimage (Urbild) $f^(-1)(B)$ of $B subset.eq Y$ under $f$ is defined as: $
f^(-1)(B) := {x in X | exists y in B: f(x) = y} = {x in X | f(x) in B}\
f^(-1)(B) subset.eq X
$
- A function $f: X -> Y$ is surjective $<=>$ The set $f(X) = Y$, because the image can only contain domain elements which map to $Y$ by definition.
- For example consider $f: RR -> RR := x -> 0$:
  - $f(RR) = {0}$ - It is not surjective
  - $f^(-1)(RR) = f^(-1)({0}) = RR$
  - $f^(-1)({1}) = emptyset$
There is an interesting property of finite sets; consider $f: X -> Y$, where $X$ and $Y$ are *finite* sets with the same number of elements $n$:
$
  f "is injective" <=> f "is surjective"
$
Proof:\
If $f$ is injective, the image $f(X)$ has at least $n$ distinct elements so every distinct $x in X$ has its own $y in f(X)$.\
Lemma: A function $f: X -> Y$ is surjective $<=>$ The set $f(X) = Y$\
We are given that $Y$ has $n$ elements, and since $f(X) subset.eq Y => f(X) = Y$ showing that it must also be surjective.\
We must now show that surjectivity $=>$ injectivity. If $f$ is surjective, $f(X) = Y$ (Lemma), therefore $f(X)$ has $n$ elements.\
Consider two elements $x_1,x_2 in X$. Since $X$ is a set, they are distinct $x_1 != x_2$.\
If $f(x_1) = f(x_2)$ for any two elements, they would "validate" the same member of $f(X)$, leaving out at least one element of $Y$ (deterministic, another input cannot have 2 outputs to make up for it) meaning $f(X)$ would have $n-1$ elements, which contradicts the lemma about surjectivity, therefore $f$ must also be injective $qed$\
This is *not* necessarily true for infinite sets, for example $f: NN -> NN, f(x) := x+1$ is injective but not surjective.

/ Definition - Square Root: This is the bijective function $sqrt(dot): RR_(>=0) -> RR_(>=0)$ such that $forall a in RR_(>=0) (sqrt(a))^2 = a$, whose existence is only possible due to the real numbers being a *complete ordered field*. TODO: Various proofs Exercise 2.27 Figalli's script

TODO:
*The range of a continuous function with / bounded to a compact domain is also compact.*

The maxi-, mini-, supre- and infimum of a function are defined as expected on its range.

*Every continuous function with a compact domain and therefore range possesses a maximum and minimum.*

=== Topological Continuity Definitions
Continuity of a function can also be defined with the following topological criteria:

==== Closed / Open Sets
$
  f: X -> Y "is continuous" <=>\ "The inverse image (Urbild) of every relatively open / closed subset in" X "is also relatively open / closed."
$

==== Neighbourhoods
$
  f: X -> Y "is continuous" <=>\ "The inverse image of every neighbourhood at point" f(
    x_0
  ) "in" Y "is also a neighbourhood of" x_0 "in" X
$
