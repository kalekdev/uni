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

Contradiction is a useful tool for linking statements about $>$ and $>=$. When in doubt, assume by contradiction

Conjecture - A conclusion formed on the basis of incomplete information
Prove uniqueness through trichotomy, existence by completeness axiom.
The convergence of a sequence can be simplified by considering long-term values of n, for example $n>abs(x)$ which often simplifies the n'th term (as in the case of Bernoulli's sequence for $e$)
Finding two convergent boundaries around a sequence can be used to find its limit (squeeze theorem)

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
  X subset.eq RR\
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
  inf(X) := max(B)
$
- Due to the $<= (>=)$ the supremum infimum may be the same as the maximum / minimum for a set with closed bounds
- An alternative characterization states there is no smaller bound, anything smaller is not a bound of $X$:
$
  forall x in X | x<= sup(X) exists x' in X: x < x'
$
- Formally, the supremum / infimum does *not* exist for an unbounded or empty set, as there are no strictly real bounds ($oo in.not RR$). However by convention the compactified reals are used and $plus.minus oo$ is permitted.
#list.item[For all bounded, non-empty sets $X$, the supremum / infimum exists.\
  Proof:\
  The set of bounds $B = {b in RR | forall x in X x <= (>=) b} != emptyset$\
  We need to show that $exists sup(X) in RR | forall b in B, sup(X) <= b$\
  Lemma: Completeness Axiom $forall x in X forall b in B, x <= b => exists c in RR | x <= c <= b forall x in X forall b in B$\
  This $c$ is an upper bound *and* minimum of $B$, therefore it is the supremum $qed$
]
Let $X, Y$ be non-empty sets with an upper bound:
- $sup(X union Y) = max(sup(X), sup(Y))$
- $sup(X sect Y) = min(sup(X), sup(Y)) | (X sect Y) != emptyset$
- $sup(X + Y) = sup(X)+ sup(Y)$
- $sup(X dot Y) = sup(X)dot sup(Y) | forall x in X forall y in Y x, y >= 0$ (two "large" negative elements can make a larger supremum)
TODO: Review proof 2.59

/ Definition - Identity Function: This function simply outputs its input and is needed to define the inverse of a function:
$
  id: X -> X\
  id(x):= x
$

/ Definition - Characteristic Function: $X subset.eq Y$, the characteristic / indicator function $chi_X: Y -> {0, 1}$ indicates whether an element is part of a set:
$
  chi_X (x) := cases(
  1 "if" x in X,
  0 "otherwise"
)
$

/ Definition - Restriction Function: A new function can be defined with a smaller domain, which is useful for drawing conclusions from its properties over that domain:
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
  exists O | x_0 in O and O subset.eq U subset.eq X
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
- An alternative, the *inverse triangle inequality* can also be useful: $
  abs(x - y) >= abs(abs(x) - abs(y))
$
- Setting $y=x_2 + x_3$ and applying the inequality again expands it to: $
abs(x_1) + abs(x_2) + abs(x_3) + ... >= abs(x_1 + x_2 + x_3 + ...)
$ By induction this holds true $forall n in NN$: $
sum_(k=0)^n abs(a_k) >= abs(sum_(k=0)^n a_k)
$
- TODO: Linear algebra, this extends to any n-dimensional normed vector space, proven by the Cauchy-Schwartz inequality

/ Definition - Completeness Axiom: The ordered field of rational numbers is still unsuitable as we need to "fill in the gaps". The completeness axiom is an alternative but equivalent approach to Dedekind cuts (which define the cuts first and then operations in terms of cuts) which characterizes a *complete ordered field* if the completeness axiom holds true:
+ Let $X, Y subset.neq K | X, Y != emptyset: forall x in X forall y in Y$ the inequality $x < y$ holds true. If there exists $c in K | x < c < y forall x, y$ for all such subsets $X$ and $Y$, the ordered field is complete.
- The field of real numbers $RR$ is a completely ordered extension of $QQ$
- The reason subsets are checked instead of individual elements $x, y$ is because subsets can be defined in terms of inequalities. For example, consider checking the existence of $sqrt(2)$ in $QQ$. The set of rational numbers is *dense*, therefore no matter which lower bound $x$ we choose, there is *always* a rational number closer to $sqrt(2)$ and therefore the check $x<=c<= y$ holds true (although $sqrt(2)$ is not a member of $QQ$). On the other hand if we choose the subset $X = {x in QQ | x < sqrt(2)}$, this contains every possible rational $< sqrt(2)$ and checks *completeness* rather than *density*. Of course, both approaches would involve checking infinitely many elements but luckily we can arrive at such an inequality from the axioms of an ordered set.

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
/ Definition - Sequence: A sequence is a function $a: NN -> RR$ which is often written as $(a_n)_(n in NN)$, such that the input $n$ serves as an ordered index for the outputs (hence the natural numbers are used).
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

/ Definition - Bounded Sequence: A sequence is bounded if $exists M in RR | M >= 0, abs(x_n) <= M forall n in NN$. This is different from a limit as the sequence may oscillate between negative and positive.\
A sequence is unbounded if $forall M in RR | M >= 0,exists n in NN | abs(x_n) >= M $
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
The existence of a bound $M$ shows that the bound set is *not* empty and a supremum "on the sequence" exists (it may be smaller than $M$). Let $A in RR$ be such a supremum:
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
TODO: This proof is taking too long :( but I think I am almost there, it is rather important so I certainly need to come back to it later. Hoping to apply the definition of the absolute function, $abs(x_n - A) < epsilon$. I also need to show that there is an $N$ after which this is valid, will try again another time...

/ Definition - Superior / Inferior Limits: These can be thought of as the steady-state bounds of a sequence. Consider the sequence $s_n = sup{x_k | k>=n}$ based on the sequence $x_n$. As the starting term to be included $n$ gets larger, the supremum can only stay the same or get smaller (monotonically decreasing) because $m> n, {x_k | k>=m} subset.neq {x_k | k>=n}$, ie. the starting terms get excluded and $therefore s_m <= s_n$. *If the sequence $x_n$ is bounded*, $s_n$ is also bounded as the first (and subsequent) suprema are a real, non-infinite number. Therefore, $s_n$ converges to $inf{s_n | n in NN}$ and vice versa for the inferior limit $i_n$, such that:
$
  forall n in NN, i_n <= x_n <= s_n\
  (lim sup)_(n-> oo) x_n = lim_(n -> oo) (sup{x_k | k>= n}) = inf{sup{x_k | k>= n} | n in NN}\
  (lim inf)_(n-> oo) x_n = lim_(n -> oo) (inf{x_k | k>= n}) = sup{inf{x_k | k>= n} | n in NN}\
  (lim inf)_(n-> oo) x_n <= (lim sup)_(n-> oo) x_n
$
#figure(image("images/limsup.png", width: 60%)) <fig-limsup>
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
*Important:* It is only a Cauchy sequence if $abs(x_n - x_m) < epsilon$ *for all* $n, m> N$. For example, the sequence $1, 1+ 1/2, 2, 2 + 1/3, 2+2/3, 3, ...$ satisfies $abs(x_n - x_(n-1)) < epsilon forall n > N$, but it is not a Cauchy sequence and is unbounded.
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
Since $epsilon$ is arbitrary, this shows that it is a Cauchy sequence. Now we must show that this implies that it converges, let $x_n$ be a Cauchy sequence. Because it is bounded, there exists a subsequence $x_n_k$ which converges to the bound $A$ as $n->oo$. Elements of this subsequence are also elements of $x_n$ and can be included in the Cauchy inequality as $n->oo$:
$
  abs(x_n  - x_n_k) < epsilon\
  abs(x_n_k - A) < epsilon\
  abs(x_n - A) <= abs(x_n - x_n_k) + abs(x_n_k - A) < 2epsilon\
$
Therefore the entire sequence converges to $A qed$

/ Definition - Divergence: We say that a sequence $x_n$ diverges to $oo$ $(-oo)$ if:
$
  forall M in RR | M > (<) 0, exists N in NN | forall n > N, x_n > (<) M\
  lim_(n-> oo) x_n = oo (-oo)
$
The limits $oo$ and $-oo$ are called *improper*.
- An unbounded sequence doesn't necessarily diverge to $oo$, for example $(-1)^n n$ oscillates.
#list.item[
  An unbounded sequence always has a subsequence which diverges to $oo$ or $-oo$.\
  Proof:\
  The definition of an unbounded sequence is very similar to that of divergence to $oo$ or $-oo$:
  $
    forall M in RR | M >= 0,exists k in NN | abs(x_k) >= M\
    x_k > M or x_k < -M
  $
  We now need to show that there are infinitely many such elements with index greater than $k$. Assume by contradiction that $exists.not i >k | x_i > M or x_k < -M$. This violates the criteria for an unbounded sequence, as it implies there are finitely ($NN$ is not dense) many elements $x_k > M$ but this is required for *infinitely* many $M > 0$.\
  This contradicts the assumption and shows: $
  forall M in RR | M > (<) 0, exists N in NN | forall n > N, x_n_k > (<) M qed
$]
- The superior / inferior limits of an unbounded sequence are the improper limits $oo$ or $-oo$ depending on if it has an upper or lower bound.

