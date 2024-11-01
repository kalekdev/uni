#heading(outlined: false)[Technische Mechanik]

#outline()

_Kinematiks_ - How a model is currently at motion without concern for the causes (forces)\
_Statics_ - Which conditions (forces & moments) are needed to keep a system at
rest\
_Dynamics_ - Which conditions are needed to create movement in a system in a
certain way\

Vector Identities:\
$arrow(a) times (b + c) = arrow(a) times arrow(b) + arrow(a) times arrow(c)$\
$a dot (b times c) = b dot (c times a) = c dot (a times b)$ (Pacman Identity)

Notation:\
$kappa$ - Set of all points in a body\
_Time derivative_ - $dot(x) = (d y) / (d t)$\

#pagebreak()

== Coordinate Systems
Orthogonale Koordinatensystemen:
$
  "Cartesian:" e_x times e_y &= e_z\
  "Cylindrical:" e_rho times e_phi &= e_z
$

Position Vectors:
$
  "Cartesian:" bold(r) &= x e_x + y e_y + z e_z\
  "Cylindrical:" bold(r) &= rho e_rho + z e_z
$
There is no separate $e_phi$ component in a cylindrical position vector, as it's already accounted for by the changing $e_rho$ unit vector. The following relations are useful for calcutions in the cylindrical co-ordinate system:
$
  "Wegen des Einheitskreises:" e_rho &= cos(phi)e_x + sin(phi)e_y\
  "Intuitiv:" e_phi &= d(e_rho) / (d phi) = -sin(phi)e_x + cos(phi)e_y \
  d(e_phi) / (d phi) &= -cos(phi)e_x - sin(phi)e_y = -e_rho "(Centripetal acceleration!)"\
  d(e_rho) / (d phi) &= e_phi\
$
The time derivatives can be found by deriving the cartesian formulae with respect to time and doing some substitution:
$
  d(e_phi) / (d t) = -dot(phi) e_rho\
  d(e_rho) / (d t) =dot(phi)e_phi\
$
Thus the velocity formula in the cylindrical co-ordinate system:
$
  arrow(v) &= dot(rho) e_rho + rho dot(phi) e_phi + dot(z) e_z
$

== Rigid bodies
A body in which deformation is negligible. There are no ideal rigid bodies in real life.

Let $P, Q$ be points in a rigid body
$
  forall P, Q in RR^3, abs(bold(r_Q) - bold(r_P)) = "Constant"
$

=== Satz der Projizierten Geschwindigkeiten
The velocities of any two points in a rigid body projected on the vector between them is always the same. This means the body is not getting shorter or longer (deforming).\
Useful for determining the velocities of points on rigid bodies with relation to each other.
$
  arrow(v_Q) dot e = arrow(v_P) dot e\
  "wo" e = (r_Q-r_P) / abs(r_Q-r_P)
$

$arrow(v_A) dot e = v'_A$ = Velocity of A projected onto the vector alongside a rigid body.

_Translation_ - for all points $P, arrow(v_P)$ is equal

== Movement across a plane
- All velocities are parallel to a certain plane
- All points along a normal to the plane have the same velocity
- It is either a translation or a rotation at any point in time

=== Rotation
If at least two points in a rigid body do not have the same velocity, it is currently rotating. The momentary, static center of rotation is the intersection of lines perpendicular to the velocities of two points. All points rotate around the center with the *same angular velocity* $omega$.

Considering a point with vector $arrow(r_P)$ from the center of rotation, rotating with angular velocity $omega = (d Theta)/(d t)$. Its velocity vector can be determined as:
$
  arrow(v_P) = (omega e_z) times arrow(r_P)
$
The unit vector $e_z$ is simply needed so the resulting direction is anticlockwise (for a positive $omega$) and perpendicular to $arrow(r_P)$.

_Polbahn_ - The path traced by the series of momentary centers of rotation of a rigid body.

== Movement in space
In 3D space, simultaneous translation & rotation is possible due to the extra dimension.

