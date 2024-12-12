#heading(outlined: false)[Analysis 1]

#outline()

- _Analysis 1 ITET, F Ziltener_ - https://metaphor.ethz.ch/x/2024/hs/401-0231-10L/Ziltener_Notizen_Analysis_1_ITET_RW.pdf
- _Analysis für Informatik, M Struwe_ - https://people.math.ethz.ch/~struwe/Skripten/InfAnalysis-bbm-8-11-2010.pdf

Definitions:\
- $NN = {1, 2, ...}, NN_0 = {0, 1, 2, ...}$
- $x^0 = 1$ - to maintain consistency with $x^m / x^m = x^0 = 1$
- $0! = 1$ - $x!$ represents the number of permutations of $1, 2, ... x$. Hence there is indeed one possible permutation for nothing.
#pagebreak()


== Logik
_Aussage_ - Eine Aeusserung, die entweder wahr oder falsch ist\
_Luegner Paradox_ - Das ist keine Aussage: "Dieser Satz ist falsch"\

_Menge (Set)_ - eine ungeordnete Zusammenfassung verschiedener Objekte zu einem Ganzen\

$and$ - and\
$or$ - or\
$or.dot$ (XOR) - either ... or ...\
_Materiale Aequivalenz_ ($<=>$)\
_Logische Aequivalenz_ ($equiv$)
$A<=>B equiv (A=>B) and (B=>A)$ - Sie haben die gleichen Wahrheitstabellen

$A<=>B$ - A genau dann wenn B\
$A=>B$ - Wenn A, dann B\
$not B=>not A$ - Kontraposition\
$A=>B equiv not B=>not A$

Zum Beispiel:\
Es hat geregnet $=>$ die Strasse ist nas\
Kontraposition: Die Strasse ist nicht nass $=>$ Es hat nicht geregnet\
Das ist genauso wahr aufgrund der Physik.

Wahr: $0<0=>1+1=2$\
Falsch: $0<0<=>1+1=2$

*Distributive*:
$
  P and (Q or R) equiv (P and Q) or (P and R)\
  P or (Q and R) equiv (P or Q) and (P or R)\
$

== Proofs

_Beweis_ - eine Herleitung einer Aussage aus den Axiomen\
_Satz_ - eine Bewiesene Aussage\
_Lemma (oder Hilfssatz)_ - ein Satz, der dazu dient, einen anderen Satz zu beweisen

q.e.d. ($qed$) - end of proof

_Beweiss formalisieren_ - Express a proof formally in terms of symbols and Limmas, can be checked by a computer.\
_Divide et impera_ - divide and conquer
_Zermelo + Fraenkel Axioms_ - Foundational axioms of all proofs

=== Beweis Methode

*Modus ponens* - Wird (meistens mehrmals) verwendet, um etwas zu beweisen:\
$A:=$ Es hat geregnet (Premise)\
Wenn es geregnet hat, dann ist die Strasse nass (Regel: $A=>B$)\
$B:=$ Die Strasse ist nass (Konklusion)

*Kontraposition* - Prove the Kontraposition, which subsequently proves the original statement (they are logically equivalent)\
Beweisen, dass $sqrt(2) < sqrt(3)$:\
$
  A := sqrt(2) >= sqrt(3) equiv not sqrt(2) < sqrt(3)
$
_Monotonie des Quadrierens:_
$
  x, y >= 0\
  "Wenn" x<=y, "dann ist" x^2 <= y^2
$
$
  "Laut der Monotonie des Quadrierens," B := 2 >= 3 "ist wahr"\
  A => B equiv not B => not A equiv 2 < 3 => sqrt(2) < sqrt(3) qed
$

*Widerspruch beweis*\
Um A zu beweisen, nehmen wir an, dass A falsch ist.\
Widerspruch finden - das beweist die Aussage A

Zum Beispiel:\
Beweis des Satzes $sqrt(2) < sqrt(3)$\
Nehmen wir an, dass $sqrt(2) >= sqrt(3)$ wahr ist\
Lemma (Monotonie des Quadrierens): $sqrt(2)>= sqrt(3) => 2 >= 3$\
Widerspruch: $2>=3$ ist falsch, deshalb ist $sqrt(2) >= sqrt(3)$ auch falsch.\
$not(sqrt(2) >= sqrt(3)) equiv sqrt(2) < sqrt(3) space qed$

It is more rigorous to prove / rewrite something through Contraposition, because we start with a false statement in contradiction.

