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

Proofs heavily involve decomposition; to progress, smaller Lemmas need to be brought in along the way and proven (or taken as true since someone else proved them). However first of all, you need to understand and remember the axioms (rules of the game). Intuition is helpful but doesn't prove anything unless it can be formulated as a series of statements a computer can verify

Mathematics - Abstracting enough to focus on the matter

Contradiction is a useful tool for linking statements about $>$ and $>=$.

Conjecture - A conclusion formed on the basis of incomplete information
Prove uniqueness through trichotomy, existence by completeness axiom.

TODO: Read Einsiedler einführung

#pagebreak()

= Fundamentals

/ Definition - Set: An *unordered* collection of *distinct* (${x, x} equiv {x}$) elements such that:
+ It is defined by the elements it contains
+ It is not an element of itself, this prevents Russell's Paradox: ${x | x in.not x}$
+ Its elements can be filtered by a series of statements which hold true, for example the set of even integers: $
    {n in ZZ | exists m in ZZ: n = 2m}
  $ Where $|$ and $:$ both mean "such that".
+ The empty set $emptyset$ contains no elements

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

/ Definition - Power Set: The power set of a set $X$ is the set of all subsets:
$
  cal(P)(X) := {"Set" Q | Q subset.eq X}
$
Example:
$
  X ={0, 1, 2}\
  cal(P)(X) = {emptyset, {0}, {1}, {2}, {0, 1}, {0, 2}, {1, 2}, {0, 1, 2}}
$

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
- Addition: $
 P + Q := {p + q | p in P and q in Q}
$
- Multiplication: $
 P dot Q := {p dot q | p in P and q in Q}
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

/ Definition - Maxima and Minima: The maximum of a set is the smallest upper bound, which is *contained* in the set:
$
  X subset.eq\
  max(X) := m in X | forall x in X x<= m
$
The *minimum* is defined analogously:
$
  min(X) := m in X | forall x in X x>= m
$
- An open bound has no maximum or minimum defined as there is always some number slightly larger / smaller than a number we can express inside it. An open bound itself is not in the set
- The maximum / minimum is unique. Proof: Let $m_1, m_2$ be 2 maxima of the set. It follows $m_1 <= m_2$ and $m_2 <= m_1$, therefore $m_1 = m_2$ (trichotomy)

/ Definition - Supremum and Infimum: Let $B = {b in RR | forall x in X x <= (>=) b}$ be the set of upper (lower) bounds for the set $X$. The supremum (infimum) is defined as the smallest (largest) such bound:
$
  sup(X) := min(B)\
  inf(X) := max((B))
$
- Due to the $<= (>=)$ the supremum infimum may be the same as the maximum / minimum for a closed bound
- An alternative characterization states there is no smaller bound, anything smaller is not a bound of $X$:
$
  forall x in X x<= sup(X), t <= sup(X) => exists x' in X: t < x'
$
- The supremum / infimum does *not* exist for an unbounded or empty set, as this would be infinitely large / small, and $oo in.not RR therefore oo in.not B$
#list.item[For all bounded, non-empty sets $X$, the supremum / infimum exists.\
  Proof:\
  The set of bounds $B = {b in RR | forall x in X x <= (>=) b} != emptyset$\
  We need to show that $exists sup(X) in RR | forall b in B, sup(X) <= b$\
  Lemma: Completeness Axiom $forall x in X forall b in B, x <= b => exists c in RR | x <= c <= b forall x in X forall b in B$
  This $c$ is an upper bound *and* minimum of $B$, therefore it is the supremum $qed$
]
Let $X, Y$ be non-empty sets with an upper bound:
- $sup(X union Y) = max(sup(X), sup(Y))$
- $sup(X sect Y) = min(sup(X), sup(Y)) | (X sect Y) != emptyset$
- $sup(X + Y) = sup(X)+ sup(Y)$
- $sup(X dot Y) = sup(X)dot sup(Y) | forall x in X forall y in Y x, y >= 0$ (two "large" negative elements can make a larger supremum)
TODO: Review proof 2.59

/ Definition - Characteristic Function: $X subset.eq Y$, the characteristic / indicator function $chi_X: Y -> {0, 1}$ indicates whether an element is part of a set:
$
  chi_X (x) := cases(
  1 "if" x in X,
  0 "otherwise"
)
$

/ Definition - Restriction Function: A new function can be defined with a smaller domain:
$
  f: X -> Y, A subset.eq X\
  f |_A: A -> Y
