#heading(outlined: false)[Netzwerke und Schaltungen 1]

#outline()

#set heading(numbering: (..nums) => nums.pos().map(str).slice(1, none).join("."))

#pagebreak()

*Electromagnetism:*\
A linear theory of how charges interact governed by Maxwell's Equations and the Lorentz Force law, which are the only fundamental laws of electromagnetism. Coulomb's law was discovered through experiment and can be derived from Gauss's law, and Ohm's law does not hold true for all materials.

Nonetheless they are very useful in practice and certainly worth studying.

Charge polarity is completely arbitrary; it is only important to stay consistent. The same applies to magnetic poles, which were so defined based on the Earth's magnetic field (however this flips occasionally too...).
#figure(
  image("images/conventional-current.png", width: 50%),
) <fig-conventional-current>

Conventional current is assumed unless stated otherwise.

#pagebreak()

*Surface / Volume Integration nudge factors:*\
_Cylindrical coordinate system:_ $r$\
_Spherical coordinate system:_ $r^2sin(theta.alt)$ (where $theta.alt$ is the
angle from the z axis)

TODO: Perhaps define everything in terms of $D$ and $H$ fields for consistency + brevity?

== Electrostatics

=== Coulomb's Law
$
  arrow(F_2) = (Q_1Q_2 arrow(e_12)) / (4pi epsilon abs(arrow(r_12))^2)
$

$epsilon$ is often replaced with $epsilon_0$ as calculations are assumed to take place in a vacuum.

=== Electrostatic Field
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

=== Electrostatic Potential
Electrostatic potential energy of a particle as it moves from $P_0 -> P_1$:
$
  arrow(F)=arrow(E)Q\
  W_e = -integral_(P_0)^(P_1) arrow(F) dot d arrow(s)=-Q integral_(P_0)^(P_1) arrow(E) dot d arrow(s)
$

The work done by the electric field as a positive test charge moves towards another positive is negative, as it pushes in the opposite direction. The potential energy of the test charge increases due to the incoming stored energy, so $W_e$ is positive.

$integral.cont$ - Closed integral, when a line begins and ends at the same point in space.

Provided the speed as the charge moves through the field tends towards 0 (to minimize the arising magnetic field), the electrostatic force is conservative:
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

=== Elektrische Fluss (Flux)

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

=== Gauss's Law of Electrostatics
The above derived relationship is known as Gauss's law:
$
  Psi_E &:= integral.surf arrow(E) dot d arrow(A)=Q / epsilon_0\
  Psi_D &:= integral.surf arrow(D) dot d arrow(A)=Q\
$
The total electric flux density through an arbitrary closed surface (electric flux) is equal to the charge enclosed inside, regardless of the charges position / area of the surface.

This law is one of Maxwell's equations and can be used in reverse with infinitely small symmetric Gaussian surfaces to calculate the electric field around certain charge distributions, for example, the electric field at the surface of any point on a charged plane. #footnote([See _Electricity and Magnetism | Purcell_ for some great derivations of electric fields by various charge distributions.])

==== Line Charge

The electric field at distance $r$ from a line charge with uniform charge distribution $lambda$ can be calculated using either the integral of contributions to the field by small sections of the line, or far simpler using a cylinder and Gauss's law:
$
  arrow(E(r)) = lambda / (2 pi epsilon r)
$


=== Infinite Charged Plane
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

=== Conductors(Macroscopic Level)
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

=== Dipoles

_Dipole_ - A phenonmenon when opposite electric charges / magnetic poles are separated. Examples of electric dipoles are ions under the influence of an external electric field or certain molecules, such as $H_2O$ which are permanent dipoles due to their asymmetric structure.

_Electric Dipole Moment_ - for a dipole with charge $Q$ on the positive end and vector $arrow(d)$ from the main negative point to the main positive point, the electric dipole moment is:
$
  arrow(p) = Q arrow(d)
$
It can be thought of as a measure of a systems polarity. A higher dipole moment means the system experiences a greater torque when an external homogenous electric field is applied.

When a material containing dipoles is in an external electric field, the dipoles align in the same direction, resulting in an overall polarization of the material (essentially a larger dipole). Temperature has a large effect on this, as the random movements of particles disrupt the perfect alignment encouraged by the electric field.
#figure(
  image("images/polarization.png", width: 20%),
) <fig-polarization>

The overall polarization of a dielectric with volume $V$ is:
$
  arrow(P) = (sum_(i=1)^n arrow(p_n)) / V
$
This the $arrow(E)$ field arising in the opposite direction due to polarization, thus weakening the net electrical field.

A polarized conductor / dielectric with a net 0 charge in a non-homogeonous field, such as near a point charge will usually have a resultant force, for example a dipole near a point charge (regardless of polarity) will experience a stronger attractive force and the dipole will have a resultant force towards the point charge.

=== Electric Permittivity

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

LTD: Revisit after Purcell

Taking place in a medium with permittivity $epsilon$:\
The difference in the E field before and after polarisation:
$
  arrow(P) &= arrow(D) - arrow(E)\
  &= epsilon arrow(E) - arrow(E)
$

Therefore the resulting electric displacement field (field only due to charges, polarization) is equal to the permittivity of the space x (electric field after polarization + the change in electric field due to polarization):
$
  arrow(D) &= epsilon_0 arrow(E_"if it happened in vacuum") &= epsilon_0(arrow(E) + arrow(P)) = epsilon (
    arrow(E) -(epsilon arrow(E) - epsilon_0 arrow(E))
  )\
  &= epsilon(arrow(E)(1-epsilon)+epsilon_0 arrow(E))\
  "LTD: This is flawed"\
  &= epsilon(1-epsilon)arrow(E) + epsilon epsilon_0 arrow(E)
$
Where $E$ is the net electric field after polarisation\

=== Dielectric Boundary Conditions
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

=== Capacitor Networks
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

=== Real-world capacitors
A capacitor consisting of two plates would need to be extremely large to be of any practical use. In real life, various forms of layered capacitors are used.#footnote([See chapter 1.19 of Elektrotechnik, Albach])

In general, their capacitance can be calculated by identifying the number of individual plate capacitors they form between layers and summing their capacitance (they are essentially connected in parallel). The capacitance around the edges of layers is negligible.

_Variable capacitor_ - A layered capacitor, who's overlapping area can be adjusted mechanically. Capacitance can be expressed in terms of an angle, depending on its construction.

_Film capacitor_ - This is essentially a plate capacitor wrapped into a cylinder. Its capacitance can be calculated in the same fashion as a plate capacitor, but *multiplied by 2*, as both sides of the conductor contribute to the capacitance.

=== Energy stored by capacitor
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


=== Current Density
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
  arrow(v_e) &= -mu_e arrow(E)\
