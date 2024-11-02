#heading(outlined: false)[Netzwerke und Schaltungen 1]

#outline()

*Fundamental Laws of Electromagnetism:*\
Maxwell's Equations and the Lorentz Force law are the only fundamental laws of electromagnetism, which work for all materials and at quantum scale. Coulomb's law was discovered through experiment and can be derived from Gauss's law, and Ohm's law does not hold true for all materials.

Nonetheless they are very useful in practice and certainly worth studying.

#pagebreak()

*Surface / Volume Integration nudge factors:*\
_Cylindrical coordinate system:_ $r$\
_Spherical coordinate system:_ $r^2sin(theta.alt)$ (where $theta.alt$ is the
angle from the z axis)

== Das Coulomb'sche Gesetz
$
  arrow(F_2) = (Q_1Q_2 arrow(e_12)) / (4pi epsilon abs(arrow(r_12))^2)
$

$epsilon$ is often replaced with $epsilon_0$ as calculations are assumed to take place in a vacuum.

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

A multimeter can only measure voltage between conductors (and not with for example the air as a reference point) as it relies on a small current to make the measurement. LTD: Revisit capacitive coupling

== Elektrische Fluss (Flux)

_Electric Displacement Field (aka Flux Density)_: An imaginary field that describes the effect of a charge on space, independent of if it's through a vacuum, dielectric or conductor.
$
  arrow(D) &= epsilon arrow(E)\
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

This law is one of Maxwell's equations and can be used in reverse with infinitely small symmetric Gaussian surfaces to calculate the electric field around certain charge distributions, for example, the electric field at the surface of any point on a charged plane. #footnote([See _Electricity and Magnetism | Purcell_ for some great derivations of electric fields by various charge distributions.])

== Line Charge

The electric field at distance $r$ from a line charge with uniform charge distribution $lambda$ can be calculated using either the integral of contributions to the field by small sections of the line, or far simpler using a cylinder and Gauss's law:
$
  arrow(E(r)) = lambda / (2 pi epsilon r)
$


== Infinite Charged Plane
As derived using Gauss's law, the electric field around an infinitely large charged plane with surface charge density $sigma$ is:
$
  arrow(E) &= sigma / (2 epsilon)
$

This is the same regardless of distance from the plane, as when moving further away, more area contributes to the superposed field.

The direction of the field is perpendicular to the surface of the plane.

When two charged planes with equal and opposite charge densities are parallel to one another (capacitor), the field behind each one is cancelled due to their superposing opposite fields. The electric field between the two planes is twice as strong:
$
  arrow(E) &= sigma / epsilon
$

If they have an equal charge distribution, the electric field between plates of a capacitor is homogenous. This results in the potential difference between them:
$
  U = E d = (sigma d) / epsilon
$

If an isolated, conductive plate is brought in between them, the total distance between the plates throughout which a test charge is under the influence of an electric field decreases by the thickness of the conductive plate. This results in a lower potential difference between the plates.

== Leitenden Koerper (Macroscopic Level)
The electric lines are always perpendicular to the surface of a conductor, as any tangential component of the field redistributes charges to prevent this.

The electric field inside a conductor is always 0, as the free charges repel each other and arrange themselves on the surface, of which the superposed electric fields at any point in the conductor are 0. The same applies if the conductor is brought into an external electric field.

The electrostatic potential inside a conductor is constant and equal to the surface, otherwise work would have to be done to move to the surface, which is not the case. Another way of thinking about it, is that energy was required to move a test charge into the conductor from infinitely far away.

The negative charge on the surface of a conductor arises from a *surplus of electrons*. Positive charge arises due to lack of electrons - a *surplus of holes*. Protons do not move throughout the conductor.

_Influenzierten Ladungen_ - The separation of charges influenced by an electric field.

_Faraday Cage_ - A hollow, conductive, closed volume. In an external electric field, the free charges are influenced so that the electric field inside the cage (the walls of the cage and the hollow inside it) is cancelled out. This phenomenon is very useful for electromagnetic shielding. A conductive hollow volume with gaps also reduces the inner field vastly, although it is not perfect.

== Dielectrics

_Dielectric_ - An electric insulator that can be polarised by an electric field. Regular "insulators" tend to have a low degree of polarisation.

