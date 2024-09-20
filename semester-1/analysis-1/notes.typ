= Analysis 1

== Logik
_Materiale Aequivalenz_ ($<=>$)\
_Logische Aequivalenz_ ($equiv$)
$A<=>B equiv (A=>B) and (B=>A)$

$A=>B$ - Wenn A, dann B\
$not B=>not A$ - Kontraposition\
$A=>B equiv not B=>not A$

Zum Beispiel:\
Es hat geregnet $=>$ die Strasse ist nas\
Kontraposition: Die Strasse ist nicht nass $=>$ Es hat nicht geregnet\
Das ist genauso war aufgrund der Physik.

Wahr: $0<0=>1+1=2$\
Falsch: $0<0<=>1+1=2$

== Proof methods

*Modus ponens* (wie man etwas in der Mathematik beweist):\
$A:=$ Es hat geregnet (Premise)\
Wenn es geregnet hat, dann ist die Strasse nass (Regel: $A=>B$)\
$B:=$ Die Strasse ist nass (Konklusion)

*Lemma* (oder Hilfssatz ) - ein Satz, der dazu dient, einen anderen Satz zu
beweisen

q.e.d. ($qed$) - end of proof

_Beweiss formalisieren_ - Express a proof formally in terms of symbols and
Limmas, can be checked by a computer.

*Kontraposition*\
TODO: Review script

*Widerspruch beweis*\
Um A zu beweisen, nehmen wir an, dass A falsch ist.\
Widerspruch finden - das beweist die Aussage A

Zum Beispiel:\
Beweis des Satzes $sqrt(2) < sqrt(3)$\
Nehmen wir an, dass $sqrt(2) >= sqrt(3)$\
Lemma: $sqrt(2)>= sqrt(3) => 2 >= 3$\
Widerspruch: $2>=3$ ist falsch, deshalb ist $sqrt(2) >= sqrt(3)$ auch falsch.\
$not(sqrt(2) >= sqrt(3)) equiv sqrt(2) < sqrt(3) space qed$

#pagebreak()

*Vollstaendige Induktion*\
$n in N_0, P(n)$ ist eine Aussage\
$P(0)$ ist wahr\
Wenn $forall k in N_0$ gilt $P(k) => P(k+1)$\
Dann ist $forall n in N_0, P(n) equiv "wahr"$\
Zum Beispiel:\
$
  "Satz:" forall n in N_0, P(n) &:= sum_(i=1)^n i = n(n+1)/2\
  P(0) = (0(1))/2               &= 0\
  "Sei" P(k)                    &= k(k+1)/2\
  P(k+1) = P(k) + k+1           &= k(k+1)/2 + k+1\
                                &= 2k^2+3k +1 = (k^2 + 3/2k + 1/2)/2\
                                &= ((k+1)(k+2))/2 = ((k+1)((k+1) +1))/2
$
Vollstaendige Induktion gibt, dass $forall n in N_0, P(n)$ wahr ist. $qed$

== Mengenlehre
