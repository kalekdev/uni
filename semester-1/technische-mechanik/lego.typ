= Lego Projekten

== Projekt 1 - Scherenfachwerk

=== Aufgabe 9

Ziel: Position vector (Karthesische Koordinaten) von J und K als Funktion von Zeit $t$ zu berechnen.

Definitions:
$
  arrow(A) &= vec(0, 0)\
  theta_min (alpha) &:= 29 degree\
  theta_max (beta) &:= 84 degree\
  omega_A &:= 1 degree s^(-1) = theta / t\
  theta &:= omega_A t\
  angle A B D = angle D E G = angle G H J& = angle E D H = angle H G K = theta
$
K Ortsvektor:
$
  arrow(E) &= L cos(theta) arrow(e_x) + L sin(theta) arrow(e_y)\
  arrow(G) &= arrow(E) - L cos(theta) arrow(e_x) + L sin(theta) arrow(e_y)\
  arrow(K) &= arrow(G) + L cos(theta) arrow(e_x) + L sin(theta) arrow(e_y)\
  &= L cos(theta) arrow(e_x) + 3L sin(theta) arrow(e_y)\
  &= L(cos(omega_A t) arrow(e_x) + 3sin(omega_A t) arrow(e_y))
$
J Ortsvektor:
$
  arrow(D) &= L sin(theta) arrow(e_y)\
  arrow(H) &= arrow(E) + L cos(theta) arrow(e_x) + L sin(theta) arrow(e_y)\
  arrow(J) &= arrow(H) - L cos(theta) arrow(e_x) + L sin(theta) arrow(e_y)\
  &= 3L sin(theta) arrow(e_y)\
  &= 3L sin(omega_A t) arrow(e_y)
$

TODO: How can one mathematically determine that D has no x component?

=== Aufgabe 10
$
  Delta theta &= beta - alpha = 55 degree\
  t_(alpha beta) &= Delta theta times 1\
  &= 55 s
$
