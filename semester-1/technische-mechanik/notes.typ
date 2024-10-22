#heading(outlined: false)[Technische Mechanik]

#outline()

_Kinematiks_ - how a model is currently at motion\
_Statics_ - Which conditions (forces & moments) are needed to keep a system at
rest\
_Dynamics_ - Which conditions are needed to create movement in a system in a
certain way\

$arrow(a) times (b + c) = arrow(a) times arrow(b) + arrow(a) times arrow(c)$\
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
There is no separate $e_phi$ component in a cylindrical position vector, as it's already accounted for by the $e_rho$ unit vector. The following derivatives are useful for calcutions in the cylindrical co-ordinate system:
$
  "Wegen des Einheitskreises:" e_rho &= cos(phi)e_x + sin(phi)e_y\
  "Intuitiv:" e_phi &= d(e_rho) / (d phi) = -sin(phi)e_x + cos(phi)e_y \
  d(e_phi) / (d phi) &= -cos(phi)e_x - sin(phi)e_y = -e_rho\
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
  abs(r_Q-r_P) = "Konst" forall P, Q in RR^3 -> arrow(v_Q) dot e = arrow(v_P) dot e\
  "wo" e = (r_Q-r_P) / abs(r_Q-r_P)
$

$arrow(v_A) dot e = v'_A$ = Velocity of A projected onto the vector alongside a rigid body.

_Translation_ - for all points $P, arrow(v_P)$ is equal

== Movement across a plane
- All velocities are parallel to a certain plane
- All points along a normal to the plane have the same velocity
- It is either a translation or a rotation at any point in time

=== Rotation
If at least two points in a rigid body do not have the same velocity, it is currently rotating. The momentary, static center of rotation is the intersection of lines perpendicular to the velocities of two points. The points rotate around the center with the *same angular velocity* $omega$.

Considering a point with vector $arrow(r_P)$ from the center of rotation, rotating with angular velocity $omega = (d Theta)/(d t)$. Its velocity vector can be determined as:
$
  arrow(v_P) = (omega e_z) times arrow(r_P)
$
The unit vector $e_z$ is simply needed so the resulting direction is perpendicular to $arrow(r_P)$.

_Polbahn_ - The path traced by the momentary center of rotation of a rigid body.

== Movement in space
In 3D space, simultaneous translation & rotation is possible due to the extra dimension.

=== Starrkörperformel
The following extremely useful formula can be used to link the unique angular velocity vector to the velocity of any two points in a rotating body:#footnote("Derivation available in the 5th Powerpoint of Dr. P Tiso")
$
  arrow(v_P) = arrow(v_B) + arrow(omega) times arrow(r_(B P))
$

The following properties of movement in space are constant and called "Invariants":
1. $I_1 = arrow(omega)$ - The angular velocity is the same regardless of the reference point
2. $I_2 =arrow(omega) dot v_P forall P in kappa$ - The component of the velocity of a point in the direction of the rotation axis is the same for all points in the body

TODO: Test these in a simulation :)

_Schraubung_ - The combination of a rotation with a translation in the direction of the rotation axis

Types of movement in space:
+ Translation: $arrow(omega) = 0$
+ Rotation: $arrow(omega) eq.not 0 and I_2 = 0$
+ Schraubung: $I_2 eq.not 0$

TODO in lernphase: Understand Rechteck Beispiel in script

== Degrees of freedom
The minimum number of coordinates to clearly determine the state of a system.

Considering a system with several bodies. For a sum of degrees of freedom of $n$, and $b$ restricted degrees of freedom due to connections, the resulting degrees of freedom of the whole system is:
$
  f = n -b
$
#image("images/degrees-of-freedom.png")
#image("images/degrees-of-freedom-joints.png")

TODO:
- Newton's Laws
- Inner vs outer forces, sum of inner forces is 0
- $cal(P) = arrow(F) dot arrow(v)$
- Accelerating vs breaking force vs perpendicular
- pacman identity for dot / scalar product
- moment, the z component describes the angular direction, resultant moment points in the direction of the axis of rotation
- Kinematik & Dynamik - summary of the current movement of a body
- Total power formula
- Force groups
- Two force groups are statically equivalent when: $cal(P)_"tot"({G_1}) = cal(P)_"tot"({G_2})$ (when considering the same body) , ie equivalent when the resultant force and moment are equal. This works for any reference points, as long as it is used on the body
- equivalent forces with the same line of action - only for a rigid body
- action lines through the same point, resultant force but no moment
- torque, moments with same magnitude, only rotation, no resultant force, independent of the center of rotation
- formula for transforming moment with respect to one point to another
- invariants of dynamics