$
Assuming a homogenous, parallel E field (for example between a capacitor's plates):
$
  V &= integral_0^l arrow(E) d s\
  therefore arrow(v_e)&= -mu_e V / l
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

=== Real-world Resistors
Manufacturers usually produce series of resistors with certain tolerances, so that there are no gaps between the maximum / minimum allowed resistance in their catalogue. This ensures that no resistors are wasted and each can be sorted into a value, then marked with the corresponding key (coloured rings for through-hole, number codes on SMD resistors).

_Thin Film_ - A thin film of carbon / metal is applied onto a ceramic or glass base, then coated with plastic to prevent damage. This is the typical through-hole resistor that comes to mind and is the most common technology for SMD resistors, however it is not the most precise / power tolerant. Sometimes parts of the film are etched away to reduce cross-sectional area of the conductor and increase resistance. They genuinely have the lowest parasitic inductance and are suitable for high-frequency applications (less resistance to changing current).

_Wirewound_ - A thin wire is wound around a ceramic core, usually in a zig-zag manner to reduce parastic inductance. These are very precise and suitable for high-power applications, but are typically not available in SMD form. However, they have a relatively high parasitic inductance.

_Metal Strip_ - This is simply a strip of metal / alloy (depending on desired resistance), usually resulting in a very low ohmic value. They are often used as shunts for measuring current.

_Potentiometer_ - Variable resistor adjusted by moving a physical contact.

_Thermistor_ - These are used in all kinds of temperature measurement circuits. They are made from semiconductors and are usually NTC (negative temperature coefficient), meaning their resistance decreases by a reliable amount as temperature increases, although PTC thermistors are also available.

_VDR (Voltage dependent resistor)_ - These are used to protect against voltage surges.

_LDR_ - Light dependent resistor.


== Ohm's Law
In differential form:
$
  arrow(J) = kappa arrow(E)
$

Considering a cylinder with length $l$, homogenous conductivity $kappa$ and cross sectional area $A$ lying orthogonal to a homogenous electric field caused by electrodes with constant potentials $phi_1$ and $phi_2$ which continuously provides charges / holes. By integrating the fields in this equation we can derive the most fundamental equation in electronics.

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

=== Conductor Boundary Conditions
As a constant current passes through the boundary of two different conductors with specific conductivity $kappa_1$ and $kappa_2$, we can analyse the change in normal and tangential components of the current density and electrical (caused by the voltage source) fields. Let us once again consider an infinitely small cylinder at the boundary.

==== Normal:
The normal current density must of course stay constant, otherwise charges are being generated / dissapearing:
$
  arrow(J_(n 1)) = arrow(J_(n 2))
$

Due to the change in conductivity, the normal component of the electric field must have changed:
$
  kappa_1 arrow(E_(n 1)) = kappa_2 arrow(E_(n 2))
$

==== Tangential:
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

=== Power
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

Potential Difference and Current are scalar values represented by arrows in circuit diagrams, which point in the direction of the electric field, hence conventional current. A voltage drop across a battery points from the positive to the negative terminal.

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

=== Load Power <load-power>
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

_Anion_ - Negatively charged particle\
_Cation_ - Positively charged particle

_Anode_ - Attracts anions; positively charged\
_Cathode_ - Attracts cations; negatively charged\

=== Vacuum
Charges can be accelerated through a vacuum by applying an electric field. Considering two oppositely charged plates connected to a voltage source $U$ at distance $d$ between each other with a vacuum as the dielectric (simple capacitor), the electric field between the plates is homogenous:
$
  arrow(E) = U / d
$

Of course, electrons cannot simply leave the negatively charged plate unless field, thermionic or photoelectric emission occurs (see fundamentals/physics). However, assuming a freed electron starts at the negative plate, the constant acceleration in the direction of the positive plate it experiences is:
is:
$
  a = (e U) / (m_0 d)
$
Its velocity at any point in time is simply $v = a t$, the displacement is:
$
  s = integral_0^t v d t = (e U t^2) / (2 m_0 d)
$
The velocity at any displacement $s$ is:
$
  v(s) = sqrt(2 U e/m_0 s/d)
$
Small potential differences can already lead to huge velocities so the increase in relativistic mass must be accounted for:
$
  m &= gamma m_0\
  &=m_0 / (sqrt(1-v^2/c^2))
$

==== Space Charge
When considering the flow of a continuous current through a vacuum (or other dielectrics where this effect is most noticable), many electrons slowly start to be accelerated near the surface of the cathode. This "cloud" of electrons slightly reduces the resulting electric field at the surface from which they left, slowing down the emission of more electrons and thus the current, making this a significant issue for vacuum tubes and particle accelerators.

This can however be overcome by a high enough voltage, which accelerates the cloud away allowing more current to flow. This non linear relationship can be expressed as (Child's Law):
$
  I = 4 / 9 (epsilon_0 A) / d sqrt((2e)/m_0) U^(3 / 2)
$
TODO: Derivation

Unless extremely high voltages are applied, field emission doesn't take place. Other emission mechanisms, such as thermionic emissions, lead to a relatively constant rate of emission and therefore "maximum" current called the saturation current.

#figure(
  image("images/saturation-current.png", width: 60%),
) <fig-saturation-current>

If the voltage is applied in the opposite polarity (and the emission mechanism stays the same), no current can flow (unless the voltage is high enough for field emission to take place). This is the working principle of a vacuum tube as a diode (Fleming valve).

=== Gases
A gas between electrodes can act as a resistance and / or additional charge carriers (ionised gas molecules).

_Electrical Breakdown_ - When a material, which is usually non-conductive, becomes conductive under the influence of an electrical field or an intense electromagnetic wave.

In the case of gases, an electric field itself can cause already existing ions in the gas to further ionise other atoms through collisions cascading to create plasma (a fundamental state of matter, containing a large portion of ions), which is extremely conductive. This is called electrical arcing. In air this occurs around a voltage of $3k V m m^(-1)$.

Usually we want to avoid arcing, as it causes damage to electrodes and wastes energy. However, this phenomenon is useful in welding and electrical discharge machining.

_Selbständigen Leitung_ - Electrical breakdown occurs and a gas becomes conductive, only caused by the electrical field itself.\
_Unselbständigen Leitung_ - Electrical breakdown caused by external light / heat or ions are introduced by a radioactive source. This can often lead to a maximal saturation current.

Whilst the electrical field and current are directly proportional, this is known as Ohmic conductance. This is however often not the case in gases, for example when a current leads to an increase in heat and subsequently collisions = resistance. Alternatively this can lead to more ionising collisions and increased conductivity.

=== Liquids
Pure water contains no ions and is therefore a perfect insulator, sometimes used directly on top of electronics for cooling purposes.

_Electrolytic Dissocation_ - Adding ions such as salt (NaCl) to water to make it more conductive, creating a good electrolyte.

The unit Ampere was defined in terms of the amount of silver transported during a period of electrolysis with specific chemicals in the past.

==== Faraday's Law of Electrolysis
_Mole_ - The base unit for amount. 1 mole is defined as the number of atoms in 12 grams of Carbon 12 - the most stable and abundant isotope; this amounts to $6.022 times 10^(23)$ atoms, also known as Avogadro's constant $N_A$.

_Molar Mass_ - The relative mass per mole of a substance which can be found in the periodic table. This value can be summed for finding the molar mass of molecules, for example $16 + 2 times 1 approx 18 M$ is the molar mass of water. The mass can then be found by multiplying by the molar mass constant $M_u approx 1 times 10^(-3) "kg" "mol"^(-1)$. Therefore water has the mass $18 times M_u approx 18 "grams" "mol"^(-1)$.

Faraday expressed the mass of ions with relative charge $z$ and molar mass $M_r$ deposited / liberated at a cathode / anode during electrolysis as the following equation:
$
  m prop Q\
  m = (M_r M_u) / (z e) Q = (M_r M_u) / (z e) I t\
  A_r u = M_r M_u "if question given in these units"
$

Where the constant of proportionality is called the _electrochemical equivalent_ and is characteristic for a given substance.

This can be rearranged to compare the mass of ions exchanged when their charges are equal (often the case in electrolysis):
$
  (m_1 z_1) / (M_(r 1))= (m_2 z_2) / (M_(r 2))
$

Electrolytes are usually ohmic in nature and the current for an electrolyte with cation / anion volume density $eta$ can be expressed as:
$
  I = eta z e A (abs(v_+) + abs(v_-))
$
This can be used to derive the resistance and conductivity as well.

Temperature usually has a negative coefficient to resistance, unlike in metals.

=== Semiconductors
Semiconductors like silicon are arranged in a crystaline structure, due to their even number of valence electrons (usually 4):
#figure(
  image("images/silicon.png", width: 40%),
) <fig-silicon>
Due to this structure, valence electrons in semiconductors effectively belong to two atoms at once.