/ Definition - Complex Sequences: We can study the limits of the real and imaginary parts of a complex number individually. A sequence $z_n$ converges to $A + B i$ if $"Re"(z_n) -> A, "Im"(z_n) -> B$. Since complex numbers are not ordered, we check divergence using the absolute function $abs(z_n) -> oo$.

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

/ Theorem - Cauchy-Schwarz Inequality: $forall z= x_1 + y_1 i, w = x_2 + y_2 i in CC$:
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
TODO: Rewrite as dot product of n-dimensional space, derive triangle inequality from it. The complex only description does not do it justice! Maybe better suited in my linear algebra notes...

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
/ Definition - Function: A function $f: X -> Y$ is a mapping from a domain $X$ (not just the natural numbers like sequences) to range / codomain $Y$. For now we only discuss single-valued *real* functions: $X, Y subset.eq RR$. It *may* have the following properties:
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

/ Definition - Ring of Functions: For a domain $X$, we can define a *commutative* ring (not a field, there is no inverse element for multiplication) on the set of real valued functions $cal(F)(X) := {f | f: X -> RR}$ with the following operations:
$
  f_1, f_2 in cal(F)(X)\
  (f_1 + f_2)(x) := f_1(x) + f_2(x)\
  (f_1 dot f_2)(x) := f_1(x) dot f_2(x)\
  alpha in RR, (alpha dot f_1)(x) := alpha dot f_1(x)\
$
The constant function is defined as $forall x in X, f(x) = a$.
- Neutral elements - Addition: $f(x) = 0$, Multiplication: $f(x) = 1$
An order relation $<=$ is defined:
$
  f_1 <= f_2 <=> forall x in X, f_1(x) <= f_2(x)
$

/ Definition - Bounded Functions: As with many function definitions, they are very similar to the definitions for sequences. A function $f: X -> Y$ is bounded if:
$
  exists M in RR | M > 0, forall x in X, abs(f(x)) < M
$
This can be separated into "bounded from above" $f(x) < M$ and below $f(x) < -M$

/ Definition - Monotone Functions: A function $f: X -> Y$ is called (strictly) monotonically increasing / decreasing if $forall m, n in X$:
$
  m > n => f(m) >= (>) f(n)\
  m > n => f(m) <= (<) f(n)
$
- The rounding function $floor(x)$ is monotonically increasing but not strictly
- A function is constant $<=>$ A function is both monotonically increasing and decreasing. Proof: Trichotomy
- A *strictly* monotone function is always injective. Proof:\ Assume by contradiction that it is not injective. $exists x_1 != x_2 | f(x_1) = f(x_2)$. However, since $x_1 != x_2$, they must be either $>$ or $<$ each other and therefore $f(x_1) != f(x_2)$ (monotone) which proves that they are injective by contradiction $qed$

/ Definition - $epsilon delta$ Continuity: Intuitively, a function is continuous over an interval if we can draw it without lifting the pencil. A function is continuous at a point $x_0 in X$ if:
$
  forall epsilon > 0 exists delta > 0 | forall x in X, abs(x - x_0) < delta => abs(f(x) - f(x_0)) < epsilon
$
It is continuous over a set $X$ if it is continuous $forall x_0 in X$, the definition can be amended to $forall x_1, x_2 in X, exists delta | abs(x_1 - x_2) < delta => abs(f(x_1) - f(x_2)) < epsilon$ (a different $delta$ may be chosen for each pair of points). If there is a jump in the function at the point $x$, then there exists a small enough $epsilon$, so that no matter how close $x$ is to $x_0$, the max error $epsilon$ will never be satisfied.
- The *Dirichlet Function* based on the characteristic function is non-continuous at every point: $
  1_QQ: RR -> {1, 0}\
  1_QQ := chi_QQ
$ This is because there are irrational, real numbers around every rational number so for $0< epsilon <1 exists.not delta$ such that points next to each other have an output $< epsilon$. This also demonstrates why the $forall x in X$ is necessary, otherwise one could simply pick two rational numbers within the $delta$ interval (it is a dense set).
- Constant functions are continuous. Proof:\ $forall x, x_0 in X, f(x) - f(x_0) = 0 < epsilon$ therefore there always exists such a $delta qed$
- The function $f(x) = x$ is continuous. Proof:\ We need to find a $delta$ such that $forall x_1, x_2 in X, abs(x_1 - x_2) < delta => abs(f(x_1) - f(x_2)) < epsilon$.\ Because $abs(f(x_1) - f(x_2)) = abs(x_1 - x_2)$ and $delta, epsilon > 0$, $delta$ can always be chosen such that the second inequality also holds true $forall epsilon > 0 qed$
- The absolute function $f(x) = abs(x)$ is continuous. Proof:\ Inverse triangle inequality: $abs(f(x_1) - f(x_2)) = abs(abs(x_1) - abs(x_2)) <= abs(x_1 - x_2) < delta = epsilon qed$
- $x^2$ is continuous TODO

/ Lemma - Operations on Continuous Functions: Let $f_1, f_2: D -> RR$ be continuous functions at a point $x_0 in D$. The following functions are also continuous at $x_0$:
+ $(f_1 + f_2)(x)$ - Proof:\ We are given: $
  forall epsilon > 0 forall x in X\
exists delta_1 > 0 | abs(x - x_0) < delta_1 => abs(f_1(x) - f_1(x_0)) < epsilon\
exists delta_2 > 0 | abs(x - x_0) < delta_2 => abs(f_2(x) - f_2(x_0)) < epsilon
$ Setting $delta = min{delta_1, delta_2}$: $
  exists delta > 0 | abs(x - x_0) < delta => 0 <= abs(f_1(x) - f_1(x_0)) < epsilon and 0 <= abs(f_2(x) - f_2(x_0)) < epsilon\
abs(f_1(x) - f_1(x_0))  +  abs(f_2(x) - f_2(x_0)) < 2 epsilon
$ Since functions form a ring, we want to show $exists delta | abs(x-x_0) < delta => abs(f_1(x) + f_2(x) - f_1(x_0) + f_2(x_0))$. Applying the triangle inequality gives: $
  abs(f_1(x) + f_2(x) + (- (f_1(x_0) + f_2(x_0)))) <= abs(f_1(x) - f_1(x_0)) + abs(f_2(x) - f_2(x_0)) < 2 epsilon