Although dielectrics do not contain free charges, they still experience a small degree of polarisation at the atomic level, as the cloud of electrons surrounding the nucleus is distorted in the direction of the applied electric field.

When a dielectric is placed between two plates, there is still a (macroscopic) electric field throughout the dielectric (albeit lower than through a perfect insulator, as the dipoles generate fields in the opposite direction). This results in a lower potential difference between the plates, although still higher than if it were a conductor.

== Dipoles

_Dipole_ - A phenonmenon when electric charges / magnetic poles are separated. Examples of electric dipoles are ions under the influence of an external electric field or certain molecules, such as $H_2O$ which are permanent dipoles due to their asymmetric structure.

_Electric Dipole Moment_ - for a dipole with charge $Q$ on the positive end and vector $arrow(d)$ from the main negative point to the main positive point, the electric dipole moment is:
$
  arrow(p) = Q arrow(d)
$
It can be thought of as a measure of a systems polarity.

When a material containing dipoles is in an external electric field, the dipoles align in the same direction, resulting in an overall polarization of the material (essentially a larger dipole). Temperature has a large effect on this, as the random movements of particles disrupt the perfect alignment encouraged by the electric field.

The overall polarization of a dielectric with volume $V$ is:
$
  arrow(P) = (sum_(i=1)^n arrow(p_n)) / V
$

A polarized conductor / dielectric with a net 0 charge in a non-homogeonous field, such as near a point charge will usually have a resultant force, for example a dipole near a point charge (regardless of polarity) will experience a stronger attractive force and the dipole will have a resultant force towards the point charge.

== Permittivity

_Absolute Permittivity /Dielectric Constant_ -
A measure of the electric polarizability of a material, ie. the capacity of it to oppose / how well it stores energy from an external electric field through polarisation. Higher for conductors / dielectrics than insulators.
$
  epsilon = epsilon_r epsilon_0
$

_Permittivity of free space_ - $epsilon_0 = 8.85418782 × 10^(-12)$

_Relative Permittivity_ - $epsilon_r$ (sometimes $kappa$) - The ratio of a material's permittivity $epsilon$ to the permittivitiy of free space $epsilon_0$. The permittivity of air is very close to that of a vacuum $epsilon_0$, hence its relative permittivity is nearly 1.
$
  epsilon_r = epsilon / epsilon_0
$

The higher the permittivity of a medium, the more it's electric field is reduced due to polarisation. Electric field strength is inversely linearly proportional to the permittivity, as seen in Coulomb's law (but not for all materials, for example ferroelectric crystals).

*LTD: The following thinking is not completely correct, I am still wrapping my head around what exactly the displacement field and permittivity is. Revisit later after reading Purcell*\
Taking place in a medium with permittivity $epsilon$:\
The difference in the displacement field before and after polarisation:
$
  arrow(P) &= epsilon arrow(E) - epsilon_0 arrow(E)
$

Therefore the resulting electric displacement field (field only due to charges, polarization) is equal to the permittivity of the space x (electric field after polarization + the change in electric field due to polarization):
$
  arrow(D) &= epsilon_0 arrow(E_"if it happened in vacuum") &= epsilon_0(arrow(E) + arrow(P)) = epsilon (
    arrow(E) -(epsilon arrow(E) - epsilon_0 arrow(E))
  )\
  &= epsilon(arrow(E)(1-epsilon)+epsilon_0 arrow(E))\
  &= epsilon(1-epsilon)arrow(E) + epsilon epsilon_0 arrow(E)
$
Where $E$ is the net electric field after polarisation\
*END OF IDEA*

== Dielectric Boundary Conditions
The electric field strength changes as it passes through the border of two different dielectric materials. However, it can be broken down into the normal and tangential components in order to calculate the resulting field:

As an external electric field pases through the boundary of dielectrics with absolute permittivity $epsilon_1$ and $epsilon_2$:
$
  epsilon_1 E_(n 1) = epsilon_2 E_(n 2)\
  E_(t 1) = E_(t 2)\
$
The normal component is derived using Gauss's law and an infinitely thin cylinder at the boundary. LTD: Revisit tangential proof after learning Faraday's law
https://ximera.osu.edu/electromagnetics/electromagnetics/electrostatics/digInElectricFieldBoundaryConditions