_Conduction Band_ - Electrons can be excited to a higher conduction band where they are free to move throughout the material and conduct electricity.

_Band Gap_ - The range of energy between the valence band and conduction band in different materials. This varies and determines a materials conductivity. In electrical conductors this gap does not exist and the valence electrons are always in the conduction band, in conductors it is relatively small and they can be influenced to become better conductors / insulators, for example through temperature.

_Rekombination_ - When a hole is filled by an electron. This occurs at a relatively constant rate in semiconductors which can be controlled by temperature.

_Donators_ - Atoms with 5 valence electrons, used to n-dope a semiconductor and increase the number of negative conductors. Examples: Arsenic, Antimony, Phosphor

_Acceptors_ - Atoms with 3 valence electrons, used to p-dope a semiconductor and increase the number of holes. Examples: Gallium, Indium, Aluminium

_Majority Conductor_ - Either holes or electrons, which is mainly responsible for carrying electric current in a doped semiconductor.

=== p-n Junction
When these two doped regions are connected, excess electrons cross the border to fill holes, resulting in a steady state called the depletion region. This however also leads to two opposite charge distributions at the border due to the remaining donators / acceptors, which in most semicondctors has a voltage of 0.8V between them (threshold voltage).

When a voltage source greater than the threshold voltage is connected to the diode with the positive terminal to the p-type end, the depletion region is overcome and current flows.
#figure(
  image("images/forward-bias.png", width: 60%),
) <fig-forward-bias>

The opposite of this is known as reverse bias and leads to no current flow:
#figure(
  image("images/reverse-bias.png", width: 60%),
) <fig-reverse-bias>

This is the working principle of diodes. High enough voltages can lead to electrical breakdown and destruction of the diode.

== Magnetism
The magnetic properties of certain iron ores (permanent magnets) were already noticed long before the electrostatic force. Historically magnets have been used for:
- Compasses for navigation purposes due to the Earth's magnetic field
- Extracting shards of metal in medical treatments

=== Magnetic Dipoles
Every permanent magnet must have a north and south pole - if it is cut a new pair of poles simply exists, because a pole is simply a macroscopic collection of dipole moments. Like poles repel and opposite poles attract, just like charges.

However unlike charge, a monopole has never been observed and the possibility of its existence is uncertain (theoretical physics).

Magnetic fields can be observed using ferromagnetic shavings or a compass, which are also magnetic dipoles and therefore align themselves tangentially along field lines. This also implies that they slightly affect the magnetic field itself, meaning smaller shavings are more accurate for visualizing the field. Ferrofluid is a good alternative.

Magnetic dipoles can also be created by a current loops. This is seen at the atomic level, as the spin of certain elementary particles / electrons in orbitals lead to dipoles, meaning single atoms create and can be influenced by magnetic fields. Do not forget to use conventional current when applying this model to electron orbits!

By convention, magnetic field lines around dipoles point from north to south:
#figure(
  image("images/magnetic-fields.png", width: 40%),
) <fig-magnetic-fields>

=== Magnetic Fields
Just like the $arrow(E)$ and $arrow(D)$ field in electrostatics, there are two magnetic vector fields used in calculations:
#align(
  center,
  table(
    columns: 3,
    inset: 10pt,
    table.header([], [Magnetic Field Strength], [Magnetic Flux Density]),
    [Symbol], $arrow(H)$, $arrow(B)$,
    [Units], [$A / m$], [Tesla, $N/(A m)$],
    [Intuition],
    [The field arising from a magnet, independent of the matter in which it exists.],
    [Used in the Lorentz Force Law to calculate the force arising on charges moving through the space in which the field is present.],
  ),
)
The two fields are related to each other through:
$
  arrow(B) = mu arrow(H)
$
Where $mu$ is the magnetic permeability of the material, a measure of how much the magnetic field creates opposing / like magnetisation within the material:
$
  mu = mu_r mu_0
$
Where $mu_0$ is the magnetic permeability of a vacuum.

==== Magnetic Flux
This is the total magnetic flux density through a surface:
$
  Phi = integral.double_A arrow(B) dot d arrow(A)
$
Its unit is Weber (Wb) and it will be useful later for inductance.

==== Gauss's Magnetism Law
The magnetic flux through a closed (Gaussian) surface is 0:
$
  integral.surf_A arrow(B)dot d arrow(A) = 0
$

Intuitively, it says that magnetic monopoles do not exist and all magnetic field lines return to the opposite pole as loops. This is one of Maxwell's Equations.
#figure(
  image("images/gauss-magnetism-law.png", width: 40%),
) <fig-gauss-magnetism-law>

=== Ørsted's / Ampere's Circuital Law
In 1820 Hans Christian Ørsted discovered that a wire carrying an electric current induces a magnetic field around it. The direction of this field can be remembered using the right hand curl rule, where the fingertips represent the arrow heads:
#figure(
  image("images/right-hand-curl-rule.png", width: 40%),
) <fig-right-hand-curl-rule>
This magnetic field:
- Lies in a plane perpendicular to the direction of the current
- Its strength is directly proportional to the magnitude of the current
- It's inversely proportional to the distance from the current

This phenomenon sparked a great deal of interest; Andre-Marie Ampere formulated the following fundamental law mathematically describing the magnetic field around an enclosed net current flowing perpendicular through a surface, known as his circuital law:
$
  integral.cont_C arrow(B) dot d arrow(s) &= mu integral.double_S arrow(J) d arrow(S)\
  &= mu I
$
- This applies to any closed curve, not just a circle
- The surface in question is one bounded by the closed curve, its exact shape does not matter and will always give the same total current value
- The direction of the curve integral is determined by the above mentioned right hand rule.

TODO: Maxwell-Ampere law, what problems does it solve?

_Durchflutung ($Theta$)_ - The sum of current flowing through a surface (opposite direction subtracts)

==== Biot-Savart Law
Although Ampere's Circuital Law provides us with a fundamental law, it is not very useful in practice unless certain symmetries arise. Biot and Savart determined the following formula for calculating the magnetic flux density at any arbitrary position vector $arrow(r)$ around a current carrying wire:
$
  arrow(B)(arrow(r)) = mu / (4 pi) integral_C (I d arrow(cal(l)) times r') / abs(arrow(r'))^3
$
Where $d arrow(l)$ is a displacement vector along the wire and $arrow(r')$ is the vector from the current point in the wire to the point where flux density is being calculated.
#figure(
  image("images/biot-savart-law.png", width: 40%),
) <fig-biot-savart-law>
LTD: Is it possible to go directly from Ampere's Law to this? with the assumption that the curve is a perfect circle?

==== Infinitely Long Wire
For a straight, infinitely long wire, this becomes the following field strength in cylindrical coordinates with the z axis lying along the wire:
$
  arrow(B)(rho) = (arrow(e_phi)mu I) / (2 pi rho)
$
Where $rho$ is the distance from the center of the wire.

In case the magnetic field inside the wire (with radius $a$) is needed the following can be used:
$
  arrow(B)(rho) = (arrow(e_phi)mu I rho) / (2 pi a^2)
$
#figure(
  image("images/magnetic-field-in-wire.png", width: 40%),
) <fig-magnetic-field-in-wire>

Note: The derivation of this is a good exercise, it can either be derived from symmetry and Ampere's law or directly from Biot-Savart's Law - do not forget the cylindrical coordinate "nudge" factor!

==== Toroid
#figure(
  image("images/toroid.png", width: 60%),
) <fig-toroid>