$ Therefore $(f_1 + f_2)(x)$ is also continuous at $x_0 qed$
+ $(f_1 dot f_2)(x)$ - Proof:\ Following the previous definitions, we wish to show that $exists delta | abs(x - x_0) < delta => abs(f_1(x) dot f_2(x) - f_1(x_0) dot f_2(x_0)) < epsilon$, which we can achieve as follows: $
abs(f_2(x))abs(f_1(x) - f_1(x_0)) < abs(f_2(x))epsilon\
abs(f_1(x_0))abs(f_2(x) - f_2(x_0)) < abs(f_1(x_0))epsilon\
abs(f_2(x)f_1(x) - f_2(x)f_1(x_0)) + abs(f_1(x_0)f_2(x) - f_1(x_0) f_2(x_0)) < epsilon (abs(f_1(x)) + abs(f_2(x)))\
abs(f_1(x) dot f_2(x) - f_1(x_0) dot f_2(x_0))< epsilon (abs(f_1(x)) + abs(f_2(x)))
$ Since $epsilon > 0$ is arbitrary, this proves the continuity of the product of continuous functions $qed$
+ $forall alpha in RR, (alpha dot f_2)(x)$ - The proof follows from setting $f_1(x)$ in the previous Lemma to the constant function $f_1(x) = alpha$, which has been shown to be continuous.
This can be extended to continuity over a common subset if they are both continuous over that set.

/ Corollary - Polynomials are continuous: All polynomials can be constructed from a linear combination of $f(x) = x$, its powers and constant functions $f(x) = a$, which were both shown to be continuous $in RR$. Hence polynomials are also continuous for all points in $RR$.

/ Definition - Composition of Functions: Functions can be passed as arguments into one another:
$
  f: X -> Y, g: Y -> Z\
  g compose f: X -> Z\
  g compose f := g(f(x))
$
- Composition of functions is associative and brackets are irrelevant

/ Theorem - Composition of Continuous Functions: Let $f: X -> Y$ which is continuous at $x_0$ and $g: Y -> Z$ continuous at $f(x_0)$ such that $X, Y, Z subset.eq RR$. $g compose f$ is also continuous at $x_0$.\
Proof:\
The following properties apply $forall epsilon > 0$:
$
  exists delta_1 | forall x in X, abs(x - x_0) < delta_1 => abs(f(x) - f(x_0)) < epsilon\
  exists delta_2 | forall f(x) in Y, abs(f(x) - f(x_0))< delta_2 => abs(g(f(x)) - g(f(x_0))) < epsilon\
$
To show continuity of $g compose f$ at $x_0$, I will show $exists delta | forall x in X, abs(x - x_0) < delta => abs(g(f(x)) - g(f(x_0))) < epsilon$. By choosing $delta = min(delta_1, delta_2)$ , this is clearly the case as:
$
  abs(x - x_0)< delta => abs(f(x) - f(x_0)) < epsilon =>abs(g(f(x)) - g(f(x_0)))
$
The surjectivity of $f(x)$ does not matter, as the final inequality only applies if the intermediate $abs(f(x) - f(x_0)) < epsilon$ is true $qed$\
As usual, this extends to the entire domain if both $f$ and $g$ are continuous functions.

/ Theorem - Sequential Continuity: This is an alternative characterization of a continuous function. The function $f: X-> RR$ is continuous at $x_0 in X <=>$ For every sequence $x_n subset.neq X$ converging to $x_0$ (there always exists at least 1, for example $x_n = x_0$), the sequence $f(x_n)$ converges to $f(x_0)$.\
Proof:\
The following holds true for all sequences converging to $x_0$:
$
  forall delta > 0 exists N_1 | forall n > N_1, abs(x_n - x_0) < delta\
$
If the sequence $f(x_n)$ converges to $f(x_0)$:
$
  forall epsilon > 0 exists N_2 | forall n > N_2, abs(f(x_n) - f(x_0)) < epsilon\
$
Choosing $N = max{N_1, N_2}$ both conditions hold true:
$
  forall epsilon > 0 exists N | forall n > N, abs(x_n - x_0) < delta and abs(f(x_n) - f(x_0)) < epsilon\
$
TODO: Somehow this is equivalent to saying $forall x in X$:
$
  forall epsilon > 0 exists delta | forall x in X abs(x - x_0) < delta => abs(f(x) - f(x_0)) < epsilon qed
$

/ Theorem - Intermediate Value Theorem (Zwischenwertsatz): Let $f: [a, b] -> RR$ be a continuous function such that $a <= b$. $forall c in [f(a), f(b)] exists x in [a, b] | f(x) = c$. In simpler words, a continuous function $f$ takes on every value between $[f(a), f(b)]$ at least once - it is *surjective* over $[f(a), f(b)]$. This is useful to show surjectivity or to prove that an injective, continuous function is *strictly monotone* over an interval (assume it is not and choose a point that violates the monotonicity, there exists two points on either side with the same output due to this theorem).\
Proof:\
Let $c$ be any value who want to show is in the domain of the continuous function $f: [a, b] -> X$ such that $f(a) < c < f(b)$ (one can prove for $f(b) < f(a)$ similarly by working with the set $U= {x in [a, b] | c < f(x)}$).\
Consider the set $L = {x in [a, b] | f(x) < c}$. The set is not-empty ($a in L$) and is bounded, therefore it has a supremum $s$. We will now show that $s!=a and s!=b$.\
Due to the continuity of $f$ at $a$, we can keep $f(x)$ any $epsilon > 0$ away (at most) from $f(a)$ such that $abs(x - a) < delta$. Choose $epsilon < c - f(a)$ (to pull the values away from $a$ towards whichever value outputs $c$).\
The $x$'s which satisfy this $epsilon$ must be in $L$ ($forall x in [a, b] and f(x) - f(a) < epsilon = c-f(a)=> f(x) < c$) but not equal to $a$ (because $epsilon !=0$), therefore $L$ contains at least one element greater than $a =>$ the supremum $s > a$. The same can be argued about the continuity at $b$, any elements close to $b$ are greater than $c$ (due to $c < f(b)$) $=>$ not in $L$, therefore the supremum $s < b$.\
We now know that $s in (a, b)$ and want to show $f(s) = c$. Since $f$ is continuous over $[a, b]$, it is also continuous at $s$:
$
  forall epsilon > 0 exists delta > 0| forall x in [a, b], abs(x - s) < delta => abs(f(x) - f(s)) < epsilon
$
Considering $delta$ for any $epsilon$, there must exist some $x_0 |-epsilon + f(s) < f(x_0) < epsilon + f(s)$ which is in the interval $x_0 in (s- delta, s]$ (because $s$ is the supremum). Since $f(x_0) < c$, this leads to:
$
  -epsilon + f(s) < c\
  f(s) < c + epsilon
