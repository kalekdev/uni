= Analysis 1

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

TODO: Distributions gesetz

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
$A subset.eq B$ - Jedes Element von A liegt in B\
$A subset B$ - Jedes Element von A liegt in B und A enthaelt weniger Elemente als B\
$A subset.eq X, A^complement = X \\ A$, wo X die Grundmenge ist, die jeder Element die wir betrachten enthaelt.

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

$X -> X, id(x) := x$ - _Identitaets Funktion_

$f^(< -1>)(y) := f^(< -1>)({y}) = {x in X | f(x)=y}$ - _Umkehr Funktion_\
The inverse is the reflection of the original function over the line $y=x$

_Surjektiv_ - Es gibt fuer jeder Ausgang einige dazugehoerige Eingang\
_Injektiv_ - Es gibt genau eine Ausgang fuer jeder Eingang in dem Definitionsbereich\
_Bijektiv_ - Es ist Surjektiv und Injektiv, weshalb es eine Inverse hat\

Do not forget to consider the given domain / range when considering if a function is bijektiv!

== Zahlen und Vektoren
$NN_0 := {0,1,2,...}$\
$NN := {1,2,3,...}$\
$ZZ := {..., -1, 0, 1, ...}$\
$QQ := {m / n | m in Z and n in N}$\
$NN_0 subset.eq ZZ subset.eq QQ$\
