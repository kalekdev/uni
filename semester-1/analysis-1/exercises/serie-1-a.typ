= Analysis 1 - Serie 1

== 1.1.
a) $0+1=1 and 0>1$ false\
b) $0+1=1 or 0<1$ true\
c) $0+1=1 or.dot 0<1$ false\
d) $0>1 => 0+1=0$ true\
Should be $<=>$\
e) $0+1=1 => 0>1$ false\

== 1.2
a) #table(columns: 4, table.header($P$, $Q$, $not(P and Q)$, $not P or not Q$),
  [T], [T], [F], [F],
  [T], [F], [T], [T],
  [F], [T], [T], [T],
  [F], [F], [T], [T],
 )
b, d, f, h und j) Sie haben dieselbe Taffeln, deshalb sind sie logisch aequivalent.
c) #table(columns: 4, table.header($P$, $Q$, $not(P or Q)$, $not P and not Q$),
  [T], [T], [F], [F],
  [T], [F], [F], [F],
  [F], [T], [F], [F],
  [F], [F], [T], [T],
 )
e) #table(columns: 3, table.header($P$, $Q$, $not(Q) => not P$),
  [T], [T], [T],
  [T], [F], [F],
  [F], [T], [T],
  [F], [F], [T],
 )
g) Die Musterloesung ist falsch #table(columns: 3, table.header($P$, $Q$, $(P=>Q) and (Q=>P)$),
  [T], [T], [T],
  [T], [F], [F],
  [F], [T], [F],
  [F], [F], [T],
 )
#pagebreak()
i) #table(columns: 5, table.header($P$, $Q$, $R$, $P and (Q or R)$, $(P and Q) or (P and R)$),
  [T], [T], [T], [T], [T],
  [T], [T], [F], [T], [T],
  [T], [F], [T], [T], [T],
  [T], [F], [F], [F], [F],
  [F], [T], [T], [F], [F],
  [F], [T], [F], [F], [F],
  [F], [F], [T], [F], [F],
  [F], [F], [F], [F], [F],
 )
k) #table(columns: 5, table.header($P$, $Q$, $R$, $P and (Q or R)$, $(P and Q) or R$),
  [T], [T], [T], [T], [T],
  [T], [T], [F], [T], [T],
  [T], [F], [T], [T], [T],
  [T], [F], [F], [F], [F],
  [F], [T], [T], [F], [T],
  [F], [T], [F], [F], [F],
  [F], [F], [T], [F], [T],
  [F], [F], [F], [F], [F],
 )
Sie sind nicht gleich, deshalb $P and (Q or R) equiv.not (P and Q) or R$.

l) M - Menu\
A - Kaffee\
U - Kuchen\
Moegliche Interpretationen:
$
  (M and A) or U - "gleich wie entweder ... oder"\
  M and (A or U)\
$
Sie sind nicht aequivalent.

== 1.3

a) $
"Sei" n &:= 123456789\
5 dot 4^(((3n+1)^2-1)/3) &= 5 dot 4^((9n^2+6n)/3) = 5 dot 4^(3n^2+2n)\
&"Lemma: eine Ganze zahl Quadriert ist eine ganze Zahl."\
&"Lemma: 2 eine ganze zahl ist ganz."\
therefore 3n^2+2n "ist ganz"\
&"Lemma: Eine ganze Zahl hoch eine ganze Zahl ist eine ganze Zahl"\
therefore 5 dot 4^(((3dot 123456789+1)^2-1)/3) "ist ganz" qed
$

b) i) Zu beweisen $sqrt(3) < sqrt(5)$\
$
  "Nehmen wir an, dass" sqrt(3) >= sqrt(5)\
  "Lemma: Monotonie des Quadrierens"\
  therefore sqrt(5) <= sqrt(3) => 5<=3\
  "Kontraposition:" not (5<=3) => not (sqrt(5) <= sqrt(3))\
  5 > 3 => sqrt(5) < sqrt(3) qed\
  "Widerspruch:" 5 <=3 "ist falsch, therefore" not (sqrt(3)< sqrt(5)) "wurde widersprochen" qed
$

ii) $

$