$
Furthermore, there exists an $x_1 in [s, s + delta) | f(x_1) >= c$ (otherwise it would've been in $L$), and due to the continuity of $f$ at $s$:
$
  - epsilon + f(s) < f(x_1) < epsilon + f(s)\
  c < epsilon + f(s)\
  -epsilon + c < f(s)\
  -epsilon + c < f(s) < c + epsilon
$
Choosing $epsilon -> 0$, it is clear that $f(s) = c$ whilst $s in [a, b] qed$\
Summary:
- Define set $L = {x in [a, b] | f(x) < c}$
- Show that its supremum $s in (a, b)$ due to continuity at both of those points
- Exploit the continuity at $s$ along with points $x_0 in (s - delta, s], in L =>f(x_0) < c$ and $x_1 in [s, s + delta), in.not L => f(x_1) >= c$ to show that $f(s) = c$ as $epsilon -> 0$ for any $c in (f(a), f(b))$

/ Definition - Inverse Function: Any *bijective* function $f: X -> Y$ has a corresponding inverse $f^(-1): Y -> X$ (not to be confused with the preimage, which is defined for all functions but doesn't take account of every element in $Y$, not surjective) defined such that:
$
  f^(-1) compose f = f compose f^(-1)= id\
$

/ Theorem - Inverse Function Theorem: A function that is strictly monotone and continuous (for example $a^x$) over an interval $I subset.eq RR$ is bijective and has an inverse function, which is also strictly monotone and continuous.\
Proof:\
Let $J = f(I)$ and consider the strictly monotone, continuous function $f: I -> J$. It is surjective by definition and injective due to its strict monotonicity, therefore the inverse $f^(-1): J -> I$ exists, which is also strictly monotone:
$
  forall x_1, x_2 in X\
  x_1< x_2 <=> f(x_1) < (>) f(x_2) <=> f^(-1)(f(x_1)) < f^(-1)(f(x_2))
$
The continuity of the inverse can be shown using the sequential continuity criteria but is rather complicated.

/ Definition - n'th Root Function: This is defined as the inverse of $x^n: [0, oo) -> [0, oo)$ and can be written as either $root(n, x)$ or $x^(1/n)$.

/ Theorem - Compact Domain, Bounded Function: Let $f: [a, b] -> RR$ be a *continuous* function with a compact (closed and bounded) domain, its range (and by convention $f$ itself) is therefore also bounded.\
Proof:\
Assume by contradiction that $f$ is not bounded, ie. $forall N in RR | N > 0, exists x in [a, b] | abs(f(x)) > N$. Because the domain is compact, there exists a convergent subsequence $x_n$ with a limit $lim_(n->oo) x_n in [a, b]$, such that due to the composition of functions $abs(f(x_n)) -> abs(f(lim_(n->oo) x_n))$. TODO: I did not understand the last contradiction step Theorem 3.39 Figalli
- The domain must be compact, not just bounded. For example, the domain of the function $tan: (-pi/2, pi/2) -> RR$ is bounded but not closed, therefore the function is unbounded.

/ Definition - Extrema: The maximum (minimum) of $f: X -> RR$ is defined as the value $f(m)$ of the point $m in X$ such that $forall x in X, f(x) <= (>=) f(m)$. Bounded functions (and therefore any continuous function with a compact domain) have both a maximum and minimum over their domain.

/ Definition - Uniform Continuity: This is a stricter definition of $epsilon delta$ continuity, where $delta$ satisfies the *the same* $epsilon$ error interval for all points:
$
  f: X -> Y\
  forall epsilon > 0 exists delta | forall x_1, x_2 in X, abs(x_1 - x_2) < delta => abs(f(x_1) - f(x_2)) < epsilon
$
- Generally, uniform means the same $epsilon$ and $delta$ applies to all points in the domain (see uniform convergence), all points are continuous / converge at the same rate.
- An example of a continuous but not uniformly continuous function is $x^2: RR -> [0, oo)$ and $e^x: RR -> (0, oo)$ - they become nearly vertical as $x$ increases, meaning that $delta -> 0$ to satisfy the entire domain, which is not allowed as $delta > 0$. Allowing a different $delta$ for each point (normal continuity) is however allowed. Non-uniform continuity can be proved by choosing $x_2 = x_1 + delta/2$ and showing that $abs(f(x_1) - f(x_2))<epsilon$ doesn't hold true $forall x_1 in X$, a proof by contradiction.
- A continuous function on a *compact* domain is *uniformly* continuous. Intuition: It is bounded and has a maximum and minimum, therefore we can choose a $delta > 0$ which satisfies the epsilon interval for all points.

/ Definition - Bernoulli's Inequality: This states that:
$
  forall a in RR | a >= -1, n in NN | n >= 1\
  (1+a)^n>=1 + n a
$
Proof by induction:\
For $n=1, 1+a >= 1 + a$ holds true. Assume it is true for $n=k$, $n=k+1$ amounts to:
$
  (1+a)^k >= 1 + k a\
  a >= -1 => (1 + a) >= 0\
  therefore (1+a)^(k+1) = (1+a)^k dot (1+a) >= (1+ k a) dot (1 + a)\
  (1+a)^(k+1) >= 1 + a + k a + k a^2 = 1+ a(1 + k) + k a^2\
  k a^2 >= 0, therefore 1+ a(1 + k) + k a^2 >= 1 + a(1+k)\
  therefore (1+a)^(k+1) >= 1 + a (1+k)
$
Therefore it holds true for all $n in NN qed$.

/ Definition - Euler's Number as a Limit: This converging sequence was discovered by Bernoulli whilst calculating the effect of frequency of payments on compound interest:
$
  x in RR\
  e^x = exp(x) := lim_(n -> oo) (1+x / n)^n
$
It converges to a positive, real number. Proof:\
First we show that it is monotonically increasing. Let $n_0 >= 1, n_0 > -x$:
$
  forall n >= n_0, x / ((n+1)(n+x)) <= (x+n) / ((n+1)(n+x)) = 1 / (n+1) <1\
  n+x > 0\
  therefore x / ((n+1)(n+x)) <=1\
  therefore -x / ((n+1)(n+x))>=-1
$
We now want to show that $x_(n+1)/x_n >= 1$:
$
  (1+x / (n+1))^(n+1) / (1+x / n)^n = (1+x / n) ((1+x / (n+1)) / (1+x / n))^(n+1)= (n + x) / n (
    1-x / ((n+1)(x+n))
  )^(n+1)
$
Applying Bernoulli's inequality to the second term with $a= -x / ((n+1)(n+x))$ and $n=n+1$:
$
  (n + x) / n (1-x / ((n+1)(x+n)))^(n+1) >= (n+x) / n (1 + (-x(n+1)) / ((n+1)(n+x))) = (n+x) / n (1 + -x / (n+x))\
  = (n+x) / n (n / (n+x)) = 1\
  therefore x_(n+1) / x_n >=1 forall n >= n_0 >=1
$
Showing that the $(1+x/n)^n$ is monotonically increasing. It remains to show that it is bounded, consider the case of $x <= 0$:
$
  forall n in NN, 1+x / n <=1
$
Showing that $1$ is the upper bound. Now we consider the case $x>0$:
$
  ((1+x / n)(1-x / n))^n = (1 - x^2 / n^2)^n <= 1\
  therefore (1+x / n)^n<= 1 / (1-x / n)^n
$
$(1-x / n)^n$ was shown to have upper bound $1$ in the case $x<=0$, therefore the sequence is also bounded for $x>0$. Since it is monotonically increasing and bounded, it converges in all cases $qed$

/ Definition - Properties of $e^x$: The exponential function $exp: RR -> RR_(>0)$ exhibits many useful and interesting properties:
- $forall x > - n, exp(x) >= (1+x/n)^n$ since it is defined as the limit of a monotonically increasing sequence
- $forall x in RR, exp(x) >= 1+x$ this is a consequence of the aforementioned Lemma
Since it is defined as the limit of a sequence, we must show that the usual exponential rules also apply before we can treat it as such:
- $exp(-x) = exp(x)^(-1)$ Proof:\ Lemma: Multiplying converging sequences\ $
exp(x) exp(-x) = lim_(n->oo) (1-x^2/n^2)^n
$ Eventually $n> abs(x)$, therefore $-x^2 / n^2 >= -1$ and we can apply Bernoulli's inequality: $
exp(x) exp(-x) >= 1 + -x^2 / n^2 n = 1 -x^2/n
$ We have shown that $lim_(n->oo) (1-x^2/n^2)^n$ has upper bound 1, therefore: $
 1 -x^2/n <= exp(x) exp(-x) <= 1
$ $lim_(n->oo) 1 -x^2/n = 1$ thus $forall x in RR, exp(x)exp(-x) = 1 = exp(x) / exp(x) qed$
- $exp(x + y) = exp(x) exp(y)$ Proof:\ I aim to show that $(exp(x) exp(y)) /exp(x+y)= 1$ $
exp(x) exp(y) = lim_(n->oo)[(1+x/n)^n (1+y/n)^n = (1 + (x + y)/n + (x y)/n^2)^n]\
(exp(x) exp(y)) /exp(x+y)= (1 + (x + y)/n + (x y)/n^2)^n / (1+(x+y)/n)^n = (1 + ((x y))/(n^2(1+(x+y)/n)))^n
$ As $n-> oo$: $
 (1+ (x y) / (2 n^2))^n < (1 + ((x y))/(n^2(1+(x+y)/n)))^n < (1+ (2 x y) / n^2)^n\
lim_(n->oo)(1+ (x y) / (2 n^2))^n =  lim_(n->oo)(1+ (2 x y) / n^2)^n = 1
$ Due to the squeeze theorem, $(exp(x) exp(y)) /exp(x+y)$ also converges to 1, proving that multiplication behaves the same as exponentials $qed$
- It is continuous - This proof requires several lemmas / tricks, dig deeper if part of Kobel-Keller's course.
- It is strictly monotone increasing. Proof:\ Consider $x_1, x_2 in RR | x_1 < x_2 => x_2 - x_1 > 0$, we want to show that $exp(x_1) < exp(x_2)$. Applying the Lemma $exp(x) >= 1+x$: $
exp(x_2 - x_1) >= 1+x_2 - x_1 > 1\
exp(x_1)exp(x_2 - x_1) > 1 exp(x_1)\
exp(x_2) > exp(x_1) qed
$
- It is bijective. Proof:\ It is strictly monotonically increasing and thus injective.\ Choosing $x_1, x_2 in RR$ such that $exp(x_1) < exp(x_2)$, there always exists some $x_m in RR | exp(x_m) in [exp(x_1), exp(x_2)]$ due to the intermediate value theorem, proving surjectivity over $RR_(>0) qed$
- It displays the unique property that its derivative at any point is the same. TODO prove using first principles $
(d e^x) / (d x) = lim_(h-> 0) (e^(x+h) - e^x) / h
$

/ Definition - Natural Logarithm: Due to the inverse function theorem, the inverse of $exp(x)$ exists and is also strictly monotonic and continuous, denoted as:
$
  ln(x) = exp(x)^(-1): RR_(>0) -> RR
$
The typical $log$ identities apply, by rearranging the exponential identities proven for $exp(x)$:
- $ln(1) = 0$
- $ln(x^(-1)) = - ln(x)$
- $ln(a b) = ln(a) + ln(b)$
- $forall x in RR_(>0), ln(x) <= x - 1$

/ Theorem - Logarithm Identities: Logarithms are equipped with a variety of useful identities for basic calculations as well as calculus:
- Change of basis, useful with log tables: $
b^(log_b x) = x= e^(ln x) = e^(ln(b)^(log_b x)) =  e^(ln(b)log_b(x))\
ln x =ln(b)log_b(x)\
log_b(x) = (ln x)/(ln b)
$
- $a > 0, x in RR, a^x = e^(x ln(a))$ - Useful for taking the derivative of an arbitrary exponent
- Slide rules were widely used for performing multiplication, division and many other operations before electronic calculators became widespread in the 70s. They contain pairs of scales with some logarithmic base marked, for example $ln(x)$ such that the x-values were marked at decreasing distances representing the output values. To calculate $1.2 dot 2.6$, one could align the start of the first scale at the position where $1.2$ is marked on the second, such that distance between the start of the second and $2.6$ on the first scale is equal to $ln(1.2) + ln(2.6) = ln(1.2 dot 2.6)$ (thanks to $ln(a) + ln(b) equiv ln(a b)$) which can simply be read off the marking. Division is done in a similar fashion and multiples of 10 can easily be factored out to ensure the result fits in the scale.

/ Definition - Accumulation Point: Also known as limit points, the output of a function at such points can be approximated based on its neighborhood. Consider a point $x_0 in RR$, if $forall delta > 0, X sect (x_0 - delta, x_0 + delta) != emptyset$ (there exist points immediately next to $x_0$ which are in the domain of $f: X -> RR$), such a point is called an *accumulation point* of the domain $X$ and we can define a limit.

/ Definition - Limit of a Function: This can be used to represent the value of function at a point which is not necessarily in the domain of the function, for example at a gap.\
The limit $L$ of $f$ at an *accumulation point* $x_0$ is formally defined as:
$
  lim_(x -> x_0) f(x) = L <=> forall epsilon > 0 exists delta > 0 | forall x in (
    X sect (x_0 - delta, x_0 + delta)
  ), abs(f(x) - L) < epsilon
$
This definition is very similar to continuity at the point $x_0$, with the difference that only points in the domain are checked (not necessarily $x_0$) and $L$ is what the output $f(x_0)$ would be if based on its surrounding points.
- A limit *may not always exist* (for example at a jump in the surrounding points) but if it does, it is unique.
- Endpoints are also accumulation points and the both-sided (normal) limit is defined, based only on the surrounding points from one side.
- If there exists a discontinuity in the function at $x_0$ but the surrounding points on both sides are "continuous", we can take the limit of $X \\x_0$ which is defined based on the surrounding points and the jump is ignored, this can be used to correct so-called *removable discontinuities* (discontinuities with continuous points immediately next to them) and define the *continuous extension* of $f(x)$: $
L = lim_(x->x_0\ x !=x_0) f(x)\
tilde(f)(x): X -> RR := cases(
  f(x) &"if" x!=x_0,
  L &"if" x=x_0
)
$
- Linear combinations of functions with limits at $x_0$ hold: $
lim_(x->x_0) f(x) = L_1, lim_(x->x_0) g(x) = L_2\
lim_(x->x_0) (f + g)(x) = L_1 + L_2\
lim_(x->x_0) (f dot g)(x) = L_1 dot L_2\
lim_(x->x_0) (alpha f)(x) = alpha L_1
$
- A function is continuous at $x_0 <=> lim_(x->x_0) f(x) = f(x_0)$, this is the same as the continuity definition.

/ Definition - Indeterminate Form: Although combinations of limits involving $oo$ such as $oo + oo = oo$ are allowed, certain combinations are unstable (can be thought of as race conditions) and are named *indeterminate forms*:
$
  oo -oo, 0 dot oo, 0 / 0, oo / oo, 0^0, 1^oo, oo^0
$
For example, $n^oo -> 0$ if $n-> 1$ from the left, or it may tend to $-> oo$ if $n->1$ from the right. The rate of growth of the exponent vs base also plays a role. Therefore extreme caution must be taken with such forms and there may not always be enough information to reach a conclusive answer.
- One can often simplify an expression to avoid such forms, for example by dividing polynomials in a fraction by some power of $n$ to reduce terms to $a/n^i$, which can be eliminated as they tend towards $0$ as $n->oo$. In more difficult cases, one may be able to apply l'Hôpital's Theorem or rewrite the function as a Taylor expansion.

/ Theorem - Composition of Limits: Consider a function $f: X -> Y$ such that the limit $lim_(x->x_0) f(x)$ is defined. If $f$ is composed with a *continuous* function $g: Y -> Z$, the following holds true:
$
  lim_(x-> x_0) g compose f(x) = g(lim_(x->x_0) f(x))
$
Proof: Because $g(x)$ is continuous, its limit is equal to its output throughout its domain $Y$ (Lemma), therefore when it is composed with another (potentially non-continuous) function, the output depends purely on the limit of the inner value.
- For example, we can rewrite $x^x = e^(x ln x)$, breaking it down into limits of well-understood functions.

/ Definition - Diverging Limit: The limit of a function diverges as $x->x_0$ if:
$
  lim_(x->x_0) f(x) := (-)oo <=> \
  forall M in RR | M > 0 exists delta > 0 | forall x in (X sect (x_0 - delta, x_0 + delta)), (-)M < (>)x_0
$

/ Definition - One-Sided Limit: Limits can be defined with a direction the value is approached from:
$
  (lim_(x->x_0\ x>= (<=) x_0) f(x) = L) := (forall epsilon > 0 exists delta > 0 | forall x in (
    X sect[x_0, x_0 + delta) ((x_0 - delta, x_0])
  ), abs(f(x) - L) < epsilon
$
A one-sided continuous extension can also be defined by using an open bound $(x_0, x_0 + delta)$ and is represented using notation such as $lim_(x->x_0\ x > x_0)$.
- If *both the left and right limits are defined* (not an endpoint), they must be equal for the both-sided limit to exist. For example, the positive indicator function's $chi_+$ left $lim_(x=0 \ x< 0) = 0$ and right $lim_(x=0 \ x> 0) = 1$ limits are different at the same point $x=0$, therefore the both-sided $lim_(x->0)$ is not defined. Such a point with different left / right limits is called a *jump point*.
- A function who's left / right limit is equal to $f(x_0)$ is said to be left / right continuous.

/ Definition - Limits at $oo$: It is not meaningful to consider a both-sided limit at $plus.minus oo$ therefore the one sided limit is assumed when defining limits $-> oo$ if $forall delta > 0, X sect (delta, oo) != emptyset$ ($oo$ is an accumulation point):
$
  lim_(x -> (-)oo) f(x): X->RR = L <=>\
  forall epsilon > 0 exists delta > 0 | forall x in (delta, oo) ((-oo, - delta)) sect X, abs(f(x) - L) < epsilon
$
- Instead of getting smaller as the error $epsilon$ reduces, $delta -> oo$ to bring points the considered points closer to $oo$ and vice versa for $-oo$.
- A limit $-> oo$ can be transformed into the right-sided limit $-> 0$ by inputting the reciprocal instead. For example, $lim_(x->oo) e^(-x) = 0$, we arrive at the same result through $lim_(x->0^+) e^(-(x)^(-1))$ because $lim_(x->0) 1/x = oo$. This is a useful result as many functions have known Taylor expansions at $x=0$, making them easier to calculate than $x->oo$.

/ Definition - Big-O Notation: This relates the asymptotic behavior of two functions and is useful for characterizing the computational efficiency of an algorithm by relating it to a simpler, better understood function which behaves similarly as the argument tends to specific values (usually $oo$). The function $f: X -> RR$ is said to be a *Big-O* of $g: X->RR$ at a point $x_0$ if:
$
  f(x) in O(g(x)) "as" x-> x_0 <=>\
  exists M > 0, delta > 0 | forall x in X sect (x_0 - delta, x_0 + delta) abs(f(x))<= M abs(g(x))\
$
In the case of $x_0 -> oo$:
$
  f(x) in O(g(x)) "as" x-> oo <=>\
  exists M > 0, delta > 0 | forall x in X sect (delta, oo) abs(f(x))<= M abs(g(x))\
$
This means that $f$ is bounded by some multiple of $g$ in the neighborhood of $x_0$.
- For example, $x-> 0, x^2 in O(x)$ but $x->oo, x^2 in.not O(x)$ because $x$ grows slower than $x^2$ (real gradient $M$ compared to $2 dot oo$) as $x->oo$ and therefore $x$ cannot bound $x^2$ over a neighborhood no matter how large $M$ or how small $delta$ is.
- If $f(x)$ is a sum of terms such as a polynomial, only the dominating term plays a role as $x->oo$ and constant coefficients can be ignored, for example $4x^4 + 3x^3+2x^2 + x in O(x^4)$; this can be verified by expanding $abs(f(x))$ using the triangle inequality.
- In the context of computer science, $f(x)$ is a function of steps / storage needed to execute an algorithm given an input $n$. For example the steps needed to loop over an input list with length $n$ once is $alpha n$, where $alpha$ is the number of steps per loop iteration; such an algorithm would be classified as $O(n)$ as $n->oo$ (the worst-case scenario where $alpha$ dwindles into irrelevance). An algorithm with a flatter Big-O equivalent is said to be more efficient in the long term (for example $O(log(n))$ is quicker than $O(n^2)$).

TODO: Little-O notation, appears in both scripts

/ Definition - Sequence of Functions: A set of functions over the same domain $X$ can be indexed by $NN$ as a sequence $(f_n)_(n in NN)$, the order plays a role like in any normal sequence.

/ Definition - Point-Wise Convergence: A sequence of functions is said to *converge point-wise* to a function $l: X -> RR$ if:
$
  forall x in X, lim_(n->oo) f_n(x) = l(x)
$
- The so-called point-wise limit $l: X->RR$ is unique. Proof: Simple by contradiction.
#figure(
  image("images/pointwise-convergence.png", width: 50%),
) <fig-pointwise-convergence>

/ Definition - Uniform Convergence: This is a stronger measure of convergence than point-wise, a sequence of functions $f_n$ converges uniformly to $l(x)$ if:
$
  forall epsilon > 0 exists N in NN | forall n > N forall x in X abs(f_n (x) - l(x)) < epsilon
$
This differs by applying the same error $epsilon$ for all points in the domain at a given index $N$, meaning that all points need to converge towards $l$ at the same rate.
- Uniform convergence $=>$ point-wise convergence. This is proved by acknowledging that ${n in NN | n > N} = NN sect (N, oo)$, leading to the point-wise definition.

/ Theorem - Uniform Limit Continuity: The uniform limit $l: X -> RR$ of a uniformly converging sequence of *continuous functions* is also a continuous function, this can be interpreted as yet another characterization of continuity.\
Proof:\
The functions $f_n$ are given to be continuous at all points, therefore the following holds true:
$
  forall n in NN forall x_0 in X forall epsilon > 0 exists delta > 0 | forall x in X, abs(x - x_0) < delta => abs(f_n (x) - f_n (x_0)) < epsilon
$
This also applies to functions indexed past $n > N$ for any given uniform convergence error $Epsilon$, such that $abs(f_n (x) - l(x)) < Epsilon$. Now we must show that $abs(f_n (x) - f_n (x_0)) < epsilon => abs(l(x) - l(x_0)) < epsilon$.\
Both $x$ and $x_0$ are elements of $X$, hence $abs(f_n (x_((0))) - l(x_((0)))) < Epsilon$ holds true $forall Epsilon > 0$, which we can combine using the Triangle inequality to achieve our goal:
$
  abs(l(x) - l(x_0))) <= abs(l(x) - f_n (x)) + abs(f_n (x_0) - l(x_0))+ abs(f_n (x) - f_n (x_0)) < 3Epsilon\
  => abs(l(x) - l(x_0)) < epsilon qed
$
- Unlike uniform convergence, point-wise convergence does not guarantee continuity of $l$.

/ Theorem - Bounded Uniform Limit: The uniform limit of a sequence of bounded functions is also bounded.\
Proof:\
As $epsilon->0, forall n > N forall x in X, f_n (x) approx l(x)$, therefore we can extrapolate $abs(f_n (x)) <= B$ to $abs(l(x)) <= B$, where $l$ is the uniform limit.
- This does not apply to the point-wise limit.

= Series (Reihen)
/ Definition - Convergent Series: A series $s_n: NN -> RR := sum_(k=0)^n a_k$ is a sequence of partial sums of a sequence $(a_k)_(k in NN) in RR$. It may converge to a value $A in RR$ if the following limit exists:
$
  lim_(n-> oo) s_n = sum_(k=0)^oo a_k = A <=>\
  forall epsilon > 0 exists N > 0 | forall n in NN | n > N, abs(s_n - A) < epsilon
$
Otherwise, it may diverge to $plus.minus oo$ or oscillate just like a sequence / function.
- A series converges $=>$ its *sequence of summands converges* to $0$.\ Proof:\ We are given $lim_(n->oo) s_n = A$. The current $a_n$ is given by $s_n - s_(n-1)$ which when applying the sum of limits Lemma tends to $lim_(n->oo) (s_n - s_(n-1)) =A - A =0 qed$
- A sequence converges to $0 arrow.double.not$ Its series converges.\ If we sum the elements of such a sequence until we pass $N$ so that it converges to $0$ for a given $epsilon$, we get: $
abs(a_k) + abs(a_(k-1)) + ... < n epsilon
$ However $lim_(n-> oo\ epsilon -> 0) n epsilon$ is undefined, therefore we cannot conclude that the series also converges.
- The limit of linear combinations of convergent series can be calculated from the component limits since they are valid functions upon which the limit linear combination lemmas can be applied.

/ Example - Geometric Series: This is defined as:
$
  q in RR, s_n := sum_(k=0)^n q^k
$
- Its n'th term can be calculated using the following formula (provable through induction): $
s_n = cases((1-q^(n+1))/(1-q) &"if" q!=1,n &"otherwise")
$ Such n'th term formulae are very useful as they easily reveal convergence and can be found by writing out the first few + last terms of a series, where certain patterns could be found.
- Taking the limit of its n'th term shows that it converges when $abs(q) < 1$ and the sequence of summands does indeed converge to $0$, in which case: $
lim_(n->oo) s_n = (1)/(1-q)
$

/ Example - Harmonic Series: Its name stems from the harmonics of a frequency, and it is defined as:
$
  s_n := sum_(k=1)^n 1 / k
$
- It does *not converge*, despite the summands converging to $0$. $sum 1/k^2$ on the other hand *does* converge.

I will mostly discuss various convergence criteria now.

/ Theorem - Convergence of the Tail: A series is convergent $<=>$ Its tail converges:
$
  forall N in NN\
  sum_(k=0)^oo s_n = sum_(k=0)^(N-1) s_n + sum_(k=N)^oo s_n
$
This is simply a sum of limits, whereby a finite sum is a constant hence the existence of the limit only depends on the tail converging $qed$
- Divergent tail $<=>$ divergent sequence

/ Theorem - Monotone Convergence of Series: Just like a sequence, a bounded, monotone series converges to its supremum / infimum (see monotone convergence theorem proof). Such series are monotone increasing (decreasing) if the sign of its summands is consistent and they remain positive (negative).\
- If it is not bounded but monotone, it diverges to $plus.minus oo$

/ Theorem - Majorant-Minorant Criterion: This is similar to the Sandwich Lemma for sequences. Let $A_n = sum a_k$ (minorant) and $B_n = sum b_k$ (majorant) be two series such that $forall k > N, 0 <= a_k <= b_k$ for some $N in NN$. The following implications hold:
$
  B_n "convergent" => A_n "convergent"\
  A_n "divergent to" oo => B_n "divergent to" oo
$
Proof:\
$a_n >=0$ ensures that the minorant $A_n$ is monotone increasing. Applying the Monotone Convergence theorem shows that it converges or diverges depending on if it is bounded by $sup(B_n) qed$

/ Theorem - Cauchy Condensation Test: A series $sum a_k$ who's sequence of summands is non-negative but monotonically decreasing has the following property:
$
  sum 2^k a_(2^k) "converges" <=> sum a_k "converges"
$
This may seem like a useless fact but there are in fact many series which simplify when converted into a "condensation series", for example $sum 1/k^i=> sum 2^k/(2^k)^i = sum (2^(1 - i))^k$, transforming into a geometric series which proves that the converges $forall i > 1$, a useful fact for the *Riemann Zeta function* $zeta(i) := sum_(k=1)^oo 1/k^i$.

/ Definition - Absolute Convergence: A series $sum a_k$ is absolute convergent if $sum abs(a_k)$ converges.
- Convergent monotone series (all summands either positive or negative and bounded accordingly) are absolute convergent.
- A series which converges, but does *not* absolutely converge is called *conditionally convergent*, both positive and negative summands are necessary for it to converge.

/ Theorem - Riemann's Rearrangement Theorem: This incredible result relies on the counter-intuitive fact that an infinite sum can depend on the order of summands (unlike a finite sum which is commutative) and states that the summands of any *conditionally convergent* series $s_n$ can be rearranged by a bijective mapping $phi$ (every term added once) to make it converge to any real limit:
$
  forall A in RR exists phi: NN -> NN | sum_(k=0)^oo a_phi(k) = A
$
Proof:\
We will consider the indexes of the positive and negative summands separately:
$
  P = {n in NN | a_n >= 0}, N = {n in NN | a_n < 0}
$
The following "subseries" must both diverge to ensure that the sum of their limits $lim_(n->oo) s_n = lim_(n->oo) p_n + lim_(n->oo) n_n = oo - oo < oo$ and the series converges:
$
  lim_(n->oo) p_n := sum_(k=0)^oo a_P_k = oo\
  lim_(n->oo) n_n := sum_(k=0)^oo a_N_k = -oo
$
Furthermore, they must both be divergent - if they weren't the absolute series $lim_(n->oo) abs(s_n)$ would converge which contradicts the fact that it is conditionally convergent.\
The mapping $phi$ can be recursively constructed to choose a positive / negative summand as the next index depending on if the current partial sum is smaller / larger than $A$, adding the summands with the largest absolute values first so that $a_n-> 0$ as $n-> oo$ (although a null sequence of summands doesn't imply convergence, we have already guaranteed it due to the $oo-oo< oo$ considerations) $qed$
- This might be my favorite theorem so far

