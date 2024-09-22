TODO:
- Buy physical copy of Elektrotechnik - Albach

_Uebungsgruppe Polybox_: https://polybox.ethz.ch/index.php/s/TovEOAu8zo6xh0p

*Surface / Volume Integration nudge factors:*\
_Cylindrical coordinate system:_ $r$\
_Spherical coordinate system:_ $r^2sin(theta.alt)$ (where $theta.alt$ is the
angle from the z axis)

== Das Coulomb'sche Gesetz
$
  arrow(F_2) = (Q_1Q_2 arrow(e_12)) / (4pi epsilon_0 abs(arrow(r_12))^2)
$

== Das elektrostatische Feld
Zum Beispiel: Elektrische, magnetisch
- Distance is from centre of point charge
- A positive test charge of 1C is used to plot electric fields - this means a
  positive charge has arrows away from it
- Unit vector is always $arrow(r)_12/abs(r)=arrow(e)_12$

_Feld_ - die eigenschaften eines Raums, die eine Wirkung auf andere Ladungsstoffen haben\
_Homogene Feld_ - Field with the same strength and direction in all points. In reality it exists only when zooming in on a small area. Antonym: _inhomogene / ortsabhaengige Feld_.

$
  arrow(E) = arrow(F) / Q_2
$

Um die Kraft in einer gewisse Punkt im Raum zu finden, man muss die Ladung mit dem Feld an diesem Punkt multiplizieren.

Any point in a field always has a unique direction. The electric field at the point exactly between two like charges is 0 as they cancel each other out.

_Quantitative_ - Numbers based\
_Qualitative_ - Interpretation based

== Das elektrostastische Potential
$
  arrow(F)=arrow(E)Q\
  W_e = -integral_(P_0)^(P_1) arrow(F) dot d arrow(s)=-Q integral_(P_0)^(P_1) arrow(E) dot d arrow(s)
$
The work done as a positive charge moves towards another positive is negative, as external energy is needed in order to overcome the repulsive force.

$integral.cont$ - Closed integral, when a line begins and ends at the same point in space.

Provided the speed as the charge moves through the field tends towards 0 (to minimize the arising electromagnetic field):
$
  integral.cont_C arrow(E) dot d arrow(s) = 0
$

Electrostatic potential is the work needed per unit of charge to move it between two points.
$
  phi = W_e / Q
$

A reference potential (ground) must always be defined, often the Earth's surface / an infinitely far away point is taken as $phi_e=0$. In a circuit, the negative terminal is often used.

Taking $r_1$ as an infinitely far away point with potential 0, the electrostatic potential in the space surrounding a point charge $Q$ as a scalar is: #footnote[Derivation in Elektrotechnik, Albach 1.8.1]
$
  phi(r_2) = Q / (4 pi epsilon_0 r_2)
$

The change in electrostatic potential does not depend on the path taken through the field, only the start and end point.
$
  W_e = -Q integral_(P_0)^(P_1) arrow(E) dot arrow(s) = Q[phi_e(P_1) - phi_e(P_0)]
$

_Voltage (U)_ - Difference between two potentials with the same reference potential.
$
  U_12 = phi(P_1) - phi(P_2) = integral_(P_1)^(P_2) arrow(E) dot d arrow(s)
$

== Elektrische Fluss (Flux)
TODO: Reread Anhang C to understand where the name Fluss comes from

_Elektrische Flussdichte (aka elektrische Erregung)_: How the electric field interacts with a material at a point in space. TODO: Expand after learning about permittivity.
$
  arrow(D) = epsilon_0 arrow(E) = arrow(e_r)Q / (4 pi r^2)
$

_Elektrische Fluss ($Psi$)_ - Total flux density flowing through a surface. In the case of a charge inside an arbitrary closed surface, it is equal to $Q$ regardless of the charges position / size of the surface.

Electric Flux Density, considering a charge Q inside a sphere with radius $r$:
$
  r &= "constant"\
  Psi &:= integral.surf arrow(D) dot d arrow(A)\
  &"Nudge factor needed for spherical coordinate system"\
  &= integral_0^(2 pi) integral_0^pi r^2sin(theta.alt) epsilon_0 arrow(E(r, theta.alt, phi )) dot d theta.alt d phi\
  &= (epsilon_0 Q r^2) / (4pi epsilon_0 r^2) integral_0^(2 pi) integral_0^pi sin(theta.alt) arrow(e_r) dot d theta.alt d phi\
  &arrow(e_r) dot d theta.alt d phi "is 1, as they are always parallel."\
  &= (Q) / (4pi) integral_0^(2 pi) (-cos(pi)) - (-cos(0)) d phi =
  (Q) / (4pi) integral_0^(2 pi) 2 d phi\
  &= (Q) / (4pi) ((4pi) - (0)) = (4 pi Q) / (4pi) = Q
$

== Gauss'sche Gesetz
