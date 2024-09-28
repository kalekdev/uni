= Netzwerke und Schaltungen 1

*Surface / Volume Integration nudge factors:*\
_Cylindrical coordinate system:_ $r$\
_Spherical coordinate system:_ $r^2sin(theta.alt)$ (where $theta.alt$ is the
angle from the z axis)

== Das Coulomb'sche Gesetz
$
  arrow(F_2) = (Q_1Q_2 arrow(e_12)) / (4pi epsilon_0 abs(arrow(r_12))^2)
$

== Das elektrostatische Feld
- Distance is from centre of point charge
- A positive test charge of 1C is used to plot electric fields - this means a
  positive charge has arrows away from it
- Unit vector is always $arrow(r)_12/abs(r)=arrow(e)_12$
- Electric field lines cannot be closed loops with a constant direction - this would lead to perpetual motion (see electric potential closed integral)

_Feld_ - die eigenschaften eines Raums, die eine Wirkung auf andere Ladungsstoffen haben\
_Homogene Feld_ - Field with the same strength and direction in all points. In reality it exists only when zooming in on a small area. Antonym: _inhomogene / ortsabhaengige Feld_.

$
  arrow(E) = arrow(F) / Q_2
$

Um die Kraft in einer gewisse Punkt im Raum zu finden, man muss die Ladung mit dem Feld an diesem Punkt multiplizieren.

Any point in a field always has a unique direction. The electric field at the equidistant point between two like charges is 0 as they cancel each other out.

_Quantitative_ - Numbers based\
_Qualitative_ - Interpretation based

A cluster of like charges behaves like a point charge with the sum of their charges on the macroscopic scale. Opposite charge clusters (ex. Dipole) lead to no field around them on a large scale.

== Das elektrostastische Potential
Electrostatic potential energy of a particle as it moves from $P_0 -> P_1$:
$
  arrow(F)=arrow(E)Q\
  W_e = -integral_(P_0)^(P_1) arrow(F) dot d arrow(s)=-Q integral_(P_0)^(P_1) arrow(E) dot d arrow(s)
$

The work done by the electric field as a positive test charge moves towards another positive is negative, as external energy is needed in order to overcome the repulsive force. The potential energy of the test charge increases due to the incoming energy, so $W_e$ is made positive.

$integral.cont$ - Closed integral, when a line begins and ends at the same point in space.

Provided the speed as the charge moves through the field tends towards 0 (to minimize the arising electromagnetic field):
$
  integral.cont_C arrow(E) dot d arrow(s) = 0
$

Electrostatic potential is the electrostatic potential energy of a particle at a point in an electric field.
$
  phi = W_e / Q
$

A reference potential (ground) must always be defined, often the Earth's surface / an infinitely far away point is taken as $phi_e=0$. In a circuit, the negative terminal is often used.

Taking $r_1$ as an infinitely far away point with potential 0, the electrostatic potential in the space surrounding a point charge $Q$ as a scalar is: #footnote[Derivation in Elektrotechnik, Albach 1.8.1]
$
  phi(P_0) = 0\
  phi(r) = - integral_(P_0)^(r) arrow(E) dot arrow(d s)
$

Electrostatic potential is positive in a positive electric field.

The change in electrostatic potential does not depend on the path taken through the field, only the start and end point.
$
  W_e = -Q integral_(P_0)^(P_1) arrow(E) dot arrow(d s) = Q[phi_e(P_1) - phi_e(P_0)]
$

_Voltage (U)_ - Difference between two potentials with the same reference potential.
$
  U_12 = phi(P_1) - phi(P_2) = integral_(P_1)^(P_2) arrow(E) dot d arrow(s)
$

== Elektrische Fluss (Flux)
TODO: Reread Anhang C to understand where the name Fluss comes from

_Elektrische Flussdichte (aka elektrische Erregung)_: How the electric field interacts with a material at a point in space. TODO: Expand after learning about permittivity.
$
  arrow(D) &= epsilon_0 arrow(E)\
  "Point charge" &= arrow(e_r)Q / (4 pi r^2)
$

_Elektrische Fluss ($Psi$)_ - Total flux density flowing through a surface. Considering a charge Q inside a sphere with radius $r$:
$
  r &= "constant"\
  Psi_D &:= integral.surf arrow(D) dot d arrow(A)\
  &"Nudge factor needed for spherical coordinate system"\
  &= integral_0^(2 pi) integral_0^pi r^2sin(theta.alt) epsilon_0 arrow(E(r, theta.alt, phi )) dot d theta.alt d phi\
  &= (epsilon_0 Q r^2) / (4pi epsilon_0 r^2) integral_0^(2 pi) integral_0^pi sin(theta.alt) arrow(e_r) dot d theta.alt d phi\
  &arrow(e_r) dot d theta.alt d phi "is 1, as they are always parallel."\
  &= (Q) / (4pi) integral_0^(2 pi) (-cos(pi)) - (-cos(0)) d phi =
  (Q) / (4pi) integral_0^(2 pi) 2 d phi\
  &= (Q) / (4pi) ((4pi) - (0)) = (4 pi Q) / (4pi) = Q
$

== Gauss'sche Gesetz
The above derived relationship is known as Gauss's law:
$
  Psi_E &:= integral.surf arrow(E) dot d arrow(A)=Q / epsilon_0\
  Psi_D &:= integral.surf arrow(D) dot d arrow(A)=Q\
$
The total electric flux density through an arbitrary closed surface (electric flux) is equal to the charge enclosed inside, regardless of the charges position / area of the surface.

This law is one of Maxwell's equations and can be used in reverse with infinitely small symmetric Gaussian surfaces to calculate the electric field around certain charge distributions, for example, the electric field at the surface of any point on a charged plane.

== Infinite Charged Plane
As derived using Gauss's law, the electric field around an infinitely large charged plane with surface charge density $sigma$ is:
$
  arrow(E) &= sigma / (2 epsilon_0)
$

This is the same regardless of distance from the plane, as when moving further away, more area contributes to the superposed field.

The direction of the field is perpendicular to the surface of the plane.

When two charged planes with equal and opposite charge densities are parallel to one another (capacitor), the field behind each one is cancelled due to their superposing opposite fields. The electric field between the two planes is twice as strong:
$
  arrow(E) &= sigma / epsilon_0
$

== Leitenden Koerper (Macroscopic Level)
The electric lines are always perpendicular to the surface of a conductor, as any tangential component of the field redistributes charges to prevent this.

The electric field inside a conductor is always 0, as the free charges repel each other and arrange themselves on the surface, of which the superposed electric fields at any point in the conductor are 0. The same applies if the conductor is brought into an external electric field.

The electrostatic potential inside a conductor is constant and equal to the surface, otherwise work would have to be done to move to the surface, which is not the case. Another way of thinking about it, is that energy was required to move a test charge into the conductor from infinitely far away.

The negative charge on the surface of a conductor arises from a *surplus of electrons*. Positive charge arises due to lack of electrons - a *surplus of holes*. Protons do not move throughout the conductor.

_Influenzierten Ladungen_ - The separation of charges influenced by an electric field.

_Faraday Cage_ - A hollow, conductive, closed volume. In an external electric field, the free charges are influenced so that the electric field inside the cage (the walls of the cage and the hollow inside it) is cancelled out. This phenomenon is very useful for electromagnetic shielding. A conductive hollow volume with gaps also reduces the inner field vastly, although it is not perfect.
