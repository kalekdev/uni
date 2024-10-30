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

== Mengenlehre
Eine ungeordnete Zusammenfassung von Elemente.

$emptyset$ - Leere Menge, hat keine Elemente\
${emptyset}$ hat genau ein Element

_Aussageform_ ${x | P(x)} "or" {x; P(x)}$ - die Menge aller $x$, fuer die $P(x)$ gilt\
Example:
${x | x in NN_0, x "ist gerade"}$

_Russelsche Antonomie_ - ${x | x in X, x in.not x}$ ist ein Paradox\
Loesung: Es muss immer so definiert werden ${x in X | P(x)}$, wo X eine andere Menge ist.

$A sect B - {x | x in A and x in B}$ - Intersection\
$A union B - {x | x in A or x in B}$ - Union\
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
  (A sect B)^complement = A^complement union B^complement\
  (A union B)^complement = A^complement sect B^complement\
$

== Quantoren
They cannot simply be swapped! See the largest natural number problem in script.

$exists$ - Existenzquantor - Es gibt\
$forall$ - Allquantor - Fuer alle\
$exists!$ - Es gibt genau ein element

$not (forall x in X| P(x)) = exists x in X | not P(x)$\
$not (exists x in X| P(x)) = forall x in X | not P(x)$

_Goethe Prinzip_ - When a variable is renamed correctly, a statement is still logically equivalent

== Funktionen
Eine Funktion ist ein Tripel $f=(X, Y, G)$, wobei $X$ und $Y$ Mengen sind und $G subset.eq X times Y$, sodass $forall x in X exists y in Y$, sodass $(x, y) in G$

_Domain_ - Set of possible inputs for a function\
_Codomain (Range)_ - Set of possible outputs of a function

Example:\
Both are Quadratic funktions but are not equal:\
$X := Y := RR, G = {(x, x^2) | x in RR^2}$\
$X := RR, Y := ]0, infinity[, G = {(x, x^2) | x in RR^2}$

$X -> X, id(x) := x$ - _Identitaets Funktion_\

*Bild und Urbild* - Muss nicht bijektiv sein\
$im(X) := f(X)$ - _Bild von f_\
$f:X -> alpha, f^(-1)(Y) := {x in X | f(x) in Y}$ - _Urbild von y unter f_

_Surjektiv_ - $forall y in Y exists x in X: f(x) = y$ - Es gibt fuer jeder Ausgang einige dazugehoerige Eingange\
_Injektiv_ - $forall x, x' in X : x != x' => f(x) != f(x')$ - Es gibt genau eine Ausgang fuer jeder Eingang in dem Definitionsbereich\
_Bijektiv_ - Es ist Surjektiv und Injektiv, weshalb es eine Inverse hat\

*Umkehrfunktion*\
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

== Zahlen und Vektoren
$NN_0 := {0,1,2,...}$\
$NN := {1,2,3,...}$\
$ZZ := {..., -1, 0, 1, ...}$\
$QQ := {m / n | m in Z and n in N}$\
$NN_0 subset.eq ZZ subset.eq QQ$\

There are infinite gaps in the number line of rational numbers. These can be filled with $RR \\ QQ$ - Irrational numbers, for example $sqrt(2), pi, e$. For example: $exists.not s in QQ | s^2 = 2$.

=== Reelen Zahlen
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
  lim_(n -> oo) a_n = lim sup_(n -> oo) a_n = lim inf(n -> oo) a_n
$

=== Cauchy Sequence
Convergence can also be proved without any clue about which value $A$ the sequence converges to by the converging distance between subsequent members. If a sequence satisfies this criteria, it is known as a Cauchy sequence:
$
  forall epsilon in (
    0, oo
  ) exists n in NN_0 forall m, n in NN_0 | m, n >= n_0 => abs(a_m - a_n) < epsilon <=> a_n "converges"
$

=== Convergence Criteria for Series
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

==== Quotient Criterium
An alternative convergence criteria is:
$
  forall a_k != 0\
  "Converges:" lim_(k-> oo) sup abs(a_(k+1) / a_k)< 1\
  "Diverges:" lim_(k-> oo) inf abs(a_(k+1) / a_k)> 1
$
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
_Convergence area_ - The set of values x can take with which the series converges.

The radius of convergence $rho$ is the upper limit of the convergence area, adjusted for the center of the series:
$
  "Converges:" abs(x - c) < rho\
  "Diverges:" abs(x - c) > rho
$
This peculiar name makes sense when considering $x in RR^2$, in which case an _open disc (circle excluding the edge)_ models the convergence area.

=== Taylor Series
Any function $f(x)$ which is infinitely differentiable at a point $a$ can be approximated around the point $a$ as a so called Taylor series, an infinite power series:
$
  f(x) approx sum_(n=0)^oo (f^(n) (a)) / n! (x-a)^n = f(a) + (f'(a)) / 1! (x-a) + (f''(a)) / 2! (x-a)^2 + ...
$
where $f^(n) (a)$ denotes the nth derivative of the function evaluated at $a$. Taylor series constructed around the point $a=0$ are called Maclaurin Series.

This is extremely useful to make non-linear functions approximately linear around a point - especially in computing.

Example Maclaurin Series:
- The Taylor series of any polynomial remains the same - simply a power series resulting in the same polynomial
- $1 / (1-z) = sum_(n =0)^oo z^n$
- $e^x = sum_(n =0)^oo x^n / n!$

=== Riemann-Zeta Function
$
  zeta(s) = sum_(k=1)^oo 1 / k^s
$
This series converges when $s>1$. $s=1$ is the harmonic series, which does indeed diverge.

$zeta(2) = pi^2/6$ was proved by Euler, however $s>2$ has not yet been expressed precisely and is an open problem.

=== Absolute Convergence
The series of a sequence $a_k$ is said to converge absolutely if:
$
  sum_(k=1)^oo abs(a_k) "converges"
$
Thus is $a_k$ _absolutely summable_.

== Topology
This is the branch of mathematics studying structures representing continuous sets.

=== Ball / Disk
A topological ball with radius $r$ and center $x_0$ in dimension $RR^d$ is defined as the set of points:
$
  B_r^d (x_0) = {x in RR^d | abs(x - x_0) < r} - "Open ball"\
  overline(B_r^d)(x_0) = {x in RR^d | abs(x - x_0) <= r} - "Closed ball"\
  S_r^(d-1)(x_0) = {x in RR^d | abs(x - x_0) = r} - "Sphere (edge of ball)"
$

Therefore:
$
  B_0(x_0) = emptyset\
  overline(B_0)(x_0) = {x_0}\
  B_oo^d (x_0) = overline(B_oo^d)(x_0) = RR^d\
$
Man muss immer am $B_r^d$ bleiben!

Mengen sind keine Türe! (Muss nicht entweder offen oder abgeschlossen sein)
TODO:
== Lagrange Polynomial
== Fourier Series