Supposing the external field enters at angle $alpha_1$ to the normal and leaves with angle $alpha_2$, the fields at the boundary can be expressed as:
$
  tan alpha_1 &= E_(t 1) / E_(n 1)\
  tan alpha_2 &= E_(t 2) / E_(n 2)\
  (tan alpha_1) / (tan alpha_2) &= (E_(t 1) / E_(n 1)) / (E_(t 2) / E_(n 2)) = E_(n 2) / E_(n 1) = epsilon_1 / epsilon_2
$

== Capacitance
Considering the equation for the potential difference between two equally and oppositely charged plates of a capacitor, each with charge $Q$ and area $A$:
$
  U &= E d = (sigma d) / epsilon = (Q d) / (epsilon A)\
  Q &= C U, "where" C = (epsilon A) / d\
  C &= Q / U
$

Q is directly proportional to U regardless of the geometry of the capacitor. The constant of propertionality C is called the capacitance of such an arrangement and has the unit *F* Farad, ie. the ability of a body to store electrical charge. Formally defined:
$
  C = (epsilon integral.surf_A arrow(E) dot d arrow(A)) / (integral_S arrow(E) dot d arrow(s))
$
LTD: Compute capacitance of arbitrary systems in physics simulator

*Spherical Capacitor*\
Considering two spherical shells, the inner with radius a and outer with radius b, each with an equal and opposite charge Q. The capacitance of such a body is:
$
  C &= Q / U = Q / (integral_a^b arrow(E) d r)\
  &= (Q 4 pi epsilon) / (Q integral_a^b 1 / r^2 d r) = (4 pi epsilon) / ((b-a) / (a b))\
  &= (4 pi epsilon a b) / (b-a)
$

== Capacitor Networks
Large capacitor networks can be broken down into a single capacitor using the following rules:
#align(
  center,
  table(
    columns: 3,
    inset: 10pt,
    table.header([], [Parallel], [Series]),
    [Total Capacitance], $sum_(i=1)^n C_n$, $(sum_(i=1)^n C_n^(-1))^(-1)$,
    [Derivation],
    [All capacitors in parallel have the same voltage across them. Therefore an equivalent single capacitor would have capacitance: $Q_"total" / V = sum_(i=1)^n C_i$],
    [The total voltage dropped across the series of capacitors is equal to the voltage between the first and last terminal. Due to the conservation of charge, no new charge can be brought in between the inner capacitors: $U_"total" = sum_(i=1)^n U_i = sum_(i=1)^n Q/C_i\ therefore 1/C_"total" = sum_(i=1)^n 1/C_i$],
  ),
)

== Real-world capacitors
A capacitor consisting of two plates would need to be extremely large to be of any practical use. In real life, various forms of layered capacitors are used.#footnote([See chapter 1.19 of Elektrotechnik, Albach])

In general, their capacitance can be calculated by identifying the number of individual plate capacitors they form between layers and summing their capacitance (they are essentially connected in parallel). The capacitance around the edges of layers is negligible.

_Variable capacitor_ - A layered capacitor, who's overlapping area can be adjusted mechanically. Capacitance can be expressed in terms of an angle, depending on its construction.

_Film capacitor_ - This is essentially a plate capacitor wrapped into a cylinder. Its capacitance can be calculated in the same fashion as a plate capacitor, but *multiplied by 2*, as both sides of the conductor contribute to the capacitance.

#pagebreak()
== Energy stored by capacitor
The energy stored by a capacitance C with voltage U across it's terminals is:
$
  W_e = 1 / 2 C U^2
$

This is derived by integrating a differential equation of the change in energy as a function of the change in charge whilst the capacitor is connected to a constant voltage source (and is therefore independent of the geometry of the capacitor):
$
  d W_e &= U d q = 1 / C q d q\
  W_e &= 1 / C integral_0^Q q d q = 1 / 2 Q^2 / C\
  &= 1 / 2 C U^2
$

The stored energy can also be expressed in terms of fields (with energy density $J m^(-3)$) through the following equation (LTD: Revisit after reading Purcell):
$
  w_e = 1 / 2 arrow(E) dot arrow(D)