$

= Topology

/ Definition - Ball / Disk: A topological ball with radius $r$ and center $x_0 in RR^d$ in dimension $RR^d$ is defined as the set of points:
$
  B_r^d (x_0) = {x in RR^d | abs(x - x_0) < r} - "Open ball"\
  overline(B_r^d)(x_0) = {x in RR^d | abs(x - x_0) <= r} - "Closed ball"\
  S_r^(d-1)(x_0) = {x in RR^d | abs(x - x_0) = r} - "Sphere (boundary of ball)"
$
Where $abs(x - x_0)$ is the length of the vector from $x_0 -> x$ ie the radius. This can also be defined using complex numbers and the complex absolute function.
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

/ Definition - Bounded: A set which is a subset of a closed set (other than $RR^n$). In other words, the set of bounds $B = {b in RR^n | forall x in X x <= (>=) b} != emptyset$.

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

/ Definition - Field (Körper): A commutative ring $K$ (Körper) where $forall a in K | k != 0$ the inverse element for multiplication exists.
+ Addition: $n = 0, i = -a, -(-a) = a$
+ Multiplication: $n = 1, i = a^(-1), (a^(-1))^(-1) = a | a != 0$
Examples:
- $ZZ$ is a ring but not a field as there is no multiplicative inverse element for all non-zero elements
- The complete set of rational numbers $QQ := {p/q | p, q in ZZ: q != 0}$ is a commutative ring and a field.
- $0 dot a = 0$. Proof: $
    0 = 0 dot a - 0 dot a = (0-0) dot a = 0 dot a
  $

/ Definition - Relationship: A relationship on $X$ is the subset $Re := { (a, b) in X times X | a ~ b}$ where $~$ is an operator for expressing conditions called a relation and may have the following properties if the corresponding condition holds true $forall x, y ,z in X$:
- Reflexive - $x ~ x$ - Example: $<=$
- Transitive - $x ~ y and y ~ z => x ~ z$ - Example: $<$
- Symmetric - $x ~ y => y ~ x$ - Example: $=, !=$
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
- An example of a non-ordered field is the set of complex numbers $CC$
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
An alternative, the *inverse triangle inequality* can also be useful:
$
  abs(x - y) >= abs(abs(x) - abs(y))
$

/ Definition - Completeness Axiom: The definition of an *ordered field* so far is unsuitable as we need to "fill in the gaps". The completeness axiom is an alternative but equivalent approach to Dedekind cuts (which define the cuts first and then operations in terms of cuts) which defines a *complete ordered field* if the completeness axiom holds true:
+ Let $X, Y subset.neq K | X, Y != emptyset: forall x in X forall y in Y$ the inequality $x <= y$ holds true. If there exists $c in K | x <= c <= y$ for all such subsets $X$ and $Y$, the ordered field is complete.
- The field of real numbers $RR$ is a completely ordered field
- The reason subsets are checked instead of individual elements $x, y$ is because subsets can be defined in terms of inequalities. For example, consider checking the existence of $sqrt(2)$ in $QQ$. The set of rational numbers is *dense*, therefore no matter which lower bound $x$ we choose, there is *always* a rational number closer to $sqrt(2)$ and therefore the check $x<=c<= y$ holds true (although $sqrt(2)$ is not a member of $QQ$). On the other hand if we choose the subset $X = {x in QQ | x <= sqrt(2)}$, this contains the true infimum of $sqrt(2)$ and checks *completeness* rather than *density*. Of course, both approaches would involve checking infinitely many elements but luckily we can arrive at such an inequality from the axioms of an ordered set.

/ Definition - Compactification: The reals can be extended to be compact (closed an bounded) with $-oo, oo$ for certain purposes, such as defining the supremum / infimum of an unbounded / empty set:
$
  overline(R) = RR union {-oo, oo}\
  forall x in RR, -oo < x < oo
$
Certain conventions are defined, however these are ambiguous and should be used sparingly:
$
  oo + x = oo\
  -oo + x = -oo\
  x dot oo = oo | x >0\
  sup(emptyset) = -oo\
  inf(emptyset) = oo\
$

/ Definition - Archimedean Principle: For every $x in RR$ there exists *exactly one* $n in ZZ | n <= x < n + 1$. In simpler words, $forall x in RR exists z in ZZ | z > x$