Considering a loop inside the toroid, the total current flowing through the surface linked to this curve for $N$ windings is $N I$, therefore:
$
  integral_0^(2 pi) arrow(e_phi) arrow(H)(rho) dot rho d arrow(phi) &= N I\
  2 pi rho arrow(H)(rho) &= N I\
  arrow(H)(rho) &= (arrow(e_rho)N I) / (2 pi rho)
$

Outside of the toroid (either inside or outside the loop) the total current through a surface $Theta = 0$, therefore the magnetic field is mostly 0. The small height of the toroid leads to a negligible magnetic stray field.

==== Solenoid
A solenoid behaves like a dipole, making it useful for creating magnetic dipoles on demand:
#figure(
  image("images/solenoid.png", width: 50%),
) <fig-solenoid>

The homogenous magnetic field inside a solenoid is with length $l$ is:
$
  arrow(H) &= arrow(e_x)(N I) / (l)
$

=== Lorentz Force Law
The total force acting on a particle with charge $q$ moving with velocity $v$ through a magnetic / electric field is:
$
  arrow(F) = q(arrow(E) + arrow(v) times arrow(B))
$
This was first implied by Maxwell, then expanded by Oliver Heaviside and Lorentz. This is considered to be of equal importance as Maxwell's equations, as it links the electrostatic and magnetic fields.

Now I will consider the force due to the magnetic field alone $arrow(F) = q arrow(v) times arrow(B)$ (electrostatics already covered earlier) which only affects moving charges (because they themselves also generate a surrounding magnetic field). The resulting direction can be calculated using Fleming's left hand rule (mnemonic FBI):
#figure(
  image("images/left-hand-rule.png", width: 30%),
) <fig-left-hand-rule>

The law can be expressed in terms of current in a wire of length $l$:
$
  arrow(F) &= q arrow(v) times arrow(B)\
  &= arrow(I) l times arrow(B)
$
The net force on a curved wire / varying current can be calculated by using an integral:
$
  arrow(F) &= integral_C I d arrow(l) times arrow(B)(arrow(r))\
$
This can be used to for example calculate that the net force on a current loop perpendicular to a magnetic field is 0, it's "stretched outwards" equally at every point.

By using the $sin$ cross product identity, the scalar form of the law is:
$
  F = B I l sin(theta)
$
Where $theta$ is the angle between the magnetic field lines and the the direction of the current.

Two straight, parallel, current-carrying wires *attract* each other if their currents are in *the same* direction, and *repel* if their currents are in *opposite* directions. This force can be calculated using Ampere's Force Law, a combination of the Biot-Savart Law and Lorentz Force Law.


TODO: Why does the circular field get pushed up in a homogenous field?

Reference answer:\
"
The real reason is that the magnetic field is not a vector quantity. It’s better thought of as a ‘bivector’: an oriented plane instead of an oriented line. From this perspective, the magnetic field does not point along a line, but rather curls around in planes, which makes the resulting force make much more sense.

However, people are more used to dealing with vectors, and in 3 dimensions there’s only one vector perpendicular to a given plane, so you can always replace bivectors with ‘pseudovectors’ like what is done with the angular momentum and the magnetic field in 3d.

Once you want to consider more general situations, or have a less clunky mathematical picture though, then you can’t just talk about vectors and the way the magnetic field is treated must change. Relativistic physics often forces people into this, but you don't need to invoke relativity to want to use a better mathematical formalism.

When one moves to relativistic physics, then one discovers that both the electric field and the magnetic field are bivectors, but the electric field spans a plane with one spatial and one temporal direction, whereas the magnetic field spans two spatial directions. The fact that space and time can be 'rotated' into eachother in relativistic physics typically leads us to abandon treating these as separate objects and instead talking about the Faraday tensor F which contains both the electric and magnetic fields in one object.
"

==== Galvanometer
These analogue versions of ammeters cause a needle to rotate depending on the current flowing between its terminals:
#figure(
  image("images/galvanometer.png", width: 60%),
) <fig-galvanometer>

Modern day ammeters are instead built using an ADC and a shunt resistor.

==== Hall Effect
A potential difference arises over a conducting plane placed inside a transverse magnetic field as the charge carriers experience a magnetic force, creating a charge imbalance:
#figure(
  image("images/hall-effect.png", width: 60%),
) <fig-hall-effect>

This phenomenon can be carefully calibrated to build hall sensors and detect magnetic fields in space.

=== Magnetisation
The torque acting on a dipole in an external magnetic field depends on its area, orientation and magnitude of the magnetic fields it generates. When considering current loop dipoles, *magnetic moment* is:
$
  arrow(m) = arrow(n) I A = I arrow(A)
$
Where $arrow(n)$ is the unit vector perpendicular to the surface enclosed by the current loop, pointing in the direction of the "north pole" - the end at which field lines start.

The magnetic moment of permanent magnets can be determined through testing and is usually provided by the manufacturer.

The resulting *magnetic torque* acting on the dipole is calculated as (Lorentz force law):
$
  tau = arrow(m) times arrow(B)
$

The density of dipoles in an object is called *magnetisation* (similar to polarisation - how much an object responds to an external electrical field) and expressed as:
$
  arrow(M) = arrow(d m) / (d V) = (sum arrow(m)) / V
$
This is independent of the medium, reminiscent of the $arrow(H)$ field.

Alternatively, the medium is taken into account as the *magnetic dipole moment*:
$
  arrow(j) = mu arrow(m)
$
and the *magnetic polarisation*:
$
  arrow(J) = mu arrow(M)
$
Although the underlying idea is quite similar to current density (lots of elementary currents) these are not the same thing. Sometimes the symbol $I$ is used instead.

LTD: Still somewhat confused about these relationships:
$
  arrow(B) = mu arrow(H) &= mu_0 arrow(H) + arrow(J)\
  &= mu_0 (arrow(H) + arrow(M))
$

=== Types of Magnetization
Materials behave in certain ways when under the influence of an external magnetic field.

==== Diamagnetism
Materials experience a slight repulsive force when in a magnetic field. This phenomenon occurs in all materials (although it is outweighed by para / ferromagnetic effects in certain ones). $mu_r < 1$, meaning that the magnetic flux density in the material is weaker than in a vacuum. The spin and current loop magnetic dipoles cancel each other out when no external field is present and these materials are not magnetised by themselves.

Examples include organic compounds, water and some metals such as copper. Their permeability is unaffected by temperature.

The magnetic field induces an opposing magnetic field within the material, meaning that the magnetic polarisation is in the opposite direction to the field lines, like poles are next to each other and the material is slightly repelled.

Strong diamagnetic materials, such as superconductors, or even water can be levitated by strong magnetic fields.
#figure(
  image("images/levitating-frog.png", width: 30%),
) <fig-levitating-frog>

Like with many things in magnetism, an accurate explanation for this repulsion can only be given by Quantum Mechanics and the Bohr-Van Leeuwen theorem, however this heuristic from Wikipedia is an interesting thought exercise:

"When a material is put in a magnetic field, the electrons circling the nucleus will experience, in addition to their Coulomb attraction to the nucleus, a Lorentz force from the magnetic field. Depending on which direction the electron is orbiting, this force may increase the centripetal force on the electrons, pulling them in towards the nucleus, or it may decrease the force, pulling them away from the nucleus. This effect systematically increases the orbital magnetic moments that were aligned opposite the field and decreases the ones aligned parallel to the field (in accordance with Lenz's law). This results in a small bulk magnetic moment, with an opposite direction to the applied field." ie the current rings opposing the magnetic field get stretched out and therefore contribute more to the net dipole moment.

==== Paramagnetism
In these materials (usually with an odd number of valence electrons) the magnetic polarisation of individual atoms is not 0 and each atom is a dipole without any external field needed. However, the average magnetisation of the whole object is 0.