$

== Current
The net rate of flow of positive charge through a surface (*A* mperes). In conventional current, holes flow from higher to lower potential, although the electrons actually flow from low to high potential.
$
  I(t) = (d Q) / (d t)
$

_Convection current_ - Current caused by the transport of charges.


== Current Density
A field containing current that is flowing per unit area at a point in space. It can be expressed in terms of volume charge density $rho$ and velocity of the charges $arrow(v)$:
$
  arrow(J) = rho arrow(v)
$
It has the same polarity regardless of if the flow of electrons or holes is being considered, as in that case the charges will be moving in opposite directions.

The total current flowing through an area can be calculated with the help of a surface integral:
$
  I = integral.double_A arrow(J) dot d arrow(A)
$

== Resistance
As electrons in a conductor are accelerated in the same direction by an external electric field, they bump into stationary nuclei in the lattice, causing them to decelerate and scatter. The resulting average velocity of electrons (hence the negative sign) at a point is called the *drift velocity* and is directly proportional to the electric field. The constant of proportionality $mu$ is called *electron mobility (Beweglichkeit)*:
$
  arrow(v_e) = -mu_e arrow(E)
$

=== Specific Resistivity ($rho_R$) & Conductivity ($kappa$)
These are two fundamental properties of a material which are reciprocals of each other. They describe how well a material resists / conducts electricity:
$
  rho_R = 1 / kappa
$

#align(
  center,
  table(
    columns: 3,
    inset: 10pt,
    table.header([], [Resistivity], [Conductivity]),
    [Symbol], $rho_R$, $kappa$,
    [Units], [$ohm m$ Ohm meters], [$S m^(-1)$ Siemens per meter],
  ),
)

For a metal with $n$ electrons per unit volume, $rho = -e n$. The current density can be expressed in terms of the specific conductivity $kappa$ as:
$
  arrow(J) =-n e arrow(v) = n e mu_e arrow(E) = kappa arrow(E)
$

Resistivity is heavily dependant on temperature and pressure. A higher temperature results in nuclei oscillating around their equilibrium faster and thus increasing resistivity. On the other hand, the resistivity of semiconductors generally decreases with increasing temperature, as the oscillations free more electrons from the individual atoms. A factor $alpha$ is often used to calculate the resistivity with temperature taken into account:
$
  rho_R(T_"old", T_"new") = rho_(R "T old") (1+ alpha Delta T)\
  "where" Delta T = T_"new" - T_"old"
$
This is of course only accurate within a specific range of temperatures. A better approximation can sometimes be calculated with a 2nd factor $beta$:
$
  rho_R(T_"old", T_"new") = rho_(R "T old") (1+ alpha Delta T + beta (Delta T)^2)\
$

Alloys usually have worse conductivity than pure metals due to their irregular atomic structure.

=== Ohm's Law
In differential form:
$
  arrow(J) = kappa arrow(E)
$

Considering a cylinder with length $l$, homogenous conductivity $kappa$ and cross sectional area $A$ laying orthogonal to a homogenous electric field caused by electrodes with constant potentials $phi_1$ and $phi_2$ which continuously provides charges / holes. By integrating the fields in this equation we can derive the most fundamental equation in electronics.

The current through any cross-section in the cylinder is:
$
  I = integral.double_A arrow(J) dot d arrow(A) = J_x A\
  J_x = I / A
$

Thus we can express the electric field through the cylinder as:
$
  E_x = 1 / kappa J_x = I / (kappa A)
$

The potential difference between the ends of the cylinder is:
$
  U_12 = phi_1 - phi_2 = integral_0^l arrow(E) arrow(d s) = E_x l = (I l) / (kappa A)
$

Resistance of the cylinder (and therefore most wires) can be expressed in terms of resistivity (and thus $kappa$) as:
$
  R = (rho_R l) / A = l / (kappa A)
$

And thus:
$
  U_12 = I R qed
$

In summary:
$
  R = U / I = (integral_s arrow(E) arrow(d s)) / (kappa integral.surf arrow(E) arrow(d A))
$

_Aside:_ Since the resistance is directly proportional to the resistivity of the material, the temperature change formulas can be applied in exactly the same way.