/ Definition - Integer / Fractional Part: The integer part of any $r in RR$ is given by the floor function $floor(dot): RR -> ZZ$ which returns the lower $n$ which exists due to the Archimedean principle.\
The fractional part is given by $r - floor(r) in [0, 1)$

/ Corollary - $1/n$ is arbitrarily small: $forall epsilon in RR | epsilon > 0 exists n in ZZ | n >= 1 and 1 / n < epsilon$.\
Proof:\
If $epsilon > 1$ this holds true with $n = 1$.\
For $epsilon <= 1$, $1/epsilon >= 1$. The Archimedian principle states that there always exists a $n >=1| n > 1/epsilon$, which becomes $1/n < epsilon qed$

/ Definition - Cardinality: The cardinality of two sets describes their relative "sizes".
- $X ~ Y$ - We say two sets $X$ and $Y$ have the same cardinality (the same number of elements) if there exists a *bijective* mapping $f: X -> Y$. Surjectivity guarantees that $abs(Y) >= abs(X)$ and injectivity guarantees $abs(X) >= abs(Y)$, which leads to$abs(X) = abs(Y)$ (trichotomy).
- $X <_~ Y$ - $X$ is *smaller than or equal to* $Y$ if there exists an injective mapping $f: X -> Y$
- $X <_~ Y and Y <_~ X = > X ~ Y$ - One can find a bijective mapping (Schröder-Bernstein Theorem)
- $abs(emptyset) = 0$
- $exists f: X -> {1, 2, ..., n} "is bijective" =>abs(X) =n, X "is finite"$
- $abs(NN) = aleph_0$ - A set which has the same cardinality as $NN$ is called *countable*

/ Theorem - Cantor's Theorem: The power set $cal(P)(X)$ of any (infinite too) non-empty set $X$ is larger than and not equal to $X$.\
This reveals that $cal(P)(NN) > NN and cal(P)(NN) != NN$ which is useful for showing that other sets are larger than or equal to $cal(P)(NN)$ ($exists$ injection) and therefore also uncountable.\
Proof:\
Although this may seem obvious, when dealing with infinity it is easier to write a formal proof than find logical reasoning behind the intuition.\
First we must show that there is an injective mapping $i: X -> cal(P)(X)$, which indeed exists: $x in X -> {x}$.\
Now we show that there is *no* surjective mapping. Assume by contradiction that such a mapping $s: X -> cal(P)(X)$ exists.\
We will demonstrate its absurdity by defining the subset:
$
  B = {x in X | x in.not f(x)} subset.eq X
$
For every $x in X$ there are two cases:
1. $x in s(x)$, therefore $x in.not B$ and $s(x) != B$ because $x$ would need to be a member of $B$ for them to be equal
2. $x in.not s(x)$, therefore $x in B$ and $s(x) != B$ because $x$ would need to be a member of $s(x)$ for them to be equal
We have shown that $exists.not x in X | s(x) = B$ and because $B in cal(P)(X)$, there exists no surjective mapping $s: X -> cal(P)(X) qed$

/ Theorem - $RR$ is Uncountable: To prove this, we can find an injection $i: cal(P)(NN) -> RR$, which is given from the decimal expansion of reals TODO: Understand Cantor diagonalization

= Sequences of Real Numbers
/ Definition - Sequence: A sequence is a function $a: NN -> RR$ which is often written as $(a_n)_(n in NN)$
- A sequence is called *constant* if $forall n, m in NN, a_n = a_m$ and *eventually constant* if $exists N in NN | forall n, m >= N, a_n = a_m$

/ Definition - Convergence: A sequence is said to *converge towards $A$* if:
$
  exists A in RR forall epsilon in (0, oo) exists N in NN | forall n in NN: n >= N, abs(a_n - A) < epsilon\
  lim_(n -> oo) a_n = A
$
- *Divergence* can be proved by proving the conjugate:
$
  forall A in RR exists epsilon in (0, oo) forall N in NN_0 exists n in N: n >= N, abs(N - A) > epsilon\
$
#list.item[A convergent sequence has *only one* limit. Proof:\
  Let $A_1, A_2 in RR$ be two limits of the sequence $a_n$.\
  Due to the convergence criteria:$
  exists N_1, N_2 in NN | forall n >= max(N_1, N_2), abs(a_n - A_1) < epsilon and abs(a_n - A_2) < epsilon, forall epsilon in (0, oo)\
  0 < epsilon - abs(a_n - A_1), 0 < epsilon - abs(a_n - A_2)\
  therefore abs(a_n - A_1) + abs(a_n - A_2)< 2 epsilon\