/ Theorem - Alternating Criterion: Although the sequence of summands being a monotonic null-sequence doesn't guarantee convergence (see harmonic series), if a *monotonic null-sequence* $a_k$ is part of a so-called *alternating series* $sum_(k=0)^n (-1)^k a_k$ it converges and its limit can be numerically approximated (accuracy increasing with $n$) thanks to:
$
  sum_(k=0)^(2n+1) (-1)^k a_k <= sum_(k=0)^oo (-1)^k a_k <= sum_(k=0)^(2n) (-1)^k a_k
$
Where the even / odd $2n$ and $2n+1$ guarantee that the latest summand was negative / positive.\
Proof:\
We are given the following:
$
  abs(a_k) >= abs(a_(k+1))\
  lim_(k->oo) a_k = 0
$
To apply the Monotone Convergence Theorem, it remains to show that the alternating series is always bounded accordingly (its monotonicity stems from the monotonicity of the summands):
+ If $a_n$ is monotonically decreasing, its lower bound is given by (increase max index if $k=0$ is undefined): $
  sum_(k=0)^1 (-1)^k a_k <= forall n in NN sum_(k=0)^(n) (-1)^k a_k
$
+ If $a_n$ is monotonically increasing, its upper bound is given by: $
  a_k >= forall n in NN sum_(k=0)^(n) (-1)^k a_k