Sometimes the conductance of a component is expressed as:
$
  G = 1 / R
$

The resistance of a hollow sphere with radius $a$ for the first shell and $b$ at the second shell, which are separated by a material with specific resistivity $rho_R$ is:
$
  R = (rho_R (b - a)) / (4pi a b)
$

== Real-world Resistors
Manufacturers usually produce series of resistors with certain tolerances, so that there are no gaps between the maximum / minimum allowed resistance in their catalogue. This ensures that no resistors are wasted and each can be sorted into a value, then marked with the corresponding key (coloured rings for through-hole, number codes on SMD resistors).

_Thin Film_ - A thin film of carbon / metal is applied onto a ceramic or glass base, then coated with plastic to prevent damage. This is the typical through-hole resistor that comes to mind and is the most common technology for SMD resistors, however it is not the most precise / power tolerant. Sometimes parts of the film are etched away to reduce cross-sectional area of the conductor and increase resistance.

_Wirewound_ - A thin wire is wound around a ceramic core, usually in a zig-zag manner to reduce parastic inductance. These are very precise and suitable for high-power applications, but are typically not available in SMD form.

_Metal Strip_ - This is simply a strip of metal / alloy (depending on desired resistance), usually resulting in a very low ohmic value. They are often used as shunts for measuring current.

_Potentiometer_ - Variable resistor adjusted by moving a physical contact.

_Thermistor_ - These are used in all kinds of temperature measurement circuits. They are made from semiconductors and are usually NTC (negative temperature coefficient), meaning their resistance decreases by a reliable amount as temperature increases, although PTC thermistors are also available.

_VDR (Voltage dependent resistor)_ - These are used to protect against voltage surges.

_LDR_ - Light dependent resistor.

== Conductor Boundary Conditions
As a constant current passes through the boundary of two different conductors with specific conductivity $kappa_1$ and $kappa_2$, we can analyse the change in normal and tangential components of the current density and electrical (caused by the voltage source) fields. Let us once again consider an infinitely small cylinder at the boundary.

=== Normal:
The normal current density must of course stay constant, otherwise charges are being generated / dissapearing:
$
  arrow(J_(n 1)) = arrow(J_(n 2))
$

Due to the change in conductivity, the normal component of the electric field must have changed:
$
  kappa_1 arrow(E_(n 1)) = kappa_2 arrow(E_(n 2))
$

=== Tangential:
The tangential electric field must be the same to obey the conservation of energy as a test charge is moved through a closed loop over the boundary:
$
  arrow(E_(t 1)) = arrow(E_(t 2))
$
Hence due to the relationship $arrow(J) = kappa arrow(E)$, the tangential current densities are:
$
  J_(t 1) / J_(t 2) = kappa_1 / kappa_2
$
This make intuitive sense when considering the following arrangement ($sigma = kappa$):
#image("images/tangential-current-boundary.png", width: 50%)

Thus:
$
  tan(alpha_1) / tan(alpha_2) = E_(n 2) / E_(n 1) = J_(t 1) / J_(t 2) = kappa_1 / kappa_2
$
The angle of "refraction" can be thought as caused by a "change in speed" intuitively (marching band analogy).

LTD: Confirm after reading Purcell
The stronger electric field through the material with lower conductivity makes intuitive sense, as it would have a corresponding higher permittivity.

At the boundary with an insulator, current obviously cannot flow into it. This results in only the tangential current density being substantial. The electrical field therefore also stays in the wire.
LTD: Simulate electric field staying within a wire.

LTD: Interesting paper to revisit https://www.ifi.unicamp.br/~assis/Found-Phys-V29-p729-753(1999).pdf

TODO: Surface charges in a wire, where is the electric field actually coming from?

== Power
The work done on a set of charges $Q$ as they traveled through a potential difference $U$ is:
$
  W_e = U Q
$
Therefore power can be expressed as:
$
  P(t) &= (d W_e) / (d t) => U I\
  &= I^2 R = U^2 / R
$

Power density is often a more useful value rather than the entire power lost to a component:
$
  p_V = (Delta P) / (Delta V) = arrow(E) dot arrow(J)
$