*Vollstaendige Induktion*\
$n in N_0, P(n)$ ist eine Aussage\
$P(0)$ ist wahr\
Wenn $forall k in N_0$ gilt $P(k) => P(k+1)$\
Dann ist $forall n in N_0, P(n) equiv "wahr"$\
Zum Beispiel:\
$
  "Satz:" forall n in N_0, P(n) &:= sum_(i=1)^n i = n(n+1) / 2\
  P(0) = (0(1)) / 2 &= 0\
  "Sei" P(k) &= k(k+1) / 2\
  "Zu zeigen" P(k+1) &= ((k+1)((k+1) +1)) / 2\
  P(k+1) &=P(k) + k+1 = k(k+1) / 2 + k+1\
  &= 2k^2+3k +1 = (k^2 + 3 / 2k + 1 / 2) / 2\
  &= ((k+1)(k+2)) / 2 = ((k+1)((k+1) +1)) / 2
$
Vollstaendige Induktion gibt, dass $forall n in N_0, P(n)$ wahr ist. $qed$

== Sets
An ordered collection of elements.

$emptyset$ - Leere Menge, hat keine Elemente\
${emptyset}$ hat genau ein Element

_Aussageform_ ${x | P(x)} "or" {x; P(x)}$ - die Menge aller $x$, fuer die $P(x)$ gilt\
Example:
${x | x in NN_0, x "ist gerade"}$

_Russelsche Antonomie_ - ${x | x in X, x in.not x}$ ist ein Paradox\
Loesung: Es muss immer so definiert werden ${x in X | P(x)}$, wo X eine andere Menge ist.

$A sect B - {x | x in A and x in B}$ - Intersection (Durchschnitt)\
$A union B - {x | x in A or x in B}$ - Union (Vereinigung, think Vereinigte Königreich!)\
$A without B - {x in A | x in.not B}$ - Without\
$A subset.eq B$ - Jedes Element von A liegt in B (between two sets, unlike $x in A$ which describes a single element $x$ being inside the set $A$)\
$A subset B$ - Jedes Element von A liegt in B und A enthaelt weniger Elemente als B\
$A subset.eq X, A^complement = X \\ A$, wo X die Grundmenge ist, die jeder Element die wir betrachten enthaelt.

*Distributive*:
$
  A union (B sect C) = (A union B) sect (A union C)\
  A sect (B union C) = (A sect B) union (A sect C)\
$

$(1, 2, 3)$ - _Tuple_ - Ordered set\

Kartesische Product / Potenz - $X times Y = {(x, y) | x in X, y in Y}$\
Example:
$
  X :={0, 1}, Y := {alpha, beta}\
  X times Y := {(0,alpha), (0, beta), (1, alpha), (1, beta)}\
  abs(X times Y) = abs(X) times abs(Y)
$
$RR^n$ := n-dimensionalen Koordinatenraum\
$RR^2 = X times Y$\
$RR^3 = X times Y times Z$\

*Interval Notation*
$
  [a, b] - a <= x <= b\
  (a, b) - a < x < b\
$

Open bounds cannot be the maximum / minimum of a set, as they are not contained in the set (and $0.dot(9) equiv 1$ etc.).

Let $A subset.eq RR$\
_Supremum_
$
  sup A = cases(
  "Smallest upper bound" space &"if A has an upper bound",
  oo &"if A doesn't have an upper bound",
  -oo &"if" A = emptyset
)
$
_Infimum_ - Largest lower bound\
$
  inf A = cases(
  "Largest lower bound" space &"if A has a lower bound",
  -oo &"if A doesn't have a lower bound",
  oo &"if" A = emptyset
)
$
Infinity cannot be a Supre/Infimum, becuase $oo in.not RR$

=== De Morgan's Laws
Also apply to boolean logic, where $A, B := 1, 0$
$
  (A sect B sect ...)^complement = A^complement union B^complement union ...^complement\
  (A union B union ...)^complement = A^complement sect B^complement sect ...^complement\
$

=== Characteristic / Indicator Function
The characteristic function of a set $A subset.eq RR$ is defined as:
$
  chi_A: RR -> {1, 0}\
  chi_A (x) := cases(
  1 "if" x in A,
  0 "otherwise"
)
$

== Quantoren
They cannot simply be swapped! See the largest natural number problem in script.

$exists$ - Existenzquantor - Es gibt\
$forall$ - Allquantor - Fuer alle\
$exists!$ - Es gibt genau ein element