Once an external field is aligned or the material is cooled to a low enough temperature, the majority of the atoms align in the direction of the field, increasing the magnetic flux density throughout the material and overcoming diamagnetic effects. $mu_r > 1$ and they are slightly attracted to the external magnet.

They do not retain magnetism, as the random motion due to temperature dissolves alignment of dipoles.

Examples are Aluminium, oxygen and titanium.

==== Ferromagnetism
While $mu_r approx 1$ for dia- / paramagnets, ferromagnets have very variable values in the order of $10^2$ - $10^4$. They are noticably attracted to external magnets. Common ferromagnets are iron, nickel, cobalt and their alloys.

Similarly to paramagnets, atoms of these materials are already polarised and are already in groups of parallel magnetic moments called *domains* or Weiss areas.

As an external magnetic field is applied, the domains are brought into alignment with one another and merge to form larger sets of parallel moments.
#figure(
  image("images/magnetic-domains.png", width: 40%),
) <fig-magnetic-domains>

This of course leads to increased magnetic flux density within the material, as seen in the graph below. Unlike the other types of magnetisation covered, the effects in ferromagnetism are usually lasting. If the initial magnetisation (Neukurve) is strong enough to saturate the material (reaches $B_s$), its domains remain aligned and the magnetic flux $B_r$ (called *remanence* or *residual magnetism*) is present with no external $arrow(H)$ field - the material has been magnetized.

The same applies in the opposite direction, demagnetization occurs when an external magnetic field in the opposite direction is applied, after the point of *coercivity* $H_c$ (maximum opposing magnetic field before the material is demagnetized) is reached #footnote([The process of demagnetization is known as "Degaussing", some interesting applications are explained on Wikipedia.]). This forms the characteristic hysteresis curve.
#figure(
  image("images/ferromagnetisation.png", width: 40%),
) <fig-ferromagnetisation>

Ferromagnet flux density depends heavily on temperature and its previous state, hence the relationship between $arrow(B)$ and $arrow(H)$ is not linear and their relative permeability is only a rough approximation.

Materials with a high $H_c$ value are labeled as magnetically hard - they are used for producing permanent magnets or in applications such as magnetic tape storage, however they would be undesireable as the core of a transformer due to the large hysteresis energy losses.

The *Curie-Temperature* of a ferromagnetic material is the temperature at which it loses its magnetic properties due to overwhelming kinetic energy - around 770 $degree C$ for iron.

==== Permanent Magnets
Good permanent magnets have a very high coercivity value and high initial magnetisation (remanence).

=== Magnetic Field Boundary Conditions
As a magnetic field passes through the boundary of two materials, we can once again analyse the $arrow(H)$ and $arrow(B)$ fields using an infinitely small cylinder over the border and the normal $n$ and tangential $t$ components.

Gauss's magnetism law states $integral.surf_A arrow(B)dot d arrow(A) = 0$, hence:
$
  arrow(B_(n 1)) &= arrow(B_(n 2))\
  mu_1 arrow(H_(n 1)) &= mu_2 arrow(H_(n 2))\
$

Considering an infinitely thin loop at the boundary of the two materials (so only the tangential component plays a role), Ampere's circuital law states: $integral.cont arrow(H) d arrow(s) = 0$, so:
$
  arrow(H_(t 1)) &= arrow(H_(t 2))\
  arrow(B_(t 1)) / mu_1 &= arrow(B_(t 2)) / mu_2\
  mu_1 / mu_2 &= arrow(B_(t 1)) / arrow(B_(t 2))
$

These can be applied to calculate the angles from the normal $alpha$:
$
  (tan alpha_1) / (tan alpha_2) = arrow(H_(n 2)) / arrow(H_(n 1)) = arrow(B_(t 1)) / arrow(B_(t 2)) = mu_1 / mu_2
$

We can therefore make conclusions about the behaviour of fields at the boundary with a ferromagnet ($mu >> 1$):
- The tangential components $arrow(H_(t 2))$ and $arrow(B_(t 2))$ tend towards 0 at the surface of a ferromagnet
- To ensure $arrow(B)$ remains finite, $arrow(H) -> 0$ within a a ferromagnet.

=== Magnetic Circuits
Magnetic fields are confined within ferromagnetic loops and "conducted". This seems to be a result of the superposition of the resulting magnetisation field + applied magnetic field causing the domains to align in such a way that the superposed field navigates around curves. Although the boundary conditions imply that the normal component would be much higher than the tangential component as the lines exit into the air, the magnetic field lines already begin to curve earlier and they are effectively completely tangent to the outer boundary of the ferromagnet. LTD: These effects are best investigated in a simulation, not very clear in the diagram below

#figure(
  image("images/magnetic-circuit.png", width: 40%),
) <fig-magnetic-circuit>

Cross-sectional magnetic flux $Phi$ is analog to current in this model. In the above diagram, the magnetic flux must be the same at all cross-sections of the ferromagnet.

==== Magnetomotive Force
Just like electric potential difference, the work done on a hypothetical test North monopole by a magnetic field (although it's a hypothetical scenario and doesn't cause any actual movement) can be defined as:
$
  cal(F) = integral_(P 1)^(P 2) arrow(H) d arrow(s)
$

For a closed path through the diagram above, conforming to Ampere's law:
$
  integral.cont arrow(H) d arrow(s) = Theta = N I
$

Magnetic potential is defined analogous to absolute electric potential with some point as a zero reference.

==== Hopkinson's Law & Reluctance
In this model, a counterpart to Ohm's law can be defined:
$
  cal(F) = Phi cal(R)
$
Where $cal(R)$, the magnetic resistance / reluctance is defined in terms of the length, cross sectional area and magnetic permeability of a section of material:
$
  cal(R) = l / (mu A)
$

Magnetic conductivity is then defined as:
$
  Lambda = (mu A) / l
$

==== Magnetic Circuit Laws
Kirchhoff's laws hold true in this model, making it useful to analyse flux and magnetomotive force throughout a ferromagnetic circuit:
- Gauss's Law - $sum_"Node" Phi &= 0$
- Ampere's Law - $sum_"Loop" cal(F) &= integral.cont arrow(H) d arrow(s) = Theta$

Here's a nice table summarising the analogies in this model:
#figure(
  image("images/magnetic-circuit-summary.png", width: 80%),
) <fig-magnetic-circuit-summary>

=== Relativistic Magnetism
TODO: Causes for magnetism: special relativity + electrostatic force / magnetic dipole momements

LTD: Faraday Tensor
LTD: Derive Biot-Savart Law from Lorentz Transformation, Lorentz Force and Coulomb's Law

=== Magnetic Shielding
A closed high magnetic permeability cage can be used to redirect magnetic fields through itself.

For very sensitive applications, active shielding can be used with a hall sensor and solenoid feedback loop that actively generates opposing magnetic fields.

LTD:
- Meissner Effect
- Skin Effect

== Inductance
Just like capacitance, inductance is a measure of conductor's capability to store energy in magnetic fields with unit *Henry*:
$
  L = Phi / I
$
Where $Phi$ is the total magnetic flux of linked with a coil.

Inductors can be thought of as the magnetic equivalent of capacitance, however in practice they are less convenient for energy storage (current must be maintained in the "disconnected" state, wasteful unless in a superconductor) and are mainly used for filtering purposes.

