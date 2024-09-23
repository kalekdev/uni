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