_Rotation Axis_ - The body rotates around an entire axis instead of a single point. The velocity of all points on this axis are the same and equal to the object's overall translational velocity. $arrow(omega)$ is defined as the unit vector in the direction of the axis times the angular velocity: $arrow(omega) = omega arrow(e_r)$

LTD: Parametric equation of points along the rotational axis

=== Starrkörperformel
The following extremely useful formula can be used to link the unique angular velocity vector to the velocity of any two points in a rotating body:#footnote("Derivation available in the 5th Powerpoint of Dr. P Tiso")
$
  arrow(v_P) = arrow(v_B) + arrow(omega) times arrow(r_(B P))
$
This essentially shows that every point in a rigid body rotates around every other point in the body with the same angular velocity.

The following properties of movement in space are constant and called "Invariants":
1. $I_1 = arrow(omega) forall P in kappa$ - The angular velocity is the same regardless of the reference point
2. $I_2 =arrow(omega) dot v_P forall P in kappa$ - The component of the velocity of a point in the direction of the rotation axis is the same for all points in the body. This is the translation velocity of the body.

Therefore the momentary movement of any point in the body can be described with just two values called the *Kinemate*: ${arrow(v_B), arrow(omega)}$

TODO: Test these in a simulation :)

_Schraubung_ - The combination of a rotation with a translation in the direction of the rotation axis

Types of movement in space:
+ Translation: $arrow(omega) = 0$
+ Rotation: $arrow(omega) eq.not 0 and I_2 = 0$
+ Schraubung: $I_2 eq.not 0$

TODO in lernphase: Understand Rechteck Beispiel in script

== Degrees of freedom
The minimum number of coordinates (in an arbitrary optimal coordinate system for this specific system) to clearly determine the state of a system. This could for example be the location of a slider and the angle at which a rod is attached to it (much more concise than for example the cartesian coordinates of the slider and the other end of the rod).

Considering a system with several bodies. For a sum of degrees of freedom of $n$, and $b$ restricted degrees of freedom due to connections, the resulting degrees of freedom of the whole system is:
$
  f = n -b
$
#image("images/degrees-of-freedom.png")
#image("images/degrees-of-freedom-joints.png")

== Forces
_Force_ - An influence that can cause an object's velocity to change. It is a vector quantity applied at an attack point. The line through the attack point in the direction of the force is called the line of action.

In reality, there are 4 fundamental forces (electromagnetic, gravitational, weak and strong nuclear) but in many practical applications we consider integral values such as contact forces and friction.

=== Newton's Laws of Motion
Published in his 1687 paper Principia, these laws describe the motion of all objects and continue to serve as the foundations of classical mechanics in the modern day.

1. An object remains at rest or in motion at a constant speed unless acted on by an external force.
2. The resultant force acting on a body is the rate of change of the momentum of the object:
$
  F = (d bold(P)) / (d t) = m bold(a)
$
3. Every action results in an equal and opposite reaction. This can also be used to show the conservation of linear momentum.

LTD: Lagrangian mechanics

=== Inner vs outer forces
Every inner force in a system exists in a pair with its corresponding reaction force. Forces without a corresponding reaction are so called _external forces_.
$
  sum "Inner Forces" = 0
$

=== Force groups
The set of forces acting on a body is known as the force group.

Two force groups are statically equivalent when:
$
  cal(P)_"tot" (G_1)= cal(P)_"tot" (G_2)
$

=== Static equivalence in a rigid body
Due to the total power of a rigid body formula (see power), static equivalence in a rigid body requires:
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
  M_A = M_B + r_(A B) times F
$

=== Torque
A torque (also known as couple) is a pair of moments with respect to the same point with equal magnitude $F$ and opposite direction. Considering the perpendicular distance between their lines of action $d$, these result in:
$
  R = 0\
  M_P = d F
$

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
- _Braking Force ($0 < alpha < pi/2$)_ - Reduces the power of the object and its forces.
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


LTD:
- I would love to define all the fundamental building blocks of physics such as energy, velocity, acceleration etc. but I'm worried this will make these notes too verbose with information anyone reading them has already mastered, and I'll spend valuable time going further down the Wikipedia rabbit hole...
- Rotational momentum / Feynman or University Physics
