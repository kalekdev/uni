= Analysis 1

_Analysis 1 ITET, F Ziltener_ - https://metaphor.ethz.ch/x/2024/hs/401-0231-10L/Ziltener_Notizen_Analysis_1_ITET_RW.pdf
_Analysis für Informatik, M Struwe_ - https://people.math.ethz.ch/~struwe/Skripten/InfAnalysis-bbm-8-11-2010.pdf

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

== Beweis Methode

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
Loesung: Es muss immer so definiert werden ${x in X | P(x)}$, wo X eine Menge ist.

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

== De Morgan's Laws
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

== Reelen Zahlen
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

== Cardinality (Mächtigkeit)
Two sets have the same cardinality if they have the same size and therefore a bijective mapping between them exists (see Cantor's Diagonalmethod).
$
  abs(NN_0) = abs(ZZ) = abs(QQ) eq.not abs(RR)
$

== Complex Numbers
The Real numbers contain no solution for $x^2 = -1$, which is why the imaginary number $i=sqrt(-1)$ was introduced, first considered by Cardano. They can be used to solve real world problems throughout electrical engineering, particularly for oscillations because powers of $i^n$ have a repetitive nature.

TODO: Rigorous definition of the complex body (set and its operations)
$
  "cis"(theta) = cos(theta) + i sin(theta)\
  "cis"(theta)"cis"(phi) = "cis"(theta + phi)
$