$
  Applying the Lemma $abs(a + b) <= abs(a) + abs(b)$: $
  a_n - A_1 - (a_n - A_2) = A_2 - A_1\
  0 <= abs(A_2 + (-A_1)) <= abs(a_n - A_1) + abs(-(a_n - A_2))< 2epsilon
  $
  Since $abs(-x) = abs(x) >= 0$, and this is true $ forall epsilon > 0$:
  $
    abs(A_2 -A_1) = 0 = A_2 - A_1\
    A_2 = A_1 qed
  $
]
- The sequence $a_n = 1/n$ converges to 0, because $forall epsilon > 0, exists n in ZZ | 1/n < epsilon$, satisfying the criteria of convergence $abs(1/n - 0) < epsilon$

/ Definition - Subsequence: A subsequence of $a_n$ is any sequence obtained by keeping certain elements $a_n_i$ indexed by $i_k_(k in NN) | forall k in NN, i_(k + 1) > i_k$
- It follows that $i_k >= k$ (proof by induction invoking the property of natural numbers $x > y => x>= y + 1$
- A sequence can have convergent subsequences *without* itself converging, for example $a_n = (-1)^n$ does not converge but the subsequences $a_(2n), a_(2n +1)$ are constant and convergent

/ Lemma - Subsequences of a Convergent Sequence are Convergent to the Same Limit: Proof:\
Let $a_n_i$ (indexed by $i_k_(k in NN)$) be a subsequence of $a_n$, which converges to $A in RR$, ie $exists N in NN | forall n > N, abs(a_n - A) < epsilon$.\
$i_k >= k  => j >= n$ is a term of $i_k$, which satisfies the convergence condition for the same $A$, along with all subsequent elements.

/ Definition - Accumulation Point: A point $A in RR$ is called an *accumulation point* of a sequence $a_n$ if:
$
  forall epsilon > 0 forall N in NN exists n in NN | n >= N and abs(a_n - A) < epsilon
$
This no longer requires that every $n >= N$ is close to $A$, just that such an $n$ can be chosen for every minimum $N$ (which is a similar notion to choosing the terms that make up a converging subsequence). For example, both $1$ and $-1$ are accumulation points of $a_n = (-1)^n$ but not limits.\
The following corollaries apply:
- $A$ is an accumulation point of a sequence $a_n <=>$ There exists a subsequence of $a_n$ which converges towards $A$
- $forall epsilon > 0$ there are infinitely many elements of the sequence $a_n$ near an accumulation point $(A - epsilon, A + epsilon)$. This follows from the fact that there is a subsequence that converges to $A$ and all elements of the subsequence after $N$ are both close to $A$ *and* elements of the parent sequence.
- A convergent sequence's limit is its *unique* accumulation point. The Lemma states: "All subsequences of a convergent sequence are convergent to the same limit" and applying the first corollary proves that they all correspond to the same accumulation point.

/ Definition - Ring of Sequences: Sequences $in RR$ form a commutative ring together with point wise addition and multiplication and the constant sequences $0_n$ and $1_n$ as neutral elements:
$
  a_n + b_n = (a + b)_n\
  a_n dot b_n = (a dot b)_n\
  alpha dot b_n = (alpha dot b)_n
$
- They do not form a field under pointwise multiplication, as a non-zero sequence may still contain $0 in RR$ in it, which under real multiplication has no inverse $0 dot i != 1$.

/ Theorem - Operations on Limits: Operations on the sequence $x_n$ which converges to $X$ and $y_n$ which converges to $Y$ have the following effects on their limits:
#enum.item[$(x_n + y_n)_n -> X + Y$ Proof:\
  We can say the following about these sequences:
  $
    forall epsilon > 0 exists n in NN | n >= max(N_x, N_y) and abs(x_n - X) < epsilon and abs(y_n - Y) < epsilon
  $
  To show that $(x_n + y_n)_n$ converges to $X+Y$, we need to show $abs((x_n + y_n) - (X + Y)) < epsilon$ for increasing $n$. Due to $0<=abs(x)$ and the compatibility of addition in the ordered field $RR$, we can add these inequalities:
  $
    abs(x_n - X) + abs(y_n - Y) < 2 epsilon
  $
  Applying the triangle inequality:
  $
    abs(x_n - X + y_n - Y) = abs((x_n + y_n) - (X + Y)) < 2 epsilon qed
  $
  Similar proofs for 2, 3 and 4
]
+ $(x_n dot y_n)_n -> X dot Y$
+ $forall alpha in RR, alpha dot x_n -> alpha X$
+ $forall n in NN, x_n !=0 and X != 0 => (x^(-1))_n -> X^(-1)$
Furthermore:
#enum.item[$X < Y => exists N in NN | forall n > N, x_n < y_n$\
  Proof:\
  Since both sequences converge, there exists: $
