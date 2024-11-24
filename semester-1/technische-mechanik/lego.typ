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

#pagebreak()
== Projekt 3 - Fachwerk

=== Aufgabe 5
Wir nutzen das Prinzip der virtuellen Leistung. Wir entfernen Stab DE, um eine virtuelle Bewegung zu erlauben und die Reaktions-Kräfte $S_(D E)$ zu rechnen:

$arrow(v_D)$ ist senkrecht zum Stab AD. $arrow(v_E)$ entspricht $arrow(v_D)$, wobei die x-Komponente entgegengesetzt ist.
$
  arrow(v_D) &= vec(cos 30, -sin 30) = vec(sqrt(3)/2, -1/2)\
  arrow(v_E) &= vec(-cos 30, -sin 30) = vec(-sqrt(3)/2, -1/2)\
$
Somit können wir die Leistung der beide Kräfte $S_(D E)$ rechnen, unter der Annahme, dass es sich vorerst um Druckkräfte handelt:
$
  cal(P)_(S_(D E)) &= vec(sqrt(3)/2, -1/2) dot vec(S_(D E), 0) + vec(-sqrt(3)/2, -1/2) dot vec(-S_(D E), 0)\
  &= sqrt(3) S_(D E)
$
Jetzt rechnen wir die Leistung der Kraft F, die an dem Punkt D greift:
$
  cal(P)_F &= arrow(v_D) dot arrow(F) = vec(sqrt(3)/2, -1/2) dot vec(0, -F)\
  &= F / 2
$
Die gesamte virtuelle Leistung muss 0 sein, um sicherzustellen, dass sich das System in einem Ruhezustand befindet:
$
  sum cal(P) &= cal(P)_F + cal(P)_(S_(D E)) = sqrt(3) S_(D E) + F / 2 = 0\
  S_(D E) &= -F / (2 sqrt(3))
$
Wir haben festgestellt, dass die Reaktionskräfte $S_(D E)$ in die entgegengesetzte Richtung wirken als angenommen. Daher sind die entsprechenden Kräfte im realen Modell Druckkräfte auf den Stab, mit der Grösse $F/(2 sqrt(3))$.
