= Technische Mechanik

_Kinematiks_ - how a model is currently at motion\
_Statics_ - Which conditions (forces & moments) are needed to keep a system at
rest\
_Dynamics_ - Which conditions are needed to create movement in a system in a
certain way\

_Time derivative_ - $dot(x) = (d y) / (d t)$\
== Starre Koerper
A body in which deformation is negligible. There are no ideal rigid bodies in real life.

Let $P, Q$ be points in a rigid body
$
  forall P, Q in RR^3, abs(bold(r_Q) - bold(r_P)) = "Constant"
$

_Satz der Projizierten Geschwindigkeiten_:
The velocities of any two points in a rigid body projected on the vector between them is always the same. This means the body is not getting shorter or longer (deforming).\
Useful for determining the velocities of points on rigid bodies with relation to each other.
$
  abs(r_Q-r_P) = "Konst" forall P, Q in RR^3 -> v_Q dot e = v_P dot e\
  "wo" e = (r_Q-r_P) / abs(r_Q-r_P)
$

$v'_A$ = Velocity of A projected onto the vector alongside a rigid body.

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
There is no separate $e_phi$ component in the cylindrical position vectors, as it's already accounted for by the $e_rho$ unit vector.
$
  "Wegen des Einheitskreises:" e_rho &= cos(phi)e_x + sin(phi)e_y\
$

This is important to remember when taking time derivatives in the cylindrical / spherical coordinate systems.

$
  "Intuitiv:" e_phi &= d(e_rho) / (d phi) = -sin(phi)e_x + cos(phi)e_y \
  d(e_phi) / (d phi) &= -cos(phi)e_x - sin(phi)e_y = -e_rho\
  d(e_rho) / (d phi) &= e_phi\
$

$
  "TODO: How to derive the derivatives with respect to t?"\
  d(e_phi) / (d t) = -dot(phi) e_rho\
  d(e_rho) / (d t) =dot(phi)e_phi\
$

Example of how to use the above derivatives:
$
  r &= vec(rho, phi, z) = vec(cos(t), t, sin(t)) = cos(t)e_rho + sin(t) e_z\
  t = phi, therefore\
  dot(r) &=vec(d(cos(t)e_rho)/(d t), d(sin(t) e_z)/(d t))= -sin(t) e_rho + cos(t)dot(e_rho) + cos(t) e_z + sin(t) dot(e_z)\
  &= -sin(t)e_rho + cos(t)e_phi+ cos(t)e_z\
  abs(dot(r))&= sqrt((-sin(t))^2 + (cos(t))^2 + cos^2(t))\
  &= sqrt(1+cos^2(t))
$
