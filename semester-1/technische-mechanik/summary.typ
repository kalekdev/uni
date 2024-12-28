#import "@preview/cram-snap:0.2.1": cram-snap, theader

#set page(
  paper: "a4",
  flipped: true,
  margin: 1cm,
)

#show: cram-snap.with(title: [Technical Mechanics], column-number: 3, icon: image("images/icon.png"))

#table(
  theader[Trigonmetric Identities],
  $sin(-theta)$, $-sin(theta)$,
  $cos(-theta)$, $cos(theta)$,
  $tan(-theta)$, $-tan(theta)$,
  $sin(pi/2-theta)$, $cos(theta)$,
  $cos(pi/2-theta)$, $sin(theta)$,
  $tan(pi/2-theta)$, $cot(theta)$,
  $sin(pi-theta)$, $sin(theta)$,
  $cos(pi-theta)$, $-cos(theta)$,
  $tan(pi-theta)$, $-tan(theta)$,
  $sin(theta plus.minus pi/2)$, $plus.minus cos(theta)$,
  $cos(theta plus.minus pi/2)$, $minus.plus sin(theta)$,
  $sin(theta plus pi)$, $-sin(theta)$,
  $cos(theta plus pi)$, $-cos(theta)$,
  $sin(alpha plus.minus beta)$, $sin alpha cos beta plus.minus cos alpha sin beta$,
  $cos(alpha plus.minus beta)$, $cos alpha cos beta minus.plus sin alpha sin beta$
)

#table(
  table.header(
    [deg / rad],
    $30 degree \/ (pi / 6)$,
    $45 degree \/ (pi / 4)$,
    $60 degree \/ (pi / 3)$,
    $90 degree \/ (pi / 2)$,
  ), columns: 5,
  [sin], $1 / 2$, $1 / sqrt(2)$, $sqrt(3) / 2$, $1$,
  [cos], $sqrt(3) / 2$, $1 / sqrt(2)$, $1 / 2$, $0$,
  [tan], $1 / sqrt(3)$, $1$, $sqrt(3)$, $-$,
)

#table(
  theader[Vector Identities], columns: 3,
  $arrow(a) times arrow(b)$, $norm(a) norm(b) sin(theta) arrow(n)$, [Area of parallelogram],
  $arrow(a) times (b + c)$, $arrow(a) times arrow(b) + arrow(a) times arrow(c)$, [],
  $a dot (b times c)$, $b dot (c times a)$, $c dot (a times b)$
)

#table(
  theader[Calculus Rules], columns: 2,
  $(d y) / (d x)$, $(d y) / (d u) (d u) / (d x)$,
  $(d (u v)) / (d x)$, $u (d v) / (d x) v (d u) / (d x)$,
  $arrow(v)$, $d(arrow(r)) / (d t)$,
  $omega$, $(d Theta) / (d t)$
)

TODO: Add acceleration formulae!

#table(
  theader[Cartesian Coordinates], columns: 2,
  $arrow(r)$, $x e_x + y e_y + z e_z$,
  $arrow(v)$, $dot(x) e_x + dot(y) e_y + dot(z) e_z$
)

#table(
  theader[Cylindrical Coordinates], columns: 2,
  $arrow(r)$, $rho e_rho + z e_z$,
  $arrow(v)$, $dot(rho) e_rho + rho dot(phi) e_phi + dot(z) e_z$,
  $e_rho$, $cos(phi)e_x + sin(phi)e_y$,
  $e_phi$ , $d(e_rho) / (d phi) = -sin(phi)e_x + cos(phi)e_y$,


  $(d e_phi) / (d phi)$, $-cos(phi)e_x - sin(phi)e_y = -e_rho$,
  $(d e_rho) / (d phi)$, $e_phi$,

  $dot(e_phi)$, $-dot(phi) e_rho$,
  $dot(e_rho)$, $dot(phi)e_phi$
)

== Rigid Bodies
$
  forall P, Q in kappa\
  abs(r_(P Q)) = abs(r_Q - r_P) = "Constant"
$

=== SdpG
$
  e = (r_Q-r_P) / abs(r_Q-r_P)\
  arrow(v_Q) dot e_(P Q) = arrow(v_P) dot e_(P Q) \
  v'_Q = v'_P\
$

=== Movement across a plane
- All velocities are parallel to the plane
- All points along a normal to the plane have the same velocity
- Either a translation or a rotation at any point in time

#table(
  theader[Types of Movement (2D)], columns: 2,
  [Translation], $forall P, Q in kappa^2 | v_P = v_Q$,
  [Rotation], $exists P, Q in kappa^2 | v_P != v_Q, omega_P = omega_Q$
)

_Center of Rotation_ - intersection of all lines perpendicular to the velocities of points.