=== Energy Stored by Inductors
Consider a superconducting coil with a current flowing through it. All energy initially dropped across the coil goes towards its magnetic field and thanks to its non-existing resistance, it maintains the current without any problems (as well as the arising flux $L I = Phi$). This current and therefore the energy stored may be initially induced by, for example, moving the superconductor within a magnetic field (work done against Lenz's law) or shortly connecting it to a power source.

This can be observed in superconductor levitation experiments, through which a current is induced as they are moved towards the permanent magnet, causing the repulsive force of the superconductor and permanent magnet below to be equal to its weight at some specific distance forever (well, until the superconductor leaves its critical temperature :P).

Using $V = L (d i)/(d t)$, $P = V I$ and integrating work done as the current reaches the target $I$, and assuming that the magnetic permeability of the inductors core remains constant as the current increases, we can derive the following formula for energy stored by an inductor:
$
  W = 1 / 2 L I^2 = 1 / 2 Phi I
$
where $Phi$ is the linked flux. This also includes the energy lost to the magnetisation of a ferromagnetic core.

Furthermore, we can determine the energy in integral form. By considering the self inductance of a toroid, we arrive at:
$
  W / V = integral_0^B arrow(H) d arrow(B)
$
The so-called *magnetic energy density*.

Using a volume integral, we can calculate the entire magnetic energy stored in a specific volume, for example the entire core of a toroidal inductor:
$
  W = integral.triple_V (integral_0^B arrow(H) d arrow(B)) d arrow(V)
$
If the magnetic permeability in the material remains constant (non-ferromagnetic core for example), we can simplify the energy density integral:
$
  integral_0^B arrow(H) d arrow(B) &= 1 / mu integral_0^B arrow(B) d arrow(B)\
  &= 1 / (2 mu) arrow(B)^2 = 1 / 2 arrow(H) dot arrow(B)
$
Therefore:
$
  W = 1 / 2 integral.triple_V arrow(H) dot arrow(B)space d arrow(V)
$

When considering the hysteresis curve of a ferromagnetic core, we can calculate the total energy stored / released as the inductor is attached to an alternating current source. This can be calculated by integrating over the energy density during storage / release of energy:
$
  integral_0^B arrow(H) d arrow(B) = integral_0^B x d y
$
#figure(
  image("images/magnetic-energy-hysteresis.png", width: 60%),
) <fig-magnetic-energy-hysteresis>
The difference between these two areas results in the energy lost to heat whilst magnetising / demagnetising the core. Visually, this is equal to the area enclosed by the hysteresis curve.


=== Inductance of Common Coils
It can be tricky to determine which surface exactly is "linked to a coil". In the case of a single loop of wire, the total flux can be calculated using the flux through the circular surface enclosed by the loop - similarly to Ampere's circuital law; if the loop contains several loops of wire, the linked flux can be imagined as spiraling upwards hence we multiply the flux through the enclosed area by N. For a toroidal coil with a ferromagnetic core, the vast majority of the flux flows through the core. Hence we can calculate the flux through a vertical cross section of the core $Phi_A$, multiplied by the number of turns $N$ (spiral-like surface).
#figure(
  image("images/flux-toroid.png", width: 40%),
) <fig-flux-toroid>
It is often unclear whether linked flux or simply the flux through the surface is meant, therefore some texts represent linked flux using $Psi$ or $lambda$. Linked flux is rigorously defined using Riemann surfaces (spiral surface enclosed by a coiled wire) and Stoke's Theorem in vector calculus (the line integral of a vector field over a loop is equal to the surface integral of its curl over the enclosed surface, ie sum of curl around the normals of the surface is a measure of how much the vector field promotes circulation - movement around the edge of the loop).

The following formulas assume the coils are wrapped around high permeability ferromagnetic cores, so the magnetic flux in the air is negligible and not accounted for.

Furthermore they do not take temperature or any previous magnetisation into account.

==== Toroid
The inductance of a toroid with radius $a$ to the inner wire, $b$ to the outer wire and height $h$ is:
$
  L approx (N Phi_"Loop") / I approx N^2 (mu h) / (2 pi) ln b / a
$
A simpler approximation for when the width of the ring is significantly smaller than the radius of the loop is:
$
  L = N^2 (mu h) / (pi) (b-a) / (b+a)
$

==== Parallel Wires
Two wires carrying the same current in opposite directions (can be thought of the same one in a stretched out loop with diameter b) can also store a significant magnetic field.

The linked flux is calculated in two parts for one wire with the help of the Biot-Savart law, then multiplied by 2 (their magnetic fields are symmetrical): the external and internal (within the wire itself) flux:
#figure(
  image("images/parallel-wire-inductance.png", width: 50%),
) <fig-parallel-wire-inductance>

The external flux of a single wire is:
$
  L_a = (mu_0 l) / (2 pi) ln b / a
$
And the inner flux:
$
  L_i = (mu l) / (8 pi)
$

Therefore the total inductance of the wires per unit length is:
$
  L / l = mu_0 / pi (1 / 4 + ln b / a)
$

For practical use:
$
  L / l = 1 (mu H) / m
$

=== Air Gap
Due to the hysteresis curve of ferromagnetic materials, if a coil reaches the point of saturation and becomes magnetised this reduces its subsequent permeability (gradient of the hysteresis graph), inductance and therefore ability to store *new* energy from the inducing current. Furthermore, it no longer behaves in a linear fashion.

This can be solved with a small air gap which avoids early saturation and therefore keeps the inductor linear and predictable for longer.

Using Hopkinson's Law:
$
  Phi &= Theta / ((l / (mu_r mu_0 A) + d / (mu_0 A)))\
  L &= (N Phi) / I = N^2 (mu_r mu_0 A) / (l +d mu_r)
$
Where $l$ is the length of the ferromagnetic core excluding the air gap. The gap $d$ should be as small as possible to prevent stray magnetic field at the junction (wasted energy).

Another advantage of the air gap is that it allows precise adjustments to the inductance value during the manufacturing process.

However, it does significantly increase the reluctance and therefore reduce the inductance - more windings are needed to compensate for this loss.

==== A-value
Ferromagnetic cores are sometimes assigned a value by manufacturers, so customers can wrap as many turns of wire as needed and for a target inductance:
$
  L = N^2 Lambda = N^2 A_L
$

=== Real-world Coils
Inductors appear in a variety of form factors optimised for their purpose:
#figure(
  image("images/real-inductors.png", width: 60%),
) <fig-real-inductors>
They can even be etched into PCBs with spiral traces; these are called planar coils.

The inductance of a single layer wrapped solenoid can be calculated using:
$
  L = N^2 (mu A) / l
$

The turn / inductance relationships for solenoids with different amounts of layers $w$ can be compared in this diagram:
#figure(
  image("images/multilayer-solenoid.png", width: 60%),
) <fig-multilayer-solenoid>
This shows that it's theoretically more efficient to use shorter solenoid coils achieve a higher inductance using roughly the same amount of wire (of course the radius increase slightly each time) layered over itself.

==== Parasitic Capacitance
Unfortunately this layering technique is not so effective in reality as it gives rise to parasitic capacitance.

Each turn of the coil drops a small potential difference and therefore there is a measurable capacitance between it and the next parallel turn. These capacitances are in parallel and can be modelled as a single capacitor for a given coil:
#figure(
  image("images/parasitic-capacitance.png", width: 60%),
) <fig-parasitic-capacitance>
This is especially noticable when winding in multiple layers, as turns with the highest potential differences lay directly on top of each other.

To reach a good middle-ground between inductance / wire used and minimising parasitic capacitance, inductors are often wound in chambers, where each section is fully wound before moving on to the next one:
#figure(
  image("images/chamber-winding.png", width: 10%),
) <fig-chamber-winding>

TODO:
- Effects in AC circuits
- Eddy currents, layered core, review 5.15.3

=== Inductor Networks
Inductor networks behave in the same way as resistors.

Inductors in series conduct the same current, therefore:
$
  L_"Total" &= Phi_"Total" / I = (I sum_(k=1) L_k) / I\
  &= sum_(k=1) L
$

The total inductance of inductors in parallel is:
$
  L_"Total" &= sum_(k=1) 1 / L_k