$not (forall x in X| P(x)) = exists x in X | not P(x)$\
$not (exists x in X| P(x)) = forall x in X | not P(x)$

_Goethe Prinzip_ - When a variable is renamed correctly, a statement is still logically equivalent

== Functions
Eine Funktion ist ein Tripel $f=(X, Y, G)$, wobei $X$ und $Y$ Mengen sind und $G subset.eq X times Y$, sodass $forall x in X exists y in Y$, sodass $(x, y) in G$

_Domain_ - Set of possible inputs for a function\
_Codomain (Range)_ - Set of possible outputs of a function

Example:\
Both are Quadratic funktions but are not equal:\
$X := Y := RR, G = {(x, x^2) | x in RR^2}$\
$X := RR, Y := ]0, infinity[, G = {(x, x^2) | x in RR^2}$

$X -> X, id(x) := x$ - _Identitäts Funktion_\

=== Bild und Urbild - Muss nicht bijektiv sein\
$im(X) := f(X)$ - _Bild von f_\
$f:X -> alpha, f^(-1)(Y) := {x in X | f(x) in Y}$ - _Urbild von y unter f_

_Surjektiv_ - $forall y in Y exists x in X: f(x) = y$ - Es gibt fuer jeder Ausgang einige dazugehoerige Eingange\
_Injektiv_ - $forall x, x' in X : x != x' => f(x) != f(x')$ - Es gibt genau eine Ausgang fuer jeder Eingang in dem Definitionsbereich\
_Bijektiv_ - Es ist Surjektiv und Injektiv, weshalb es eine Inverse hat\

=== Umkehrfunktion
Sei $ f: X -> Y "eine Bijektive funktion", f^(< -1>) := Y -> X$ - _Umkehr Funktion_\
The inverse can ONLY be defined when the function is Bijektiv, unlike the Urbild. When $X = Y = RR$ it is the reflection of the original function over the line $y=x$. It is sometimes notated as $f^(-1)$ when the context is clear.

Do not forget to consider the given domain / range when considering if a function is bijektiv!

Zum Beispiel:
$
  f: RR -> RR, f(x) := x^2\
  im(f) = f(RR) = [0, oo]\
  f^(-1)([-oo, 4]) = [-2, 2]
$
The inverse can be only be defined if $f$ is Bijektiv:
$
  f: [0, oo] -> [0, oo], f(X) := x^2\
  f^(< -1>) = sqrt(X)
$

$g circle.small f := g(f(x))$ - Only possible if the $"codom"(f) = "dom"(g)$

=== Restriction
A new function can be defined with a smaller domain.
$
  f: X -> Y, A subset.eq X\
  f |_A: A -> Y
$

== Numbers and Vectors
$NN_0 := {0,1,2,...}$\
$NN := {1,2,3,...}$\
$ZZ := {..., -1, 0, 1, ...}$\
$QQ := {m / n | m in Z and n in N}$\
$NN_0 subset.eq ZZ subset.eq QQ$\

There are infinite gaps in the number line of rational numbers. These can be filled with $RR \\ QQ$ - Irrational numbers, for example $sqrt(2), pi, e$. For example: $exists.not s in QQ | s^2 = 2$.

=== Real Numbers
*Dedekind Cut*\
A Dedekind cut is a way of representing the real numbers using the rational numbers by cutting the number line into two sections around a "gap" represented by an irrational number.
Let $x subset QQ$ (x contains less elements than $QQ$), the following properties describe the cut:
$
  x in.not emptyset\
  forall r in x forall s in QQ: s > r => s in x\
  forall r in x exists s_0 in x: s_0 < r
$
This definition can of course include $QQ union (RR\\QQ)$ and therefore the entire $RR$ set.

The elementary number operations (addition, subtraction, multiplication, inequalities etc.) can be defined in terms of Dedekind cuts, precisely defining our understanding of arithmetic. $RR$ (und deshalb auch $QQ$) ist eine sogennante "total geordneter Koerper".

_Dedekind Completeness_ - Every nonempty subset of $RR$ with an upper / lower limit has a smallest / largest upper / lower limit.\
This proves that the irrational numbers are not complete: ${r in Q | r^2 < 2}$ has no smallest upper limit.

*b-adischer Bruch*\
This is the formal name of the place value system which is defined for all bases $>= 2$. The values of the digits before the radix point are $n b$, and $1/(n b)$ after the radix.

*Youngsche Ungleichung*
$
  x, y, c in RR\
  c > 0\
  2 abs(x y) <= c x^2 + y^2 / c
$

=== Cardinality (Mächtigkeit)
Two sets have the same cardinality if they have the same size and therefore a bijective mapping between them exists (see Cantor's Diagonalmethod).
$
  abs(NN_0) = abs(ZZ) = abs(QQ) eq.not abs(RR)
$

== Complex Numbers
The Real numbers contain no solution for $x^2 = -1$, which is why the imaginary number $i=sqrt(-1)$ was introduced, first considered by Cardano. They can be used to solve real world problems throughout electrical engineering, particularly for oscillations because powers of $i^n$ have a repetitive nature.

Complex addition is identical to real addition $+_(RR^2)$ between the real and imaginary parts.

Complex multiplication is defined as:
$
  dot_CC: RR^2 times RR^2 -> RR^2, vec(r, m) dot_CC vec(r', m') &:= vec(r r' - m m', r m' + r' m)\
  (r + m i)(r' + m' i) &= r r' + r m'i + m r' i + m m' i^2\
  &= r r' - m m' + (r m' + r' m)i
$

Therefore the complex body is defined as a tuple with the operations:
$
  CC := (RR^2, +_(RR^2), dot_CC)\
  i in CC, i := vec(0, 1)
$
It is not a complete body as it doesn't contain any definitions for inequalities, like $RR$.

The following injective, non surjective function maps real numbers to complex numbers:
$
  RR -> CC: x in RR, vec(x, 0) in CC
$

There exists a root for -1 in the complex body:
$
  i^2 = vec(0, 1) dot_CC vec(0, 1) = vec(-1, 0)\
  sqrt(-1) = plus.minus i
$

The complex conjugate is defined as follows:
$
  z := a + b i\
  Re(z) = a\
  Im(z) = b\
  overline(z) = a - b i\
$

The euclidian norm is defined as:
$
  abs(z) = sqrt(abs(z_1)^2 + abs(z_2)^2 + ... + abs(z_n)^2)\
$

General identities:
$
  z overline(z) = abs(z)^2\
  overline(z + z') = overline(z) + overline(z')\
  overline(z z') = overline(z) dot overline(z')
$

The function cis can be used to handle complex numbers in polar form:
$
  "cis"(theta) = cos(theta) + i sin(theta)\
  "cis"(theta)"cis"(phi) = "cis"(theta + phi)\
  "cis"(k pi / 2) = i^k forall k in ZZ\
  z = abs(z) "cis"(phi) = abs(z) e^(i phi)\
  z z' = abs(z) abs(z') "cis"(phi + phi')\
  overline(z) = abs(z)"cis"(-phi)
$

Polar form can also be written in terms of Euler's equation, which was derived from the Taylor Series' of $e^x$ and the trigonometric functions:
$
  z = abs(z) e^(i theta)\
$

De Moivre's Theorem:
$
  z^k = abs(z)^k "cis"(k phi)
$

=== k'th Roots
For a complex number $z$, the k'th roots $w$ are straightforward to determine:
$
  w^k = z\
  w_j = abs(z)^(1 / k) "cis"((phi + 2j pi) / k), j := 0, 1, ..., k-1\
$
Any of these roots to the power of k is equal to z, as well the product of all of them together. If $j >= k$ the angle completes a full circle and the same roots are found.

The roots of $z = 1$ are called roots of unity, these will be important later in Fourier transforms:
$
  w^k = 1\
  zeta_k (j) = e^((2 j pi i) / k), j := 0, 1, ..., k-1\
$

_Fundamental Theroem of Algebra_ - Every non-constant single variable polynomial contains at least 1 complex root.

== Sequences and Series
_Sequence_ - A function that maps a natural index $n in NN_0 -> CC$\
_Series_ - Sequence of partial sums of the terms in a sequence

_Taylor Series_ - A series of derivatives of a function at a point, that converges towards the value of the function at that same point, more on this later...

_Geometric Sequence_ - $n in NN_0, a_n -> z^n$ - Converges towards 0 when $z <1$

_Harmonic Sequence_ - $n in NN_0, a_n -> 1/n$ - Converges towards 0

=== Archimedes' Axiom
$
  forall x in RR exists n in NN_0, x <= n
$

=== Triangle Inequality
$
  abs(x + y) <= abs(x) + abs(y)\
  abs(x - y) >= abs(x) - abs(y)
$
Valid in all dimensions - for example in 2D, the hypotenuse always shorter than the two cathetes.

=== Bernoulli Inequality
$
  (1+a)^n >= 1+ n a
$
Important: Check which conditions apply when $a, n in$ different sets

=== Convergence
$
  "A sequence converges towards " A <=> exists A in CC forall epsilon in (
    0, oo
  ) exists n_0 in NN_0 forall n in NN_0: n >= n_0, abs(a_n - A) < epsilon\
  a_n -> A space ("converges towards A")
$
One can analyze such $epsilon delta$ criteria by considering how the condition remains true as $epsilon$ - the error rate - reduces towards 0.

We can also express this as a limit:
$
  lim_(n -> oo) a_n = A
$
Note: The index n can never actually be set as $oo$, as infinity is not a natural number.

Divergence can be proved by proving the conjugate of the definition of convergence:
$
  "A sequence diverges " <=> forall A in CC exists epsilon in (
    0, oo
  ) forall n_0 in NN_0 exists n in NN_0: n >= n_0, abs(a_n - A) > epsilon\
$

The same definitions extend to $RR^d$ by replacing $abs(a_n - A)$ as the Euclidian norm in that dimension.

Furthermore, a sequence in $RR^d$ converges towards $A$ when each of its components $a_n^i$ converge towards $A^i$.

=== Convergence Criteria
_Monotone increasing_ - $a_0 <= a_1 <= a_2 <= a_3 ...$\
_Monotonie Criteria_ - Every monotone increasing / decreasing sequence with an upper / lower limit converges at that limit (the supremum / infimum of the set of members).

If a sequence is defined as the sum, product, quotient or inequality of two convergent sequences, the resulting sequence also converges towards the sum, product, etc. of the contained limits.

=== Euler's Number
An irrational number defined as:
$
  e := lim_(n -> oo) (1+1 / n)^n
$
This converging sequence was discovered by Bernoulli whilst calculating the effect of frequency of payments on compound interest: https://en.wikipedia.org/wiki/E_(mathematical_constant)#Compound_interest

The exponential growth function $e^x$ also displays the unique property that its derivative at any point is $e^x$.

=== Extended Real Numbers
For practical reasons, we can assume the extended real numbers to be defined as:
$
  [-oo, oo] := RR union {-oo, oo}
$

A sequence diverges towards infinity when:
$
  forall C in CC exists n_0 in NN_0 forall n in NN_0 | n > n_0 => a_n > C
$

=== Limes Superior / Inferior
#grid(
  columns: (auto, auto),
  align: horizon,
  image("images/lim-inf-sup.png"),
  $
    lim sup_(n -> oo) a_n := lim_(n -> oo) sup_(i in NN_0, i >= n) a_i\
    lim inf_(n -> oo) a_n := lim_(n -> oo) inf_(i in NN_0, i >= n) a_i
  $,
)

If a sequence converges, then:
$
  lim_(n -> oo) a_n = lim sup_(n -> oo) a_n = lim inf_(n -> oo) a_n
$

=== Cauchy Sequence
Convergence can also be proved without any clue about which value $A$ the sequence converges to by the converging distance between subsequent members. If a sequence satisfies this criteria, it is known as a *Cauchy sequence*:
$
  forall epsilon in (
    0, oo
  ) exists n in NN_0 forall m, n in NN_0 | m, n >= n_0 => abs(a_m - a_n) < epsilon <=> a_n "converges"
$

=== Convergence Criteria for Series
LTD: Read https://en.wikipedia.org/wiki/Convergence_tests

The Geometric series can be written as:
$
  n in NN_0, a_n -> sum_(k=0)^n z^k = (1-z^(n+1)) / (1-z)
$
When $z<= 1$, it converges towards:
$
  a_oo = sum_(k=0)^oo z^k =lim_(n -> oo) sum_(k=0)^n z^k = 1 / (1-z)
$

Since series are essentially just a sequence of partial sums, the cauchy convergence criteria can be represented as:
$
  sup_(n>=m) abs(sum_(k=m)^n a_k) -> 0 space (m-> oo)
$

- If a series converges, then the underlying sequence must converge to 0
- On the other hand, a sequence converging to 0 does not imply that the series converges, for example the harmonic series: $sum 1/k$ continues to grow infinitely (albeit extremely slowly)

==== Quotient Criterium (aka Ratio test)
An alternative convergence criteria is:
$
  forall a_k != 0\
  "Converges:" lim_(k-> oo) sup abs(a_(k+1) / a_k)< 1\
  "Diverges:" lim_(k-> oo) inf abs(a_(k+1) / a_k)> 1
$
Intuition: Each following member of the sequence is smaller than the previous member. Polarity is accounted for, as the absolute function is applied before taking the limes superior.

If the series oscillates wildly past 1 or contains zero, these criteria cannot say anything definitively.

==== Root Criterium
$
  "Converges:" lim_(k-> oo) sup root(k, abs(a_k)) < 1\
  "Diverges:" lim_(k-> oo) sup root(k, abs(a_k)) > 1
$

== Power Series
This is the basis of the Taylor series, can express any polynomial, and takes the form:
$
  sum_(k=0)^n a_k (x -c)^k = a_0 + a_1 x + a_2 x^2 + ...
$
Where $a_k$ is a sequence containing the current coefficient. It is also possible to adjust the so called "center" of the series using $c$.

=== Radius of Convergence
_Convergence area_ - The interval of values x can take within which a power series converges - the approximated output for a given input in this area remains stable. The graph looks the same within this interval as $n$ increases and the accuracy of the series tends to infinity.

The radius of convergence $rho$ is the upper limit of the convergence area, adjusted for the center of the power series:
$
  "Converges:" abs(x - c) < rho\
  "Diverges:" abs(x - c) > rho
$
This peculiar name makes sense when considering $x in RR^2$, in which case an _open disc (circle excluding the boundary)_ models the convergence area.

=== Taylor Series
Any function $f(x)$ which is infinitely differentiable at a point $a$ can be approximated around the point $a$ as a so called Taylor series, an infinite power series:
$
  f(x) approx sum_(n=0)^oo (f^(n) (a)) / n! (x-a)^n = f(a) + (f'(a)) / 1! (x-a) + (f''(a)) / 2! (x-a)^2 + ...
$
where $f^(n) (a)$ denotes the nth derivative of the function evaluated at $a$.

Taylor series constructed around the point $a=0$ are called Maclaurin Series. The further away from the point $a$ / the less terms are included in the series, the less accurate the series becomes (play around with desmos graphs). The exact error can be calculated.

These are extremely useful to make non-linear functions approximately linear around a point (we can then enjoy linear algebra).

Furthermore they are useful in many proofs, for example Euler's $e^(i phi) = "cis"(theta)$.

Example Maclaurin Series:
- The Taylor series of any polynomial remains the same - simply a power series resulting in the same polynomial
- $
    1 / (1-z) = sum_(n =0)^oo z^n
  $
- $
    e^x = sum_(n =0)^oo x^n / n!
  $
- $
    sin(x) = sum_(n =0)^oo (-1)^n / ((2n+1)!) x^(2n+1)
  $
- $
    cos(x) =sum_(n =0)^oo (-1)^n / ((2n)!) x^(2n)
  $

==== Accuracy
The convergence radius of a Taylor series should be the entire domain of the function it's approximating in the ideal case. Polynomials (result of a power series) are always continuous, so using a Taylor series to approximate a function at a non-continuous point is not possible.

=== Riemann-Zeta Function
$
  zeta(s) = sum_(k=1)^oo 1 / k^s
$
This series converges when $s>1$. $s=1$ is the harmonic series, which does indeed diverge.

$zeta(2) = pi^2/6$ was proved by Euler, however $s>2$ has not yet been expressed precisely and is an open problem.

LTD: It is weird that this converges but the harmonic series doesn't...

=== Conditional Convergence
Finite sums are always associative and commutative. However, this is not always the case for infinite sums, for example the alternating harmonic series, which can be rearranged so it converges to half of the usual limit: https://en.wikipedia.org/wiki/Absolute_convergence

Such series are called conditionally convergent.
=== Absolute Convergence
The series of a sequence $a_k$ is said to converge absolutely if:
$
  sum_(k=1)^oo abs(a_k) "converges"
$
Thus is $a_k$ _absolutely summable_.

The bijective function $phi: NN_0 -> NN_0$ simply represents the reordering of the natural numbers.
$
  sum_(k=1)^oo a_phi(k) = sum_(k=1)^oo abs(a_k)
$
The infinite sum of an absolutely convergent series is associative and commutative. LTD: double check: Furthermore, if a series converges absolutely, it also converges normally.

=== Cauchy Product
Also known as the "Faltungs-Produkt" or convolution of two series, it is defined as:
$
  a * b: NN_0 -> CC\
  a * b(n) := sum_(k=0)^n a_k b_(n-k)
$
It converges towards the product of the limit of both series' *only* if $a$ and $b$ converge absolutely:
$
  lim_(n -> oo) a * b (n) = lim_(n-> oo) a_n dot lim_(n-> oo) b_n
$

== Function Continuity & Convergence
TODO: Is this the right order of chapters?

This concerns defining many of the intuitive ideas learnt in school using $epsilon delta$ notation. It should however be noted, that there are many ways to formally define these terms.

These definitions extend to $n$ dimensions unless stated otherwise.

=== Continuity
Intuitively, a function is continuous between an interval if we can draw it without lifting the pencil.

The function $f: X -> Y$ is continuous *at the point* $x_0$ if:
$
  forall epsilon in (0, oo) exists delta in (
    0, oo
  ) forall x in X | norm(x - x_0) < delta => norm(f(x) - f(x_0)) < epsilon
$
This is criteria is named after Karl Weierstraß.

This means that for every range error interval $epsilon$, there exists a maximum distance from $x_0$, $delta$, so that the range difference interval of every other input within this maximum "radius" satisfies the current $epsilon$ error. The closer $epsilon -> 0$, the smaller $delta$ will be to accomodate even the most "uncontinuous" point of the function.

If there is a jump in the function at the point $x_0$, then there exists a small enough $epsilon$, so that no matter how close the other points are to $x_0$, the error interval $epsilon$ will never be satisfied. The formal criteria for a function that isn't continuous at $x_0$:
$
  exists epsilon in (0, oo) forall delta in (
    0, oo
  ) exists x in X | norm(x - x_0) < delta and norm(f(x) - f(x_0)) > epsilon
$

These definitions can of course be extended to an entire range by prepending $forall x_0 in (a, b) ...$.

The *Dirichlet Function* based on the characteristic function defined earlier is non-continuous at every point:
$
  1_QQ: RR -> {1, 0}\
  1_QQ := chi_QQ
$
This is because there are irrational, real numbers around every rational number so the characteristic function jumps between 0 and 1 at an infinitely high frequency.

- Addition and multiplication ($therefore$ subtraction and division too) of functions, which are continuous at a point, guarantees continuity at that point too.
- A multivariable function is continuous at a point if every component is also continuous at that point.
- All real (including multivariable) polynomials are continuous. This is a useful fact in proofs, where arguments of nested functions are polynomials.

LTD: Investigate other continuity definitions

==== Uniform Continuity
This is a stricter extension of normal continuity, where the same $delta$ can be chosen at all points in the considered interval.

Examples of continuous but not uniformly continuous functions are $1/x$ and $e^x$.

LTD: Formulate formal definition

=== Convergence
Just like for sequences and series, we can define convergence for a function. A function $f$ converges towards $y_0$ at $x_0$ if:
$
  f: X -> Y\
  forall epsilon (0, oo) exists delta in (0, oo) forall x in X | norm(x - x_0) < delta => norm(f(x) - y_0) < epsilon
$
The only difference from the continuity definition is that $y_0$ is used instead of $f(x_0)$; *the function does not need to be defined at this point.*

Alternatively:
$
  lim_(x -> x_0) f(x) = y_0
$
This is a very useful definition, as some functions are undefined at single points, for example the derivative quotient.

- A function converges at *a point in the domain* $<=>$ The function is continuous at that point
- $1/x$ is an example of a function that doesn't converge at $x=0$

The same definition can be inverted for checking divergence of a function.

TODO: Link convergence to differentiability of a function at a point

== Topology
This is the branch of mathematics studying shapes, allowing us to make useful conconclusions about continuous sets.

=== Nested Unions and Intersections
Let $SS$ be a set of sets:
$
  union.big SS := {x | exists S in SS | x in S}\
  sect.big SS := {x | forall S in SS | x in S}\
  union.big {A, B} = A union B\
  sect.big {A, B} = A sect B\
$

Cool sets can be defined, for example an open 2D half moon:
$
  B_1^2 (0) sect ((0, oo) times RR)
$

- The union of arbitrarily many open sets is open (the outer boundaries will remain open no matter what)
- The intersection of finitely many open sets is open

=== Ball / Disk
A topological ball with radius $r$ and center $x_0$ in dimension $RR^d$ is defined as the set of points:
$
  B_r^d (x_0) = {x in RR^d | abs(x - x_0) < r} - "Open ball"\
  overline(B_r^d)(x_0) = {x in RR^d | abs(x - x_0) <= r} - "Closed ball"\
  S_r^(d-1)(x_0) = {x in RR^d | abs(x - x_0) = r} - "Sphere (boundary of ball)"
$
Where $abs(x - x_0)$ is the length of the vector from $x_0 -> x$ ie the radius.

Therefore:
$
  B_0(x_0) = emptyset\
  overline(B_0)(x_0) = {x_0}\
  B_oo^d (x_0) = overline(B_oo^d)(x_0) = RR^d\
$
Man muss immer am $B_r^d$ bleiben!

The sphere has dimensions $d-1$ because its points only form a subspace in the dimension below the ball which it is enclosing:
- $S_r^1$ - Is the line of points around a circle ie 1 dimensional
- $S_r^2$ - Every point in the surface of a 3D ball can be reached with linear combinations of two basis vectors (such that they stay within the subspace).

Mengen sind keine Türe! (Muss nicht entweder offen oder abgeschlossen sein). For example, the half open interval $[a, b)$.

=== Open Sets
The set of all points "inside" a topological set.

_Inner Point_ - A point $x in S^n$ is inner $<=> exists r in (0, oo) | B_r^n (x)subset.eq S$ - there is an open ball with a non-zero radius around $x$ such that it is entirely a subset of / equal to S.

$"Int" S := {"inner points of S"}$ - The interior of a set is the set of all inner points. $"Int" S subset S$ is always true.

_Open set_ - A set which is equal to its interior: $S = "Int" S$

Every point of an open ball is an inner point, hence making the ball "open". This can be proven with the triangle inequality.
$
  "Int" overline(B_r^d)(x_0) = B_r^d (x_0)\
  x in RR, {x} "is not open"
$

Alternatively, the interior can be defined as:
$
  "Int" S := union.big_(B_r^n (x) | B subset.eq S) B
$
This follows from the fact that the union of abitrarily many open sets remains open.

These definitions can be overwhelmingly nested, but in the end they all boil down to the set notation definitions of balls.

=== Closed Sets
A set being closed, for example $[a, b]$, can be defined formally.

Let $A subset.eq RR^n$:
$
  A "is closed" <=> (RR^n \\ A "is open")
$

For example, $[a, b] | a< b$ can instead be expressed as $(-oo, a) union (b, oo)$, which is open.

- ${x}$ is closed
- $emptyset, RR^n$ are the only subsets of $RR^n$ which are both open and closed!

Another possible definition for a closed set $S subset.eq RR^n$ can be formulated using convergence of sequences:
$
  (
    forall x in RR^n, (exists "A sequence" a_K "with only elements in S" | a_k_(k -> oo) = x) => x in S
  ) <=> S "is closed"
$
This checks for a sequence which converges to a point in S and only consists of elements of S. If there is such a possible sequence for every point in S, then S is a closed set.

I believe this definition depends on the intuition that the final point before the supremum / infimum of an open interval can truly be reached, no matter how far a sequence goes.

==== Closure
The closure of S is the smallest possible closed set which entirely includes the set $S$, this can be formed using the intersection of all possible closed balls with different radii and centers, as long as they entirely contain $S$:
$
  overline(S) := "clos"(S) := union.big_("All" overline(B)_r^n (c) | S subset.eq overline(B)) overline(B)
$
For example:
$
  S := (0, 1]\
  overline(S) = [0, 1]
$

- $S subset.eq overline(S)$ - The closure of a set contains the set itself
- A topological set can only be called "closed" if it is equal to its closure

=== Boundary $diff$
The del symbol is used in topology to represent the boundary of a set:
$
  diff S := overline(S) \\ "Int" S
$

Characterised more fundamentally:
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
  RR^n \\ diff S = "Int" S union RR^n \\ overline(S) "is open" => diff S "is closed"
$

LTD: Boundary of cusp

=== Compactness
_Bounded_ - A set which is a subset of a closed ball (other than $RR^n$)

_Compact_ - A set which is closed *and* bounded.

- A closed ball and its 1D variant, the bounded interval is by definition compact.
- $RR^n$ is not compact, because it is an infinitely large (albeit open & closed) set.

*The range of a continuous function with a compact domain is also compact.*

The maxi-, mini-, supre- and infimum of a function are defined as expected on its range.

*Every continuous function with a compact domain and therefore range possesses a maximum and minimum.*

TODO:
- Formal definition of multivariable polynomial (Ziltener 4.6)
- Lagrange Polynomial