== Network Analysis
When designing real world circuits, analysing them in terms of fields is usually cumbersome. Hence we rely on manufacturers providing accurate values for components and with the help of some abstractions, most circuits are designed with the integral values of Voltage, Resistance, Current, Capacitance etc.

Potential Difference and Current are scalar values represented by arrows in circuit diagrams, which point in the direction of the electric field (hence conventional current).

_Ideal Voltage Source_ - Maintains a constant voltage between its terminals, current depends on the connected load. Vertical straight line in circuit symbol\
_Ideal Current Source_ - Maintains a constant current through the circuit, terminal voltage depends on the connected load. Horizontal straight line in circuit symbol

=== Kirchhoff's Circuit Laws
Gustav Kirchhoff's discovered two laws that make analysing circuits possible without measuring every individual component.

1. The sum of currents entering a node in a circuit is equal to the current leaving that node:
$
  sum_"Node" I = 0
$

2. The directed sum of the potential differences around any closed loop (Masche) is zero:
$
  sum_"Loop" V = 0
$
This are due to the work done integral in a closed path and current density integral of a closed surface being 0 because of conservation of energy / charge.

=== Resistor Networks
Considering that the voltage across resistors *in series* is the sum of their individual voltage drops, the total resistance is simply the sum:
$
  R_"total" = sum_(i=1)^n R_i
$

The voltage across each path *in parallel* is the same but the total current is the sum of currents through each path. The total resistance is the reciprocal of the sum of reciprocals
$
  R_"total" = 1 / (sum_(i=1)^n 1 / R_i)
$
The total resistance of two resistors in parallel is therefore:
$
  R_"total" = (R_1 R_2) / (R_1+R_2)
$
It is always smaller than the smallest resistance in a path, which makes intuitive sense as the charge carriers have more possible paths through that section of the circuit.\
Conductivity is the reciprocal of resistance, hence:
$
  G_"total" = sum_(i=1)^n G_i
$

=== Voltage Divider
$
  V_"out" = V_"in" R_2 / (R_1+R_2)
$
The ratio of voltages is the same as the ratio of resistances:
$
  U_1 / U_2 = R_1 / R_2
$

_Wheatstone Bridge_ - Circuit used for accurately measuring resistance using 2 Potential dividers in parallel, of which 3 of the resistances are known, and a voltmeter in between is used to determine how imbalanced the divided voltage is.

When a load is connected to a voltage divider, it is effectively in parallel with the 2nd resistor and thus reduces the voltage at V_OUT. Furthermore, there are very high power losses, which is why voltage dividers are usually used for measuring resistances rather than as voltage regulators (where switching supplies / OPAMPs excel).

=== Measuring Resistance
When measuring circuits, voltmeters ideally have an infinitely high resistance and ammeters should have a resistance as close to 0 as possible. If the resistance of a measuring device is known, the error can be corrected or alternatively a more suitable resistance can be chosen for the expected voltage to prevent damaging the meter without massively affecting the measurement.

Regardless, it is best that the ammeter is included in the parallel path of the target resistor, so that its erroring resistance only exists in the denominator and leads to a smaller error than if it were connected outside of the voltmeters connection:
#grid(
  columns: (auto, auto),
  align: horizon,
  image("images/resistance-measurement.png", width: 70%),
  $
    R = (U_V - U_A) / I_A
  $,
)

== Real Power Sources
Real world voltage and current sources cannot simply continue to output high power without losses. These losses can be modelled with an internal resistance $R_i$, over which voltage / current is lost.

_Real Voltage Source_ - The internal resistance is modelled *in series* with the EMF source, meaning that the higher the current pulled by the load, the more power is lost internally; therefore a voltage source should ideally be used with low currents.

_Real Current Source_ - Internal resistance is modelled *in parallel* (if it were in series the current source would simply increase the voltage accordingly to reach its target current) with the EMF source. The load should ideally have a low resistance, so the majority of the current flows through the parallel load path.

Voltage / Current sources can be converted between one another such that they have the same open terminal voltage and short circuit current - their behaviour is then identical.

Batteries connected in parallel can charge one another - they only discharge at the same rate if their internal resistances are identical.

=== Load Power
The *maximum (useful) power at the load* is transferred when the load and internal resistance are *the same*. This can be expressed as:
$
  P_(L "max") = U_0^2 / (4R_i)