$
Intuitively, less current is going through each inductor hence they each store less energy as flux. The total inductance is smaller than the smallest inductor.

For two inductors in parallel:
$
  L_"Total" = (L_1 L_2) / (L_1 + L_2)
$

== Induction
Charges moving relative to a magnetic field experience a force, as detailed in Lorentz's force law, which can result in a potential difference across a conductor (see the Hall effect). When modelling this in terms of magnetic flux, we arrive at the following relationship, named *Faraday's Law of Induction*:
$
  U = -(d Phi) / (d t)
$
The voltage induced across a conductor is equal to the rate of change of linked magnetic flux.

In integral form for a wire looping around the surface $A$ N times (the same perpedicular flux goes through each loop once):
$
  integral.cont arrow(E) dot d arrow(s) = -(N d (integral.double_A arrow(B) dot d arrow(A))) / (d t)
$

The charges inside a conductor undergoing *moving induction* feel no resultant force; the Lorentz force due their relative velocity is equal to their electrostatic attractive force once a stable potential difference has been reached. This means that the net electric field through the conductor becomes 0 (as any new test charge would feel no force), and it does not contribute to the total voltage path integral.

Caution must be exercised when measuring voltages between points in an induced loop. Depending on if the voltmeter's leads enclose the changing flux, different measurements can occur between the same two points of the loop.
#figure(
  image("images/induction-voltmeters.png", width: 60%),
) <fig-induction-voltmeters>

=== Lenz's Law
Consider a homogenous magnetic field in space and a conductor connected to some load at a constant velocity such that the magnetic flux is at its maximum. With no air resistance or friction, the law of conservation of energy would be violated.

Hence Lenz's Law states:
"The current induced in a circuit due to a change in a magnetic field is directed to *oppose the change in flux*, for example by exerting a mechanical force which opposes the motion."

The direction of the induced current (and therefore also the direction of the voltage) can be determined using the Left Hand Rule.

Therefore a constant external force is required to maintain a velocity / change in magnetic flux and work continues being done - mechanical energy is transformed into electrical.

=== Self-induction and Back-EMF
Consider a loop connected to an alternating power supply. As current changes through the wire, the magnetic field of the wire itself gives rise to changing linked flux (through the area of the loop). Applying Faraday's law:
$
  (d Phi) / (d t) &= V_L
$
The voltage induced is in such a direction that a change in flux is opposed (Lenz's law) and is therefore called *back-EMF*.#footnote[It can be used to synchronize the phases of brushless motors.]

For example:
- Increasing current - $(d (I(t))) / (d t) > 0$ - The back EMF is in the same direction as that of a resistor, such that current ceases to increase and flux remains constant.
- Decreasing current - $(d (I(t))) / (d t) < 0$ - Back EMF in the same direction as voltage source, attempting to maintain current and flux, the energy stored in its magnetic field is released.
- Constant current - $(d (I(t))) / (d t) = 0$ - No induction occurs, no voltage across the inductor.

#figure(
  image("images/self-inductance.png", width: 60%),
) <fig-self-inductance>

Therefore the voltage between the terminals at time $t$ is:
$
  V &= R I(t) + V_L\
  &= R I(t) + (d Phi) / (d t)\
  &= R I(t) + (d (L I(t))) / (d t)\
  &= R I(t) + L (d (I(t))) / (d t)\
$
Inductance can therefore also be defined as the *coefficient of self-induction*:
$
  V_L = L (d (I(t))) / (d t)\
$

Intuitively, the inductance can also be considered as a measure of how much the geometry of a coil resists a change in current.

=== Inductive Coupling
When two coils induce a voltage upon one another they are said to be inductively coupled (Gegeninduktion) - the self-inductance of each coil + the induced voltage of the other coil's flux both play a role in the resulting back EMF, which can be calculated using the total rate of change of flux in each coil.

For example, we can determine the current in any of the loops for given voltage functions, inductances and resistances using the following differential equations:
#figure(
  image("images/inductive-coupling.png", width: 70%),
) <fig-inductive-coupling>
#figure(
  image("images/inductive-coupling-formula.png", width: 60%),
) <fig-inductive-coupling-formula>
In the above example, the self-induced flux and flux from the coupled loop are taken to be in the same direction - this is of course not always true but that will be solved by the polarity of the derivatives at a given time.

==== Mutual Inductance
In most cases, the mutual inductance depends purely on the geometry and materials of a system; the inductance of one inductor onto another is identical to the reverse relationship:
$
  L_(i k) = L_(k i) = M
$
where $i$ is the loop through which the flux is linked and $k$ is the loop who's current induces that flux (sometimes this is written using $M$).

The mutual inductance can of course be calculated in parts, for example for parallel wires.

===== Coupling Coefficients
This is a measure of how "coupled" a coil $i$ is with other coils in the system between 0 and 1, irrespective of how high the coil's induction actually is:
$
  k_i = Phi_(k i) / Phi_(i i)= M / L_(i i)
$
- Its maximum value, 1, occurs when the other coil is essentially in the same position with the same dimensions of coil $i$, meaning its entire self-induced flux also flows through the other coil's linked surface.

A mutal-inductive system of two coils can in turn be described by a single coupling coefficient:
$
  k = plus.minus sqrt(k_1 k_2) = M / sqrt(L_11 L_22)
$

==== Energy Stored in Coupled System
Using a similar derivation as when calculating the energy stored by a single inductor, integrating one current increasing at a time and setting each total energy as eqaul, we arrive at the following formula for the energy stored in an inductively coupled system:
$
  W = 1 / 2 L_11 I_1^2 + M I_1 I_2 + 1 / 2 L_22 I_2^2
$
The energy stored by the mutual inductance flux alone only appears once which makes intuitive sense, it is "the same" magnetic field after all...

This can be generalised for a system of $n$ coils:
$
  W = 1 / 2 sum_(i = 1)^n sum_(k = 1)^n L_(i k) I_i I_k
$

=== Generators / Motors
These can be used to convert between mechanical and electrical energy.

Consider a coil with N loops in an external, homogenous magnetic field, starting such that the normal of its enclosed area and magnetic field are pointing in the same direction, then rotating with angular velocity $omega$:
#figure(
  image("images/generator-diagram.png", width: 60%),
) <fig-generator-diagram>

The linked magnetic flux at any point in time can be represented as:
$
  Phi(t) = N integral.double_A arrow(e_x) B dot d arrow(A) = N B A cos(phi) = hat(Phi) cos(omega t)
$
Where $hat(Phi)$ is the amplitude (peak linked flux when $phi = 0$). These relationships must of course be adjusted carefully for a different starting angle / direction of magnetic field.

Using Faraday's Law of Induction:
$
  V(t) = - (d Phi(t)) / (d t) = omega hat(Phi) sin(omega t)
$
Such that the peak induced voltage is:
$
  hat(V) = omega hat(Phi) = N B A omega
$
#figure(
  image("images/generator-phase-difference.png", width: 60%),
) <fig-generator-phase-difference>
The phase difference between linked flux and voltage is $pi/2$.

_Rotor_ - The moving part of the generator / motor\
_Stator_ - Stationary part

More complex arrangements of the rotor and stator can reduce friction and improve efficiency + reliability, but they all work on the same principle. Serious industrial generators usually have 1000s of windings to reach the high voltages required for power transmission and electromagnets are used instead of permanent, allowing control over when the magnetic field is at its highest in synchronisation with the windings.

TODO: Calculate resistive moment and input energy in terms of moment

==== 3-Phase Induction
In practice, 3 coils at $(360 degree)/3=120 degree = (2 pi) / 3$ angles to each other are often used in generators / motors:
#figure(
  image("images/three-phase.png", width: 60%),
) <fig-three-phase>
Their voltages can be described in terms of the same angular frequency as:
$
  V_1(t) = hat(V) sin(omega t)\
  V_2(t) = hat(V) sin(omega t - (2pi)/3)\
  V_3(t) = hat(V) sin(omega t - (4pi)/3)\