exists N | forall epsilon > 0, forall n>N, abs(x_n - X) < epsilon and abs(y_n - Y) < epsilon
$
  We want to consider the case of $X < Y$ and look for terms that "surround" this inequality. These inequalities can be rewritten as:
  $
    -epsilon + X< x_n < epsilon + X\
    -epsilon + Y< y_n < epsilon + Y\
    x_n - epsilon < X\
    y_n + epsilon > Y\
    x_n - epsilon < X <Y < y_n + epsilon\
    x_n - epsilon < y_n + epsilon\
  $
  Since $epsilon$ can be chosen to tend towards $0$, $x_n < y_n forall n> N qed$
]
+ $(exists N in NN | forall n> N, x_n < y_n) => X <= Y$. This can be proved by contradiction using the previous Lemma. We cannot say $X <Y$, for example the two sequences $x_n = -1/n, y_n = 1/n$ approach their limit $0$ from different sides.
These can be very useful to calculate the limits of complicated expressions, for example:
$
  lim_(n-> oo) (7n^4+15) / (3n^4+n^3+n-1) = lim_(n->oo) (7+15 n^(-4)) / (3+n^3n^(-4)+n n^(-4)-1n^(-4)) = lim_(n->oo) (7+15 n^(-4)) / (3+n^(-1)+n^(-3)-n^(-4))\
  x >= 1, lim_(n->oo) n^(-x) = 0\
  therefore 7 / 3
$
Care must be taken to not divide by $0$ or $oo$ when simplifying such limits.

/ Lemma - Sandwich Lemma: Consider 3 sequences, such that $exists N in NN | forall n > N | x_n <= y_n <= z_n$. If $x_n$ and $z_n$ converge to the same limit, the sequence $y_n$ also converges to the same limit. The proof follows from the previous Lemma $(exists N in NN | forall n> N, x_n < y_n) => X <= Y$ applied for both $x_n$ and $z_n$ and the principle of trichotomy.

/ Definition - Bounded Sequence: A sequence is bounded if $exists M in RR | M >= 0, abs(x_n) <= M forall n in NN$. This is different from a limit as the sequence may oscillate between negative and positive.
- Every convergent sequence is bounded (but not every bounded sequence is convergent). Proof: The bound $M$ is $max(abs(A), abs(x_1), abs(x_2), ..., abs(x_(N-1)))$, where $N$ is finite.
- Bounded sequences have at least 1 accumulation point / a convergent subsequence.

/ Definition - Monotone Sequence: A sequence $x_n$ is called (strictly) monotonically increasing / decreasing if:
$
  (forall m, n in NN | m > n) => x_m >= (>) x_n\
  (forall m, n in NN | m > n) => x_m <= (<) x_n
$
- Consider a monotone sequence. It is bounded $<=>$ it converges, such that:
$
  "Montonically increasing:" lim_(n -> oo) x_n = sup{x_n | n in NN}\
  "Montonically decreasing:" lim_(n -> oo) x_n = inf{x_n | n in NN}
$
Proof:\
I state the following facts:
$
  "Monotonically increasing:" (forall m, n in NN | m > n) => x_m >= x_n\
  "Bounded:" exists M in RR | M >= 0, forall b in NN, abs(x_b) <= M, -M <= x_b <= M\
  "Supremum: " min{b in RR | forall x in X,x <= b}
$
I aim to show convergence by combining these definitions towards: $exists A in RR forall epsilon in (0, oo) exists N in NN | forall n in NN: n >= N, abs(a_n - A) < epsilon$.\
The existence of a bound $M$ shows that the bound set is *not* empty and a supremum "on the sequence" exists (although it may be smaller to $M$). Let $A in RR$ be such a supremum:
$
  forall x_n, -A <= x_n <= A \
  therefore x_n - A <= 0
$
Since $epsilon >0$, we can rearrange this to:
$
  x_n - A < epsilon
