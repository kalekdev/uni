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
- Field & thermionic emission / photoelectric effect
- Wave equation
- De Broglie equation
- Feynman or University Physics, angular momentum
- Lagrangian & Hamiltonian mechanics
- Nuclear mass defect