$

The normalized load power (efficiency) against normalized current graph looks like this:
#align(image("images/load-power.png", width: 40%), center)

*Efficiency*, on the other hand, varies depending on the power source, as mentioned previously in the "optimal manner" in which they should be operated. It can be expressed as follows:
$
  eta = P_"L" / P_"total" = (R_L / R_i) / (1+ R_L / R_i) dot 100% = (1-I / I_"max") dot 100%
$
Due to this, power transmission systems use voltage in the kV range to minimise the current and therefore reduce energy losses.

== Network Analysis Techniques
Various techniques may be employed to analyse more complicated circuits, either manually or by a computer.

=== Thevenin's / Norton's Equivalents
_"Set to zero"_:
- Voltage Source: Replace with a short circuit and the internal resistance if applicable; no voltage can be lost over an ideal short circuit
- Current Source: Replace with open terminals or the internal resistance in series with the original terminals, no current can flow through open terminals

_Thevenin's / Helmholtz's Theorem_ - Any linear circuit between two terminals can be replaced with a single resistor and voltage source in series. The voltage can be calculated as the voltage between the two target terminals when no load is connected, the resistance is the resistance between the two terminals after setting every voltage / current source in between to zero.

_Norton's Theorem_ - It can be replaced by a single current source and resistor in parallel. The current can be found by shorting the target terminals and the resistance is calculated in the same process as the Thevenin equivalent.

These techniques can be used fundamentally to convert between a voltage and current source.

=== Y-$Delta$ Transform
Complicated resistor networks can be simplified with help of the so called Y-$Delta$ Transform.
#image("images/y-delta.png", width: 60%)
#image("images/y-delta-equations.png")

=== Superposition Principle
Like many natural phenomena, voltage and current in a linear circuit can be determined by superposing (summing) the individual contributions of each power source over a particular branch. This is not applicable to power, which is a quadratic equation when expressed only in terms of current / voltage.

+ Choose the power source to analyse and set all other power sources to zero as in the Thevenin equivalent.
+ Express voltage / current of the target branch(es) in terms of the power source's voltage / current.
+ Analyze all remaining power sources' contributions and sum them all together to calculate the total voltage / current across the branch.

=== Linear System of Equations
Thanks to Ohm's law, we can reduce the number of unknowns across a component to 1 (resistance is a constant of proportionality) as current and voltage can be determined from one another.

_Branch_ - Components connected in series between two nodes. These also have 1 unknown (either current or voltage) as they share the same current.

This leads to a general method for finding voltage and current in a linear circuit using a linear system of equations, which can be solved efficiently by computers with methods covered in linear algebra.

A circuit with $z$ branches needs at least $z$ linearly independent equations to solve the unknowns, which can be found using Kirchoff's circuit laws.

+ The circuit must firstly be redrawn without components, rather a connection of branches (which may contain several components in series) and nodes.
+ A direction must be chosen for current flow and voltage drops. This can often be predicted correctly but is not an issue if incorrect, as a negative value will simply be calculated. It *must* however be used *consistently*.
+ For a circuit containing $k$ nodes, $k-1$ linearly independent equations can be found where the current is equal to 0 (Kirchhoff's current law).
+ The remaining $z - k - 1$ equations can be found using the voltage drops around a loop (equal to 0). Linearly independent equations can be ensured by "excluding" a particular branch after an equation for it has been included, forcing a new branch to be included to assemble the next equation.
+ The voltage drop equations can then be expressed in terms of resistance (as coefficients) and current, leading to a square, regular system of equations - ready to be solved!

== Current Carrying Mediums
Leading from the definition of electrostatic potential, 1 Coulomb of charge accelerated by a voltage drop of 1V through a vacuum (0 resistance) gains 1 Joule of energy. Although this is the standard unit for energy, it is unconvenient when working with individual particles.

_Electronvolt_ - A unit of energy useful for systems at the atomic scale. 1 $e V$ is the kinetic energy gained by an electron accelerated by a potential difference of $1V$ through a vacuum. It is equal to $e dot 1J = 1.602... times 10^(-19) "Joules"$.

=== Vacuum

=== Gases

=== Liquids

=== Semiconductors