$
These intuitive bounds can be proved by induction for more rigor, the summands being a null-sequence is required so their polarity stays consistent. Hence such an alternating series always converges $qed$
- This proves that the harmonic alternating series $sum (-1)^k/k$ converges (the exact value is deduced from the Taylor series of $ln(1-x)$).

/ Theorem - Cauchy Criterion: This is essentially the definition of Cauchy convergence applied to series, which are indeed regular sequences, and doesn't require the limit to be postulated:
$
  forall epsilon > 0 exists N in NN | forall n>= m> N, abs(s_n - s_m) = abs(sum_(k=0)^n a_k - sum_(k=0)^m a_k)< epsilon\
  => abs(sum_(k=m+1)^n a_k)< epsilon
$

/ Theorem - Absolute Convergence Criterion: A series is absolutely convergent $=>$ the original series is convergent. This is a useful result as there are several absolute convergence criterion we will soon see.\
Proof:\
We are given that the absolute series of $sum a_k$ is a Cauchy series and aim to show:
$
  forall epsilon > 0 exists N in NN | forall n>= m> N\
  abs(sum_(k=m+1)^n abs(a_k))< epsilon => abs(sum_(k=m+1)^n a_k)< epsilon
$
Applying the Triangle Inequality $sum_(k=0)^n abs(a_k) >= abs(sum_(k=0)^n a_k)$:
$
  abs(sum_(k=m+1)^n a_k) <= abs(sum_(k=m+1)^n abs(a_k))< epsilon\
  abs(sum_(k=m+1)^n a_k) < epsilon qed