_Rollen ohne Gleiten_ - Center of rotation is at the point of contact with the ground

$
  arrow(v_P) = (omega e_z) times arrow(r_(C P))\
  "Scalar": arrow(v_P) = omega d
$

$arrow(omega)$ - Unit vector in the direction of axis of rotation, so that positive rotation is anti-clockwise.

=== Movement in 3D space
- Simultaneous translation & rotation possible as "schraubung".

_Rotation Axis_ - $forall P, Q in arrow(e_"axis") lambda, v_P = v_Q$

TODO: Parametric equation of points along the rotational axis

=== Starrkörperformel
$
  arrow(v_P) = arrow(v_B) + arrow(omega) times arrow(r_(B P))
$
Every point in a rigid body rotates around every other point in the body with the same angular velocity.

#table(
  theader[Invariants of motion in space], columns: 2,
  $I_1 = arrow(omega) forall P in kappa$, [Current angular velocity same regardless of the reference point],
  $I_2 =arrow(omega) dot v_P forall P in kappa$, [Component of velocity in the direction of the rotation axis is the same for all points in the body. Called "Translation velocity"],
)

*Kinemate*: ${arrow(v_B), arrow(omega)}$

#table(
  theader[Types of Movement (3D)], columns: 2,
  [Translation], $arrow(omega) = 0 forall P in kappa$,
  [Kreiselung], $arrow(omega) eq.not 0 and I_2 = 0 therefore exists P in kappa | v_P = 0$,
  [Schraubung], $I_2 eq.not 0$
)

== Degrees of freedom
Minimum number of coordinates to clearly determine the state of a system.

$
  f = n -b
$
#image("images/degrees-of-freedom.png")
IMPORTANT: The joint at a roller / pivot must be accounted for too! (using the n-Gelenk formula)
#image("images/degrees-of-freedom-joints.png")
b-value for slider depends on how it's connected, usually 1

== Forces
$
  sum "Inner Forces" = 0
$

=== Static Equivalence
$
  cal(P)_"tot" (G_1)= cal(P)_"tot" (G_2)
$

Therefore in a rigid body:
$
  R_1 = R_2\
  (M_B)_1 = (M_B)_2
$
Furthermore, two forces are equivalent if they have the same magnitude and line of action.

Forces with lines of action going through the same point have only a resultant force - no moment:
#grid(
  columns: (auto, auto),
  align: horizon,
  image("images/zero-moment.png", width: 60%),
  $
    M_P = 0, R != 0
  $,
)

== Moments
A moment is a concept for describing the capacity of a force to rotate an object around an arbitrary center of rotation with units $N m$.

The moment of a force around the center of rotation O in vector form is:
$
  M_O = arrow(r_(O P)) times arrow(F)
$
The resulting moment lies along the axis of rotation and describes the angular direction of the rotation caused by the moment.

Alternatively, it can be expressed as a scalar with the perpendicular distance from the line of action of F to O: $d$:
$
  M_O = d F
$

=== Transformation of moments
The moment of a force can be transformed with respect to a different point using the following formula:
$
  M_A = M_B + r_(A B) times R
$

=== Torque
Perpendicular distance between lines of action $d$:
$
  R = 0\
  M_P = d F
$

Whenever the resultant force is 0, the moment around all points in the body is the same.

=== Dynamic
The dynamic of a force group with respect to a point O describes the entire set of forces on the body:
$
  {R, M_O}
$
Where $R$ is the resultant force and $M_O$ is the resultant moment around O: $sum arrow(r_(O P_i)) times arrow(F_i)$

The following invariants apply to the dynamic:
- $I_1 = R forall P in kappa$
- $I_1 = R dot M_O forall P in kappa$ - the component of the resultant in the direction of the moment with respect to the same point is the same for all points

== Power
The rate of transfer of energy.

Due to the work done by a force $integral_c arrow(F) d arrow(s)$, the power exerted by a force at a point in time can be expressed as:
$
  cal(P) = arrow(F) dot arrow(v)
$

- _Accelerating force ($pi/2 < alpha <= pi$)_ - A force with a positive component in the direction of the velocity is contributing kinetic energy to the object and increasing the power
- _Braking Force ($0 < alpha < pi/2$)_ - Reduces the kinetic energy of the object
- A force perpendicular to the velocity of an object does not contribute to its power until the object begins moving with a component in the direction of the perpendicular force.

=== Total power of a rigid body
The total power of an object is the sum of powers for each force acting on the body:
$
  cal(P)_"tot" = sum_(i = 1)^n arrow(F_i) dot arrow(v_i)
