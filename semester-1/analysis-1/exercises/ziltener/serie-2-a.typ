= Analysis 1 - Serie 2

== 2.1

a) i. $X := {1, 2}$ ii. $Y := {0}$ iii. $Z := {1, 2, 3}$

b)
$
  X sect Y = {1}\
  X union Y = {0, 1, 2}\
  X \\ Y = {0}
$

c)
$
  X times Y = {("Apfel", 0), ("Apfel", 1), ("Apfel", 2), ("Haus", 0), ("Haus", 1), ("Haus", 2)}\
  Y^2 = {(0, 0), (0, 1), (0, 2), (1, 0), (1, 1), (1, 2), (2, 0), (2, 1), (2, 2)}\
$

d)
S: Shaded region under the diagonal x=y, until y becomes flat at y=1\
A: Shaded inside the unit circle, including its edge\
$A^complement$: All points outside the unit circle shaded\
B: The edge of the unit circle\
C: Everything to the right of and including the y-axis\
$A sect C$: Right half of the unit circle including the edge\
$A union C$: Entire unit circle and the right side of the y-axis

== 2.2

a) $X = {0}, X^complement = {1}$

b) Sie sind gleich

c) Everything outside of the two circles.

d)
$
  "Zu beweisen:" (A sect B)^complement &= A^complement union B^complement\
  (A sect B) &= {x in X | x in A and x in B}\
  (A sect B)^complement &= {x in X | not (x in A and x in B)}\
  &= {x in X | x in.not A or x in.not B}\
  &= A^complement union B^complement qed
$

== 2.3

a)
1. $1 equiv 1$, wahr
2. Goethe Prinzip, wahr
3. Die Irrationale Zahlen, wahr

b)
1. $forall x in {0^2, 1^2, 2^2, 3^2, ...}: x != 24$
2. $forall x in RR exists y in NN: y > x$

== 2.4

a) falsch, es gibt eine natuerliche Zahl, die gleich oder weniger die Zahl hoch 2 ist\
b) wahr, es gibt eine natuerliche Zahl, die groesser als 1 und weniger oder gleich 1 ist\
c) wahr, es gibt eine Zahl zwischen 0 und unendlich, wofuer 1/eine natuerlich Zahl groesser oder gleich die Zahl ist\
d) wahr, fuer alle natuerliche Zahlen, es gibt eine Zahl zwischen 0 und unendlich, die groesser als 1 ueber die natuerliche Zahl ist

== 2.5

a) Nicht Surjektiv, weshalb ist es keine Funktion\
b) Nicht Injektiv oder Surjektiv. Keine Funktion\
c) Nicht Surjektiv. Keine Funktion\
d) Es ist eine Funktion.

== 2.6

a)
$
  im(f) &= {y in RR | y >= 0}\
  im(g) &= RR\
  im(h) &= {y in RR | y > 0}\
$

b)
$
  f^(-1)((-1, 4)) &= (-2, 2)\
  g^(-1)([-8, -1]) &= [-2, -1]\
  h^(-1)([-1, 1]) &= [-oo, 0]\
$

== 2.7
Ich bin mir nicht sicher, wie man das zeigen soll.

== 2.8

a) $f(y) := y/2$
e) $f(y) := (y-1)/2$
f) $f(y) := ln(y)/2$

== 2.9

a)
$
  g circle.small f &= e^(x^2)\
  f circle.small g &= (e^x)^2
$

b) $g circle.small f &= e^(abs(x)) = e^sqrt(5). f circle.small g$ geht nicht, weil die Domain von f die 2 dimensionale Raum ist.

== 2.10
a)
$
  f^(-1)(B_1 union B_2) &= {x in X | f(x) in (B_1 union B_2)}\
  &= {x in X | f(x) in B_1} union {x in X | f(x) in B_2)}\
  &= f^(-1)(B_1) union f^(-1)(B_2)
$

== 2.11

1) Supremum: $1$, Infimum: $0$, Maximum: 1

2) Supremum: $1$, Infimum: $1/2$, Minimum: 2

3) Supremum: $1$, Infimum: $2/3$, Minimum: $2/3$