$

/ Theorem - Root Criterion: This proves convergence by showing that the absolute tail of a series is bounded by a convergent geometric series (when the $abs("base") <1$), allowing us to deduce that the original series is convergent as well (invoking several Lemmas in the process):
$
  lim_(n->oo) sup root(n, abs(a_n)) < 1 => sum_(n=0)^oo a_n "converges"\
  lim_(n->oo) sup root(n, abs(a_n)) > 1 => sum_(n=0)^oo a_n "diverges"\
  lim_(n->oo) sup root(n, abs(a_n)) = 1 "inconclusive"
$
Proof: (TODO: Compare to the proof in script)\
This is based on the tail and majorant criterion, convergence of geometric series and finally absolute convergence $=>$ convergence.\
Lemma (Majorant criterion): A monotone increasing series (and therefore monotone increasing summands) converges if a convergent series bounds it from above.\
We apply this with the geometric series as the upper bound. To generalize this criterion, we can take the absolute value of the summands (related back to the original summands later) which are always positive making the series monotone:
$
  forall k in NN, 0 <= abs(a_k) <= p^k\
  0<=root(n, abs(a_k)) <= p
$
Lemma: The geometric series $sum p^k$ converges when $abs(p) < 1$, and we are only dealing with positive summands, so $sum a_k$ converges if:
$
  root(n, abs(a_k)) <= p<1\
  root(n, abs(a_k)) <1\
