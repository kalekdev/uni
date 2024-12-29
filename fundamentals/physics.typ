= Physics

#figure(
  image("images/modern-physics.png", width: 60%),
) <fig-modern-physics>

== Classical Mechanics

=== Newton's Laws of Motion
Published in his 1687 paper Principia, these laws describe the motion of objects and continue to serve as the foundations of classical mechanics in the modern day.

1. An object remains at rest or in motion at a constant speed unless acted on by an external force. (aka the principle of inertia)
2. The resultant force acting on a body is the rate of change of the momentum of the object:
$
  F = (d bold(P)) / (d t) = m bold(a)
$
3. Every action results in an equal and opposite reaction. This can also be used to show the conservation of linear momentum.

=== Frame of Reference
A coordinate system whose origin and basis are specified in space.

A frame of reference itself can be in motion, for example when considering an object on the Earth's surface as "stationary" the frame of reference in which we are thinking is moving with the same velocity as that object when compared to any other object in space. It would be considered as moving at the same velocity as the Earth's surface in a different frame of reference with the sun as the origin.

_Inertial Reference Frame_ - A reference frame in which objects obey the principle of inertia; ie. the frame itself is moving at a constant velocity in relation to any other intertial reference frame. The Earth's surface is a good approximation of an inertial reference frame which we are accustomed to thinking in terms of.

_Non-Inertial Reference Frame_ - It is accelerating in some way; objects defined as stationary / moving at a constant velocity with respect to the frame are therefore also accelerating in relation to any other inertial reference frame without the need of any external force and thus violate the principle of inertia.

TODO: Rotating frame of reference

=== Galilean Transformation
The coordinates of two inertial frames of reference can be transformed between one another using the following equations:
$
  x' &= x - v t\
  y' &= y\
  z' &= z\
  t' &= t\
$
This approximation is accurate when considering systems with velocities significantly slower than the speed of light (non-relativistic).

Transformations between reference frames can also be represented as a matrix allowing easier vector calculations.

=== Momentum
Consider a system of $n$ particles, where the only forces are those exerted by the particles on each other. The sum of momentum of this system is:
$
  sum p = P
$
The rate change of a single particle's momentum is the resultant force:
$
  dot(p) = sum_(i=1)^n F_(1 i)
$
Since differentiation is a linear operation, the rate of change of the total momentum is:
$
  dot(P) = sum_(j=1)^n sum_(i != j)^n F_(j i) = 0
$
This always equal to 0 due to Newton's 3rd Law of Motion: $F_(j i) = -F_(i j)$

Hence total momentum is constant and conserved, which is a useful fact for solving collision problems.

Newton's 3rd law and thus the conservation of momentum does not hold when relativistic effects are apparent and therefore also in the case of magnetic fields (which is a consequence of special relativity):
#figure(
  image("images/momentum-magnetism.png", width: 60%),
) <fig-momentum-magnetism>
However, unless the particles are moving near the speed of light, the electrostatic forces far outweigh momentum losses due to magnetism.

==== Impulse
Consider a constant force applied on a point mass for $Delta t$ seconds. The change in momentum is called impulse:
$
  Delta P = F Delta t
$
This often leads to an easier approach for calculating resulting velocities due to conservation of momentum.

==== Angular Momentum
Momentum and Newton's 2nd Law can be defined with respect to a *fixed* point as angular momentum:
$
  arrow(l) = arrow(r) times arrow(p)
$
Where $arrow(r)$ is the vector from the point to the particle and $arrow(p)$ is its linear momentum.

Newton's 2nd Law is defined accordingly - the resultant moment of forces applied on the particle with respect to the *fixed* point is equal to its rate of change of angular momentum with respect to the same point:
$
  arrow(M) = dot(l)
$
For example, the angular momentum of a centripetal system (orbiting planet) with respect to the origin stays constant as the force has no perpendicular component.

The total angular momentum of a classical system with respect to any point is conserved, just like linear momentum.

==== Center of Mass
Unfortunately we do not work with point masses in real life, but luckily the same linear and angular momentum conservation laws apply to the center of mass of objects.

The resultant force applied at any point of a rigid body is proportional to the acceleration of its center of mass, $F = m a$.

Furthermore, the axis through the center of mass of an object is also valid as a fixed point for angular momentum, even if it is accelerating (and non-inertial). The conservation law and $arrow(M) = dot(l)$ also apply in this case.

==== Moment of Inertia
The moment of inertia $I$ is the rotational motion equivalent of mass and a property of an object together with the axis around which it's spinning - a measure of how much torque is needed to change an objects angular momentum:
$
  l = I omega\
  M = I dot(omega)
$