$
Often magnetic dipole(s) are used as the rotor and the 3 coils remain stationary around the stator instead, for example in brushless AC motors.
#figure(
  image("images/brushless-motor.png", width: 40%),
) <fig-brushless-motor>
In this case, the coordinated 3 phase currents ($prop V$) create a circulating magnetic field and thus a moment on the dipole causing it to turn.

===== Advantages
3-Phase power circuits are drawn as below:
#figure(
  image("images/three-phase-star.png", width: 60%),
) <fig-three-phase-star>
The coils are often connected to a common reference point using the same returning Neutral wire, which saves half of the wire needed if each coil was connected to its load separately.

Furthermore, if they each have the same load, the total current returning on the Neutral wire is 0 (unless something broke) meaning we can completely remove it and save even more wire (and potential power losses considering how long power grid wires are):
$
  i_1 + i_2 + i_3 &= (v_1 + v_2 + v_3) / R= hat(i)[sin(omega t) + sin(omega t - (2pi)/3) + sin(omega t - (4pi)/3)]\
  &= 0
$

Another interesting property is the potential difference between the ends of any two 3-phase coils with a common ground. Using the $sin$ sum identity, we can calculate $u_12$:
$
  u_12 = sqrt(3) hat(V)sin(omega t + pi/6)
$
The maximum voltage is $sqrt(3) times$ higher!

Alternatively, coils can be connected as below:
#figure(
  image("images/three-phase-triangle.png", width: 60%),
) <fig-three-phase-triangle>
In this case, the voltages across each load is the same and the maximum currents $i_k$ are $sqrt(3) times$ higher (if the loads are identical).

=== Transformers
_Galvanically Isolated_ - No current flow is possible between two sections of a circuit, however energy / information may still be exchanged through induction, optically, etc. The two systems may have different ground potentials.

A transformer consists of at least two inductively coupled coils for the purposes of adjusting voltage / current or simply transferring information between two galvanically isolated systems.

The coils are usually wrapped around the same ferromagnetic core with $mu_r >>1$ to minimize stray magnetic fields. A resistor in series can be used to model the voltage lost over the coils (excluding self-inductance). In an ideal transformer, the power through the primary coil is equal to the secondary coil.

TODO: Reducing lost energy in core

We can now construct equations for the induced voltage / current in the secondary coil. The direction of the current induced in the secondary coil is always such that its self-induced flux opposes the change in flux from the primary coil. Therefore the directions of flux and currents are as follows:
#figure(
  image("images/transformer-diagram.png", width: 60%),
) <fig-transformer-diagram>

Therefore the inductive coupling equations:
$
  u_0 = R_1 i_1 + L_11 (d i_1) / (d t) - M (d i_2) / (d t)\
  0 = R_2 i_2 - M (d i_1) / (d t) + L_22 (d i_2) / (d t)\
$

Where the inductances can be calculated using the average path length around the core $l$ as:
$
  L_(i i) = N_i^2 (mu A) / l\
  M = N_1 N_2 (mu A) / l
$
Solving for the transformed voltage $u_2$ in terms of the alternating voltage $u_1$ (after resistive losses) across the secondary coil by substituting the inductances $L_(i i)$ & $M$ in terms of $N_i$ and performing elimination:
$
  u_1 = hat(u) cos(omega t)\
  u_2 = -N_2 / N_1 u_1\
  i_1 = 1 / (omega L_11) hat(u) sin(omega t) + N_2 / N_1 i_2\
  i_2 = N_2 / (N_1 R_2) u_1
$
The transformed voltage $u_2$ is in antiphase to $u_1$ and its amplitude depends on the ratio of primary to secondary windings. The so-called *turn ratio* $dot.double(u)$ is used to describe a given transformer:
$
  dot.double(u) = N_1 / N_2 = hat(u_1) / hat(u_2) = hat(i_2) / hat(i_1)\
  u_1 i_1 = u_2 i_2
$
This allows us to calculate the number of turns needed for a desired ideal voltage / current.

==== Transformer Circuit Diagrams
By adding the rows of our coupling system of equations to each other, we arrive at the following replacement circuit for an ideal transformer with identical behaviour (apart from the galvanic isolation) allowing us apply Kirchoff's Laws and other tools in circuit analysis:
#figure(
  image("images/t-transformer-circuit.png", width: 60%),
) <fig-t-transformer-circuit>
The blue dots in transformer circuit diagrams are chosen such that the potential difference between the terminal with a point and without a point has the same polarity in both coils at all times (depending on how the coils were winded). In other words, it represents the synchronised direction of current.

The terminal initially chosen for the blue dot in the primary coil is arbitrary, although it is usually the one into which the chosen "positive" current direction flows in to.

Alternatively, the following circuit symbol is commonly used to represent transformers:
#figure(
  image("images/transformer-circuit.png", width: 40%),
) <fig-transformer-circuit>

An ideal transformer with perfect efficiency is represented using a "vertical equals sign". These conventions are summarised in the figure below:
#figure(
  image("images/ideal-transformer-circuit.png", width: 60%),
) <fig-ideal-transformer-circuit>
Notice that the "positive" current direction in the two sections can be chosen as convenient - the blue dots simply indicate the relationship between the sections over time.

===== Generic Transformer Circuit
A highly flexible circuit can be used to represent a real-world transformer:
#figure(
  image("images/generic-transformer.png", width: 60%),
) <fig-generic-transformer>
- The ideal transformer symbol has been added on the right to highlight that the two circuits are galvanically isolated.
- $dot.double(u)$ is free to choose (to simplify certain types of analysis) and does not represent the actual turn ratio of the transformer; the inductance values are adjusted so that the model continues to function accurately. For example, if $dot.double(u) = 1$ is chosen this becomes the T shaped inductor circuit in @fig-t-transformer-circuit.
- The resistors in series represent the resistance of the two coils, the parallel resistor in the middle represents losses within the core. These can vary heavily depending on the material, frequency and even the waveform.

LTD: Review streuung

==== Load Resistance
As seen in @load-power, the maximum useful power output is possible when the load and internal resistance are equal. A transformer can be useful to adjust the relationship between internal resistance $R_1$ and load resistance $R_2$:
$
  R_1 = u_1 / i_1 = dot.double(u)^2 R_2
$
#figure(
  image("images/resistance-transformation.png", width: 60%),
) <fig-resistance-transformation>
By chosing a suitable turn ratio $dot.double(u)$, we can optimize an AC power source's maximal output (as long as we are able to make use of the changed secondary coil voltage).

==== Autotransformer
If galvanic isolation is not needed, a cheaper and more efficient transformer can be built using a single coil around a core with a terminal point at some point along the coil. The following diagram steps up a voltage as the changing magnetic flux enters through more turns in the secondary terminals as across the primary terminals:
#figure(
  image("images/autotransformer.png", width: 40%),
) <fig-autotransformer>

The turn ratio equations still apply:
$
  hat(u_1) / hat(u_2) = hat(i_2) / hat(i_1) = N_1 / (N_1 + N_2)
$

To step down a voltage, the terminals can simply be reversed:
$
  hat(u_1) / hat(u_2) = hat(i_2) / hat(i_1) = (N_1 + N_2) / N_1
$

== Maxwell's Equations
Overview, differential form, curl, divergence etc, attempt to understand and derive notation + convert between integral and differential forms

https://www.youtube.com/watch?v=rB83DpBJQsE

Link to EM waves

TODO:
- EM Duality concept https://en.wikipedia.org/wiki/Duality_(electricity_and_magnetism)