$
When the kinematic ${v_B, omega}$ and dynamic ${R, M_B}$ with respect to a point B are known, we can calculate the total power thanks to the rigid body formula and the "pacman" identity:
$
  cal(P)_"tot" = R dot v_B + M_B dot omega
$

== Parallel Forces
When all forces acting on a body point point in the same direction, they can be written as:
$
  arrow(F_i) = F_i arrow(e)
$
Where $arrow(e)$ is the unit vector of their common direction.

The dynamic with reference to a point O is:
$
  R &= sum arrow(F_i) = arrow(e) sum F_i \
  M &= sum arrow(r_i) times arrow(F_i) = sum arrow(r_i) F_i times arrow(e)
$
The sum $sum arrow(r_i) F_i$ is called the dipole moment (sometimes written as $N$) of a set of parallel forces. It is independent of the point O, as long as it's consistent for each force included.

=== Center of Forces
This is the point on which a pivot can be placed and no resultant moment would act on the body. In other words, an equal and opposite resultant force can act on this point resulting in a net 0 dynamic.

It is unique to a dipole moment, the direction of $arrow(e)$ is irrelevant (although gravity always acts in the same direction, so in practice this fact isn't too important).

The position vector of the center of forces from the point O can be calculated using a dipole moment with *the same point O* as its origin:
$
  r_(O C) = (sum arrow(r_i) F_i) / (sum F_i)
$

For a dipole moment with the specific direction of the forces $arrow(e)$, an entire line can serve as a center of forces:
$
  arrow(r_(O C))(lambda) = arrow(r_(O C)) + lambda arrow(e)
$

=== Center of Mass
This is the average location of all the weight of an object. It can be calculated using a volume integral over the density of the body:
#figure(
  image("images/centre-of-mass.png", width: 80%),
) <fig-centre-of-mass>
Where $d m$ is effectively the density at the point of each differential.
#figure(
  image("images/com-examples.png", width: 60%),
) <fig-com-examples>

Integration is a linear transformation - a center of mass can be calculated as the sum of separate integrals (which of course can also be negative):
$
  arrow(r_(O C)) = (sum integral.vol arrow(r) d m) / (sum m_i)
$
#figure(
  image("images/combine-com.png", width: 80%),
) <fig-combine-com>
LTD: Check general formula
$
  arrow(r_C) = (sum m_i arrow(r_(C i))) / (sum m_i)
$

== Rest
A system is at rest when all of its velocities are 0.
- Instantaneous rest - $arrow(v_p) = 0 forall p in kappa | t = t_0$
- State of rest - $arrow(v_p) = 0 forall p in kappa, forall t$

=== Fundamental Theorem of Statics
This also means that the resultant force and moment around any point (the moment is always the same if $R=0$) is 0:
$
  arrow(R) = 0\
  arrow(M) = 0
$

Constraints exert equal and opposite forces to prevent an object moving through them.

Forces in a system at rest with multipled bodies can be solved by including forces at constraints:
#figure(
  image("images/multiple-bodies-rest.png", width: 80%),
) <fig-multiple-bodies-rest>
These systems of equations can be solved through Gaussian elimination.

=== Virtual Motion
A system can be modelled as in virtual motion when virtual velocities are modelled at each point, such that the total power of constraint forces is 0:
#figure(
  image("images/virtual-motion.png", width: 80%),
) <fig-virtual-motion>
- For example, velocity at the slider is perpendicular to its constraint force, and equal and opposite constraint forces at joints cancel each other's accelerating and braking power out.
- There can be no virtual velocity at a pivot, as it exerts constraint forces in both the x and y component - they are orthogonal and the power of this force would never be 0.
- There can however exist a rotational velocity around a pivot.

These virtual velocities, denoted as $tilde(v)$ can be found using techniques in the kinematics of rigid bodies.

==== Theorem of Virtual Power
A system is at rest when the virtual total power is 0 for every virtual state of motion:
$
  cal(P)_"tot" = sum_(i = 1)^n arrow(F_i) dot tilde(v_i) = 0
$

This is useful to calculate a few external / constraint forces, by strategically allowing virtual motion which involves that force. Other forces with and equal and opposite reaction can be ignored as the resultant at that point is 0.

If many forces in a system are needed, then a full analysis using the theorem of statics is more appropriate.

==== Framework
The constraints in a framework can be calculated by removing one of the rods, whose compression (or tension, this becomes apparent if a negative value is calculated) is acting as a constraint force.

LTD: Force cut

==== Power of Torque
It is useful to solve statics problems with pulleys using the virtual power of a torque (the cable around a pulley has the same tension throughout):
$
  cal(P) = arrow(omega) dot arrow(M)
$
As usual in a torque, the origin of the moment is irrelevant.

LTD: Do not assume all tensions are equal in pulleys exam!