$
We now wish to show $-epsilon < x_n - A$. It is given $x_(n) >= x_(n-1)$. Furthermore, $x_(n-1)$ also respects the bound $A$. Hence:
$
  -A<= x_(n-1) <= x_n\
$
TODO: This proof is taking too long :( but I think I am almost there. Hoping to apply the definition of the absolute function, $abs(x_n - A) < epsilon$. I also need to show that there is an $N$ after which this is valid, will try again another time...

/ Definition - Superior / Inferior Limits: These can be thought of as the steady-state bounds of a sequence. Consider the sequence $s_n = sup{x_k | k>=n}$ based on the sequence $x_n$. As the starting term to be included $n$ gets larger, the supremum can only stay the same or get smaller (monotonically decreasing) because $m> n, {x_k | k>=m} subset.neq {x_k | k>=n}$, ie. the starting terms get excluded and $therefore s_m <= s_n$. *If the sequence $x_n$ is bounded*, $s_n$ is also bounded as the first (and subsequent) suprema are a real, non-infinite number. Therefore, $s_n$ converges to $inf{s_n | n in NN}$ and vice versa for the inferior limit $i_n$, such that:
$
  forall n in NN, i_n <= x_n <= s_n\
  (lim sup)_(n-> oo) x_n = lim_(n -> oo) (sup{x_k | k>= n}) = inf{sup{x_k | k>= n} | n in NN}\
  (lim inf)_(n-> oo) x_n = lim_(n -> oo) (inf{x_k | k>= n}) = sup{inf{x_k | k>= n} | n in NN}\
  (lim inf)_(n-> oo) x_n <= (lim sup)_(n-> oo) x_n
$
#figure(
  image("images/limsup.png", width: 60%),
) <fig-limsup>
- The superior and inferior limits of all *bounded* sequences are accumulation points, and therefore have convergent subsequences:
$
  A = "Set of accumulation points"\
  (lim sup)_(n-> oo) x_n = max(A)\
  (lim inf)_(n-> oo) x_n = inf(A)
$

/ Theorem - Squeeze Theorem: This is known as the *squeeze theorem* as the bounds squeeze towards the limit from either side and is an alternative criteria for convergence:
$
  "A sequence converges"<=> (lim inf)_(n-> oo) x_n = (lim sup)_(n-> oo) x_n
$
Proof:\
Let $s_n= sup{x_k | k>=n}$, $i_n= inf{x_k | k>=n}$, we know that $forall n in NN, i_n <= x_n <= s_n$.\
It is given that $s_n$ and $i_n$ converge to the same limit, therefore $x_n$ also converges to this limit (sandwich lemma).\
To show convergence $=> lim sup = lim inf$, as $n->oo$, the minimum index for convergence $N$ will have been reached and:
$
  forall n> N forall epsilon in RR | epsilon > 0, -epsilon< x_n -A < epsilon\
  A - epsilon< x_n < A + epsilon\
  A - epsilon< i_n <= s_n < A + epsilon\
$
This can be rearranged to convergence criteria for $s_n$ and $i_n$, showing that their limits are equal:
$
  forall epsilon > 0, A - epsilon < i_n < A + epsilon => abs(i_n - A) < epsilon\
  abs(s_n - A) < epsilon qed
$

/ Definition - Cauchy Sequence: A sequence is a *Cauchy Sequence* if:
$
  forall epsilon > 0 exists N in NN | forall n, m> N, abs(x_n - x_m) < epsilon
$
- They are bounded
- A sequence converges $<=>$ it is a Cauchy sequence.\
Proof:\
Let $x_n$ be a sequence converging to $A$:
$
  forall epsilon > 0 exists N in NN | forall n > N, abs(x_n - A) < epsilon\
  m > N => abs(x_m - A) < epsilon\
  abs(x_n - A) + -abs(x_m - A) < epsilon
$
Applying the triangle inequality:
$
  abs(x_n  - x_m) < epsilon
$
Since $epsilon$ is arbitrary, this shows that it is a Cauchy sequence. Now we must show that this implies that it converges, let $x_n$ be a Cauchy sequence. Because it is bounded, there exists a subsequence $x_n_k$ which converges to the bound $A$ as $n->oo$:
$
  abs(x_n_k - A) < epsilon\
  abs(x_n_k - A) + < 2epsilon
$