For a *rigid* body with density $d m$, the total angular momentum with respect to the axis of rotation can be calculated using $arrow(v) = arrow(r) times arrow(omega)$
$
  L = integral.triple arrow(r) times arrow(v) d m = integral.triple r arrow(e_r) times (
    r arrow(e_r) times omega arrow(e_omega)
  ) d m\
  = omega integral.triple r^2 arrow(e_r) times arrow(e_v) d m = omega integral.triple r^2 arrow(e_omega) d m\
  = omega I
$
Therefore the moment of inertia relative to an axis can be calculated using:
$
  I = integral.triple r^2 d m\
$

Taylor's "Example 3.4 Sliding and Spinning Dumbbell" is a good summary of these ideas.

=== Energy
Consider a particle of mass $m$ traveling at speed $v$ with initial kinetic energy $T$:
$
  T = 1 / 2 m v^2\
  (d T) / (d t) = m a v = F v\
  d T = F v d t = F d s
$
This proves $W = F d$ the *Work-KE theorem*, as a line integral:
$
  W = integral_C F dot d arrow(s)
$
Where $F$ is the resultant force acting on the particle.

==== Conservative Forces
The 4 fundamental forces are conservative due to the conservation of energy, meaning that they satisfy the following criteria:
- It depends only on a test particle's position, not on its velocity, time or any other variable.
- The work done by the force as test particle moves between two points is the same, regardless which path it takes
Macroscopic forces which exhibit this behavior can also be defined as conservative, for example the elastic force of a spring.

The total *mechanical energy* of a particle that only interacts with conservative forces is conserved:
$
  E = T + U(arrow(r))
$
Where $T$ is the convention for kinetic energy and $U(arrow(r))$ is the potential energy.

Forces such as friction are not fundamental and are called *effective forces*; approximations of the huge number of underlying fundamental forces, which do not account for all energy involved (some of it is lost to heat), for example moving a table between two points on the floor requires more work if the path chosen is longer.

The second condition can be checked using curl (rather than comparing every path):
$
  gradient times F = 0 "everywhere" <=> "The work done is path independent"
$
Proof:
+ If the work done is path independent, the work done over any closed loop is 0. Consider a path from the reference potential to a point, *any* path back to the reference potential does the same work on the particle and hence:
$
  integral.cont F dot d s = 0
$
+ Stoke's Theorem states:
$
  integral.cont F dot d s = integral.double (gradient dot F) dot d A
$
If $gradient times F = 0$ everywhere then the surface integral and subsequently the closed line integral are also 0, proving that work done is path independent $qed$.