$
The geometric series diverges when $p>=1$, which can bet set as the minorant of $abs(a_k)$ creating a root criteria for its divergence:
$
  0<= p^k <= abs(a_k)\
  1<= p <= root(n, abs(a_k))\
  1<=root(n, abs(a_k))\
$
Lemma: The tail of a series converges $<=>$ The series converges\
This further generalizes the criterion by only checking the steady state of the sequence of summands:
$
  lim_(n->oo) sup root(n, abs(a_n))
$
However, this lures us into an indeterminate form; if $lim_(n->oo) sup root(n, abs(a_n))=1$, we can no longer reliable say that $abs(a_n)$ has a divergent minorant $sum 1^oo$, because the base "1" is now the result of the $lim sup$ and not a constant as in the geometric series, thus it is an indeterminate form and such a result of the test is inconclusive. On the other hand, the $< (>) 1$ criterion for convergence / divergence are not indeterminate and remain valid.\
Finally, we apply the Lemma that an absolutely convergent series converges $qed$

/ Theorem - Quotient Criterion: This is yet another application of the majorant criterion with a convergent geometric series:
$
  lim_(n-> oo) abs(a_(n+1)) / abs(a_n) < 1 => sum_(n=0)^oo a_n "converges"\
  lim_(n-> oo) abs(a_(n+1)) / abs(a_n) > 1 => sum_(n=0)^oo a_n "diverges"\
  lim_(n-> oo) abs(a_(n+1)) / abs(a_n) = 1 "inconclusive"
$
Proof:\
Just like the root criterion, we prove convergence of the absolute tail of the series which extends to the regular series.\
First, we consider the case $lim_(n->oo) abs(a_(n+1)) / abs(a_n)< 1$, explicitly:
$
  exists N in NN | forall n> N abs(a_(n+1)) / abs(a_n)< 1\
$
Due to the completeness of the reals:
$
  exists p in (abs(a_(n+1)) / abs(a_n), 1)\
  abs(a_(n+1)) / abs(a_n) < p < 1\
  abs(a_(n+1)) < p abs(a_n) < 1
  p abs(a_(n+1)) < p^2 abs(a_n) < 1
$
Applying the inequality recursively (it holds true $forall n> N$), the same $p$ can be chosen (no matter how close to $1$, it will always exist):
$
  abs(a_(n+2)) < p abs(a_(n+1)) < p^2 abs(a_n)< 1\
  0<= abs(a_(n+k)) < p^k abs(a_n) < 1
$
Since $p<1$, the RHS is the summand of a convergent geometric series ($lim_(n->oo) abs(a_n)=0$ so we can safely combine these limits); applying the majorant criterion shows that $sum abs(a_n)$ and therefore $sum a_n$ also converges.\
In the case of $lim_(n->oo) abs(a_(n+1)) / abs(a_n)>1$, it is clear that $abs(a_n)$ is not a null-sequence, as each following term is $>$ the previous.\
$lim_(n->oo) abs(a_(n+1)) / abs(a_n)=1$ may be a null sequence if the limit approaches from the left, in which case we would need to check $lim_(n-> oo) inf$, however if this also yields $1$ it does not help. The limit alone is not conclusive about the convergence / divergence of the series $qed$
- Applying the root / quotient criteria is as simple as solving a regular limit.
- Recall the identity $abs(x /y) equiv abs(x)/abs(y)$, which is useful when applying this criterion.
- If $lim_(n-> oo) inf abs(a_(n+1)) / abs(a_n) >1 $ the series diverges
- If $lim_(n-> oo) sup abs(a_(n+1)) / abs(a_n) <1 $ the series converges

/ Theorem - Rearrangement of Absolutely Convergent Series: Unlike conditionally convergent series, the order of indexes has no effect on the limit of an *absolutely convergent* series $sum_(n=0)^oo a_n$:
$
  sum_(n=0)^oo a_n = sum_(n=0)^oo a_phi(n)
$
Where $phi: NN -> NN$ is a bijective mapping of indexes.\
Proof:\
The proof is based on showing that $abs(sum_(k=0)^n a_phi(k) - sum_(l=0)^oo a_l) < sum_(n=N+1)^oo abs(a_n)$ through algebraic manipulation, which is $< epsilon$ for some $N in NN$ due to the absolute convergence of the series, showing that the two series are limits of one another and they both converge.

/ Theorem - Products of Series: TODO, I don't see much use in this other than working with Taylor series, so I will leave it for later

= Differential Calculus
/ Definition - The Derivative: A function $f: X-> RR$ is *differentiable* at a point $x in X$ if the following limit called the *derivative* exists:
$
  f'(x) := lim_(h-> 0\ h!=0) (f(x+h) - f(x)) / h
$
Where $'$ denotes the derivative with respect to the only input variable; the rate of change of the output as the input increases by an infinitesimal amount. $dot(x)$ is used for derivatives with respect to $t$, time.
- $f$ is differentiable at a point $=>$ it is continuous at that point. TODO: Little o proof


Return to power series when I meet the trig functions.