= Complex Numbers
/ Definition - Complex Numbers: The set of complex numbers $CC$ is defined from the Cartesian coordinates, where the $+$ can be thought of as a substitute for the comma in a tuple, and $i$ is called the *complex unit*:
$
  z = a + b i in CC := RR^2 = {(a, b) | a, b in RR}\
  a = "Re"(z)\
  b = "Im"(z)\
$
Complex addition $+_CC$ and multiplication $dot_CC$ are defined such that $CC$ is a field (the operations follow the conditions for a ring excluding division by 0) *and* $i^2 = -1$ holds:
$
  (a + b i) +_CC (c + d i) = (a + b) + (c + d)i\
  (a + b i) dot_CC (c + d i) = a c + a d i + b c i + b d i^2\
  = (a c - b d) + (a d + b c) i
$
- Addition has Neutral Element $(0,0) = 0$ and Inverse Element $(-a, -b) = -a - b i$
- Multiplication has Neutral Element $(1,0) = 1$ and (non-zero) Inverse Element $(a/(a^2 + b^2), -b/(a^2 + b^2))$
- The same notation as in $RR$ is normally used, for example $-(i) = (-0, -1) = -i$ and $i^(-1) = (0, -1) = -i$
- An order relation cannot be defined in a way that satisfies the ordered field axioms. Proof: $
"Let" 0<= i, "condition 3. implies" 0<= i dot i = -1 "which is false" therefore i <= 0\
"Applying condition 2." i + -i <= 0 + -i => 0 <= -i\
"Applying condition 3." 0 <= -i dot -i = i^2 = -1 "which is also false and contradicts" i<= 0 qed
$
Nevertheless, they satisfy a generalization of the completeness axiom and we can perform calculus on them.

/ Definition - Complex Conjugate: The mapping $overline(dot): CC -> CC$ of a complex number $z = a + b i in CC$ is denoted as $overline(z)$ and defined:
$
  overline(z) := a - b i
$
It has the following properties $forall z, w in CC$:
- $z dot overline(z) in RR >= 0$
- $overline(z + w) = overline(z) + overline(w)$
- $overline(z dot w) = overline(z) dot overline(w)$
- $overline(z dot w) = overline(z) dot overline(w)$
- $"Re"(z) = (z + overline(z)) / 2$
- $"Im"(z) = (z - overline(z)) / (2i)$

/ Definition - Complex Absolute Function: The complex absolute function $abs(dot): CC -> RR$ is defined as:
$
  abs(z = a + b i) := sqrt(z dot overline(z)) = sqrt(a^2 + b^2)
$
- $abs(z dot w) = sqrt((z dot w) dot overline(z dot w)) = sqrt(z dot overline(z) dot w dot overline(w)) = sqrt(z dot overline(z)) dot sqrt(w dot overline(w)) = abs(z) dot abs(w)$
- It has the same notion of length when complex numbers are plotted on an Argand diagram

/ Theorem - Cauchy-Schwartz Inequality: $forall z= x_1 + y_1 i, w = x_2 + y_2 i in CC$:
$
  x_1 x_2 + y_1 y_2 <= abs(z dot w)
$
Proof:\
Through algebraic rearrangement, we can show that:
$
  abs(z dot w) - x_1 x_2 + y_1 y_2 = (x_1 y_2 -x_2 y_1)^2
$
Lemma: $x^2 >= 0$\
Therefore $abs(z dot w) - x_1 x_2 + y_1 y_2 >= 0$\
By applying the compatibility of addition in an ordered field (although $CC$ is not an ordered field, $abs(x dot w)$ can be expressed in terms of the component real numbers), we arrive at:
$
  abs(z dot w) >= x_1 x_2 + y_1 y_2 qed
$

/ Theorem - Complex Triangle Inequality: We can show that the triangle inequality also holds true $forall z= x_1 + y_1 i, w = x_2 + y_2 i in CC$:
$
  abs(z + w) <= abs(z) + abs(w)
$
Proof:\
Through algebraic rearrangement, we can show:
$
  abs(z + w)^2 = abs(z)^2 + abs(w)^2 + 2(x_1 x_2 + y_1 y_2)
$
Applying the Cauchy-Schwarz Inequality:
$
  abs(z)^2 + abs(w)^2 + 2(x_1 x_2 + y_1 y_2) <= abs(z)^2 + abs(w)^2 + 2abs(z dot w)\
  abs(z + w)^2 <= (abs(z) + abs(w))^2\
  therefore abs(z + w) <= abs(z) + abs(w)
$

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