For example in the case of the electrostatic / gravitational field around a point charge:
$
  gradient times (k arrow(r)) / (abs(r)^3) = abs(mat(
  e_x, e_y, e_z;
  partial / (partial x), partial / (partial y), partial / (partial z);
F_x, F_y, F_z
))= vec((partial F_z) / (partial y) - (partial F_y) / (partial z), -(partial F_z) / (partial x) + (partial F_x) / (partial z), (partial F_y) / (partial x) - (partial F_x) / (partial y))
$
All of the partial derivatives evaluate to 0 (see Taylor's example 4.5 for calculations), showing that those forces are conservative and that the potential only depends on the radial distance (since the work done is path independent) + the negative potential gradient is equal to the force.

==== Potential Energy
Let $r_0$ be the point where potential is set as 0. A *conservative force's* potential energy at a point $r$ is defined as:
$
  U(arrow(r)) := - W(arrow(r_0), arrow(r)) = -integral_arrow(r_0)^arrow(r) arrow(F)(arrow(r ')) dot d arrow(r ')
$
Alternatively the *change* in potential energy can be calculated between two points.

The negative sign is there so when the Work-KE Theorem is applied:
$
  Delta T = integral_C F dot d arrow(s) = - Delta U\
  Delta T + Delta U = 0 = Delta E
$
The total mechanical energy $E$ stays constant and energy is conserved. The maximum possible kinetic energy is when the potential energies are at their minimum:
$
  E = T + sum U_i
$

Intuitively, potential energy is the *external* energy needed to get a particle to that point from the point of 0 potential. Negative energy external energy is needed to bring a particle from infinity to a point near a mass, because gravity does the work for you.

If there is non-conservative forces acting on the object, the mechanical energy "stolen" by these forces is:
$
  Delta E = W_(n c)
$

==== Gradient of Potential Energy
Solving the equation $U = - integral_C F dot d arrow(r)$, the *conserved force* (not resultant!) can be derived from the gradient of its potential energy at a point:
$
  F = - gradient U(r)
$

=== Harmonic Oscillators
Consider a system where some particle has an oscillating potential energy, for example a swinging pendulum. Let $U(t)$ be a function of the particle's potential energy against time, in this case gravitational potential. Using a Taylor Series, we can approximate it around a point in time as:
$
  U(t) approx U(t_0) + dot(U)(t_0) (t - t_0) + (dot.double(U)(t_0) (t - t_0)^2) / 2 + ...
$

Considering the system after a specific point in time $t_0$, we can define some remarks:
- $t - t_0 = hat(t)$ - Time that has passed since the point in time
- $U(t_0)$ - Starting potential energy of the particle, this is not a very useful value since it is so complicated - we are more interested in the changing potential energy between the two critical points.
- $dot(U) (t)$ - This is the power of the restoring force at a point in time, ie gravity in a pendulum or a spring's tension.
- Systems try to minimize potential energy; the minimum potential energy of the particle is at a critical point where $dot(U) = 0$.

This leads to the minimum potential energy of an oscillating system:
$
  U(hat(t)) &approx (dot.double(U)(t_0) (hat(t))^2) / 2 + ...\
  &approx 1 / 2 k hat(t)^2
$
Where $k$ is a constant specific to this system - the rate of change of the restoring force's power.

TODO: Feynman's Lectures chapter 21

== Special Relativity
_Spacetime_ - A 4-dimensional representation of the universe as 3D space + time. Classical mechanics treats time as a uniform quantity throughout the universe with a constant rate of passage. However relativistic effects mean that time passes at different rates in different frames of reference, hence a 4th dimension is introduced.

TODO: Minkowski space

TODO: Michelson-Morsley experiment, Lorentzian electrodynamics and the aether

After the failed Michelson-Morsley experiment, a new theory was needed to explain the speed of light. Special relativity is a theory published in 1905 (On the Electrodynamics of Moving Bodies) by Albert Einstein, accurately modelling motion through spacetime when gravitational and quantum effects are negligible.

In special relativity, time and distances become relative to the velocity of particles.

_Postulate_ - Something assumed as true in a theory.

It is based on 2 postulates:
+ The laws of physics are invariant in all inertial frames of reference. This is known as the principle of relativity.
+ The speed of light is the same for all observers, regardless of all motion.

=== Lorentz Transformation
Two inertial spacetimes can be transformed between one another with the following relationships:#footnote([The derivation is mathematically very simple and a great exercise in thought. Consider a pulse of light being emitted from a torch in a frame of reference moving at velocity $v$, the distance travelled by the light and the time taken with respect to each frame of reference can be expressed using the Pythagorean theorem. Due to the 2nd postulate, time and distance are different in both frames so that the speed of light remains constant.])
$
  t' &= gamma (t- (v x) / c^2)\
  x' &= gamma (x- v t)\
  y' &= y\
  z' &= z
$
Where $gamma$ represents the Lorentz factor, which appears in many equations from Classical mechanics adjusted for relativistic effects:
$
  gamma =1 / sqrt(1- v^2/c^2)
$

=== Implications
The second postulate leads to many extremely important implications in spacetime:
- Time dilation - Time passes at a different rate in different frames of reference; slower the closer to the speed of light an inertial frame is translating with respect to another. The intuition for this is that time must be slower to accountfor the added velocity of an inertial frame itself to the speed of light (which much remain constant across all frames).
- Length contraction - Lengths in a relativistic frame of reference are shorter with comparison to another frame at rest.

Conservation of momentum and energy also lead to the following implication:
- Relativistic mass - Observed mass increases when an object's speed approaches the speed of light: $m = gamma m_0$ where $m_0$ is the object's rest mass.
- The same can be applied to kinetic energy and momentum.

== Bohr's Atomic Model
The model was introduced in 1911 by Niels Bohr to explain the Rydberg formula, Photoelectric effect and the stability of the atom. It does not explain other quantum phenomena such as wave particle duality. Nonetheless, it's much more accessible than Schrodinger's wave function and still remains a useful tool.

TODO: Rydberg Formula

It is based on the following postulates:
+ Electrons orbit the nucleus at shells fixed distances away called energy levels, where each shell contains a fixed number of electrons called the electron configuration.
+ The energy levels are integer multiples of Planck's constant and the possible energies are therefore quantized. Electrons further from the nucleus have more energy (less negative). At this stable energy levels, the acceleration of electrons (as they exhibit circular motion) does not lead to radiation / energy loss. The lowest energy level is called the _ground state_ and the highest is called the _valence band_.
+ Electrons may lose / gain energy by jumping between energy levels when emitting / absorbing light, who's frequency is determined by the Planck relation.

TODO: PEP and why electrons stay in their energy levels

TODO: Electron configurations

TODO:
- Thermodynamics and Entropy
- Accelerating charge emitting radiation, Larmor formula, electrons losing energy in orbitals
- Zeeman Effect
- Field & thermionic emission / photoelectric effect
- Wave equation
- De Broglie equation
- Angular momentum
- Spin
- Lagrangian & Hamiltonian mechanics
- Nuclear mass defect
