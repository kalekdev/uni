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

_Inertial Reference Frame_ - A reference frame in which objects obey the principle of inertia; ie. the frame itself is moving at a constant velocity in relation to any other inertial reference frame. The Earth's surface is a good approximation of an inertial reference frame which we are accustomed to thinking in terms of.

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
This proves $Delta T = F d$ the *Work-KE theorem*, as a line integral:
$
  Delta T = integral_C F dot d arrow(s)
$
Where $F$ is the resultant force acting on the particle.

==== Conservative Forces
The 4 fundamental forces are conservative due to the conservation of energy, meaning that they satisfy the following criteria:
- They depend only on relative positions, not on velocity, time or any other variable.
- The work done by the force as test particle moves between two points is the same, regardless which path it takes
Macroscopic forces which exhibit this behavior can also be defined as conservative, for example the elastic force of a spring.

The total *mechanical energy* of a particle that only interacts with conservative forces is conserved and constant:
$
  E = T + U(arrow(r))
$
Where $T$ is the convention for kinetic energy and $U(arrow(r))$ is the potential energy.

Forces such as friction are not fundamental and are called *effective forces*; approximations of the huge number of underlying fundamental forces, which do not account for all work done (some of it is lost to heat), for example moving a table between two points on the floor requires more work if the path chosen is longer.

The second condition can be checked using curl (rather than comparing every possible path):
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

Intuitively, change in potential energy is the change in energy stored as the force does work on a particle from one point to another. If the conservative force acts in the same direction as the particle's movement, it accelerates the particle and increases its kinetic energy, reducing that force's potential energy store, thus the negative change in potential. If the particle moves against the conservative force, it slows down and the lost kinetic energy is stored as potential $Delta U > 0$.

Furthermore, the negative sign ensures mechanical energy (of an object only acted upon by conservative forces) is constant:
$
  Delta T = integral_C F dot d arrow(s) = - Delta U\
  Delta T + Delta U = 0 = Delta E
$
The total mechanical energy $E$ stays constant and energy is conserved. The maximum possible kinetic energy is when the potential energies are at their minimum:
$
  E = T + sum U_i
$

If there are non-conservative forces acting on the object, the mechanical energy (usually) stolen / introduced by these forces is:
$
  Delta E = W_(n c)
$

==== Gradient of Potential Energy
Solving the equation $U = - integral_C F dot d arrow(r)$, a *conserved force* can be derived from the gradient of its potential energy at a point:
$
  arrow(F) = - gradient U(r) = -vec((partial U(r))/(partial x), (partial U(r))/(partial y), (partial U(r))/(partial z))
$
Because the total potential energy is simply the sum of potential energies, this also applies to the resultant force *only if* work is done completely by conserved forces:
$
  arrow(F_"Resultant") = - gradient U(r)_"Total"
$

In the example of a box on a frictionless slope, the normal reaction force is always perpendicular to the direction of movement, hence work is only done by *a component* of the gravitational force acting on the box - the change in potential graph of a roller coaster shows its changing height and negative gradient represents the resultant force at each point (down the slope).

*IMPORTANT:* This is not the same as the graph of its gravitational potential, which remains largely constant as the changes in height are relatively small, rather the graph of work done by the gravitational force (which depends on the constraints of the track). TODO: Double check

Furthermore, when considering multiple isolated particles which exert conservative forces on one another and Newton's 3rd Law, we can derive the forces acting on each of them from a *single* potential energy function:
$
  F_12 = -gradient_1 U\
  F_21 = -gradient_2 U\
$
Where $gradient_1$ is the gradient with respect to the current coordinates of particle 1.

This can be generalized to a system of n particles:
$
  T = sum^n_i 1 / 2 m_i v_i^2\
  U = sum_j^n sum_(i > j)^n U_(j i) + sum_i^n U^"ext"_i\
  F_"Resultant" = - gradient_i U
$

==== One-Dimensional Systems
A force acting on a particle who's position is constrained to 1 degree of freedom must only satisfy the first condition (the force only depends on position) to be classified as a conservative force and the second condition (work done independent of path) is guaranteed to be true. This is because the work done by any combinations of going forwards and backwards along the path to the 2nd point cancel each other out.

Both minima and maxima represent points where the resultant force is 0, however minima are more stable as a small deviation pushes the object back to minimum potential. Points of inflection (or saddle points in 2D) are considered as unstable in one direction.

If an object starts in between two hills and its total mechanical energy is lower than the peak of one of the hills, it's "trapped in the energy well".
#figure(
  image("images/molecule-energy.png", width: 40%),
) <fig-molecule-energy>

==== Equation of Motion
Given a function of the potential energy $U(x)$ and the initial mechanical energy, we can solve for the equation of motion $x(t)$:
$
  T = E - U(x) = 1 / 2 m dot(x)^2\
  dot(x) = sqrt((2 (E - U(x)))/m)
$
Using separation of variables TODO: Review after analysis 2:
$
  t = integral_(x_0)^x 1 / (dot(x) (x')) d x' = sqrt(m/2) integral_(x_0)^x 1 / sqrt(E - U(x')) d x'
$
Solving this integral (may only be possible numerically) gives us $t(x)$, which can be rearranged to $x(t)$.

==== Elastic Collisions
An elastic collision is a collision between two particles that interact through a conservative force that tends towards 0 as their separation increases, for example between two protons approaching each other from $oo$. The steady state initial and final potential can be taken as 0, meaning that:
$
  T_"Init" = T_"Final"
$
In reality this is only possible at low energies, as relativity tells us that new particles may be created.

An useful property of elastic collisions between two particles of the same mass is that they exit perpendicular to each other.

==== Rigid Bodies
Within rigid bodies, the distances between particles is constant and they exert *circular* electrostatic forces on each other (meaning they only dependent on the constant distances between each other). Hence, the total *internal* potential energy of the body stays constant and can be ignored - energy is only exchanged between $U^"ext"$ and $T^"Total"$ where:
$
  T^"Total" = 1 / 2 m v_"CM"^2 + 1 / 2 I omega^2
$
TODO: Rotational kinetic energy

=== Oscillations
Consider a system where some particle has an oscillating potential energy, for example a swinging pendulum. Let $U(x)$ be a function of the particle's potential energy against displacement. The first 3 terms of a Taylor Series serves as a good approximation provided that the displacement is small:
$
  U(x) approx U(0) + U'(0)x + 1 / 2 U''(0) x^2+ ...
$

- $U(0) = 0$ - The equilibrium can be defined as the ground potential
- $U'(0)$ - This is equal to the magnitude of the resultant force, which at $x=0$ is 0.
- $U''(0) > 0$ because the position of zero displacement is stable and a local minima

This leads to the familiar parabolic potential energy of an oscillating system:
$
  U(x) &approx 1 / 2 U''(0) x^2\
  &approx 1 / 2 k x^2
$
Where $k$ is a positive constant specific to this system, a measure of how "stable" the equilibrium position is.

==== Simple Harmonic Motion
Recall $F_"Resultant" = -gradient U(x)$ for a body upon which only conservative forces do work. In a one dimensional oscillating system:
$
  F = - (d U(x)) / (d x) = -k x
$
Gives us Hooke's law.

Applying Newton's 2nd law:
$
  dot.double(x) &= -k / m x\
  &= -omega^2 x
$
Where $omega= sqrt(k/m)$, which ends up being the angular velocity. $x$ is not necessarily a linear displacement and can represent a displacement angle, for example in a swinging pendulum.

There are two independent solutions to this 2nd order linear differential equation:
$
  x(t) = e^(plus.minus i omega t)
$
Furthermore, because differentiation is a linear operation, any linear combination of these solutions is also a solution (it can all be expressed as matrix multiplication):
$
  x(t) = C_1 e^(i omega t) + C_2 e^(-i omega t)
$
Where the coefficients must be chosen so that $x(t)$ is real.

Expanding Euler's formula gives us more insight into the underlying functions:
$
  x(t) &= C_1(cos(omega t) + i sin(omega t))+ C_2(cos(omega t) - i sin(omega t))\
  &= (C_1 + C_2) cos(omega t) + (C_1 - C_2)i sin(omega t)\
  &= B_1 cos(omega t) + B_2 sin(omega t)
$
By inspecting the behavior of the system we can determine the meaning of the coefficients:
$
  dot(x) &= -B_1 omega sin(omega t) + B_2 omega cos(omega t)\
  x(0) &= B_1 = "Initial displacement"\
  dot(x)(0) &= B_2 omega = "Initial velocity"
$
Therefore an oscillation starting at initial velocity $v_0$ at displacement $x_0$:
$
  x(t) = x_0 cos(omega t) + v_0 / omega sin(omega t)
$
Where $omega$ is the angular frequency of the oscillation and hence:
$
  omega = (2 pi) / T\
  T = (2 pi) / omega = (2 pi) / sqrt(k/m)
$

A more compact solution can be found by introducing a phase shift through trig identities:
$
  x(t) = A cos(omega t - phi)\
  dot(x)(t) = -A omega sin(omega t - phi)
$
Where $A$ is the maximum displacement and $phi$ is the initial angular displacement $pi/2 dot x/ A$ when $t=0$.

==== Energy
By substituting either of these solutions into the formulae for potential and kinetic energy:
$
  E = T + U = 1 / 2 (m dot(x)^2 + k x^2)\
  = 1 / 2 k A^2 (sin^2(omega t - phi) + cos^2(omega t - phi))
$
This reveals the following intuitive properties:
- The kinetic and potential energy are in antiphase, the velocity is at its greatest at the equilibrium position and 0 at the maximum displacement.
- The total mechanical energy is constant $= 1/2 k A^2$ (taking the equilibrium potential as 0)

==== 2D Oscillations
*Isotropic oscillation* is the simplest form of 2D oscillation, where the restoring has the same constant of proportionality in all directions:
$
  arrow(F) = -k arrow(r)
$
Examples of such an oscillation include:
- A ball attached to identical springs around the origin
- A ball rolling around the bottom of a spherical bowl
- An atom vibrating around its equilibrium position in a symmetric crystal

By considering each component separately we arrive at a set of parametric equations, for example in 2D:
$
  x(t) = A_x cos(omega t - delta_x)\
  y(t) = A_y cos(omega t - delta_y)
$
#figure(
  image("images/isotropic-oscillation.png", width: 60%),
) <fig-isotropic-oscillation>

An *anisotropic oscillation* may have different constants of proportionality in different directions and hence different angular frequencies. This can give rise to cool paths called *Lissajous curves*:
#figure(
  image("images/lissajous-curves.png", width: 60%),
) <fig-lissajous-curves>

==== Damped Oscillations
Consider a damping force $F = -b dot(x)$ proportional to velocity (for example air resistance). Newton's 2nd law reads:
$
  m dot.double(x) + b dot(x) + k x = 0
$

The same differential equation also applies to the voltages in an LRC circuit:
#figure(
  image("images/lrc-circuit.png", width: 20%),
) <fig-lrc-circuit>
$
  L dot.double(q) + R dot(q) + 1 / C q = 0
$

This can be rewritten as:
$
  dot.double(x) + 2 beta dot(x) + omega_n^2 x = 0
$
Where $2 beta = b / m$ and $omega_n = sqrt(k / m)$.
- $beta$ is named the damping constant which characterizes the strength of damping in this system.
- $omega_n$ is named the natural frequency, at which the system would oscillate if $beta = 0$

Solving this 2nd order linear ODE:
$
  x(t) = e^(r t)\
  dot(x)(t) = r e^(r t)\
  dot.double(x)(t) = r^2 e^(r t)\
  r^2 e^(r t) + 2 beta r e^(r t) + omega_n^2 e^(r t) = 0\
  therefore r^2 + 2 beta r + omega_n^2 = 0\
  r = - beta plus.minus sqrt(beta^2 - omega_n^2)\
  x(t) = C_1 e^(- beta t + sqrt(beta^2 - omega_n^2)t) + C_2 e^(- beta t - sqrt(beta^2 - omega_n^2)t)\
  = e^(- beta t)(C_1 e^(sqrt(beta^2 - omega_n^2) t) + C_2 e^(- sqrt(beta^2 - omega_n^2) t))\
$
Whose validity can be checked by setting $beta = 0$, giving us the solutions to undamped simple harmonic motion. We can observe that the amplitude decreases exponentially depending on $beta$

===== Weak Damping
In the case of $beta < omega_n$, the constant $sqrt(beta^2 - omega_n^2)$ is complex an can be rewritten as $i sqrt(omega_n^2 - beta^2) = i omega'$ giving a very similar equation to undamped oscillation:
$
  x(t) &= e^(- beta t)(C_1 e^(i omega' t) + C_2 e^(-i omega' t))\
  "Ensuring a real output:" &= A e^(- beta t) cos(omega' t - phi)
$
This reveals:
- The amplitude exponentially tends towards 0
- The frequency of oscillation is constant throughout and is slightly lower than the natural frequency $omega_n$
#figure(
  image("images/weak-damping.png", width: 60%),
) <fig-weak-damping>

===== Strong Damping
If $beta > omega_n$, the constant $sqrt(beta^2 - omega_n^2)$ is real and $e^(omega' t), omega' in RR$ is simply exponential increase, there is no more oscillation. The displacement time graph looks something like this:
#figure(
  image("images/strong-damping.png", width: 60%),
) <fig-strong-damping>

===== Critical Damping
When $beta = omega_n$, we get the following solutions:
$
  x(t) &= C_1 e^(- beta t) + C_2 t e^(-beta t)\
  &= e^(- beta t) (C_1 + C_2 t)\
$
TODO: Is it even possible to find the second solution methodically?

An interesting property of damped oscillations is how quickly they decay. The *decay parameter* is the factor of exponential decay in the equation of motion, here are the decay parameters of the different types of damping and a plot:
#figure(
  image("images/decay-parameters.png", width: 40%),
) <fig-decay-parameters>
#figure(
  image("images/decay-parameter-plot.png", width: 50%),
) <fig-decay-parameter-plot>

The greatest decay parameter arises under critical damping, meaning that it stops oscillation in the shortest possible time, useful for applications like vehicle suspension. The intuition behind this is that a damping force with $beta > omega_n$ will slow the movement down so much that it actually takes longer to reach equilibrium in the first place (for example an oscillator in an overly viscous fluid).

==== Driven-Damped Oscillations
To keep damped oscillations oscillating, a driving force must be introduced to add energy back into the system. This can be written as a non-homogeneous ODE ($F(t)$ does not depend on x):
$
  m dot.double(x) + b dot(x) + k x = F(t)
$
Which can be tidied up as before to:
$
  dot.double(x) + 2 beta dot(x) + omega_n^2 x = f(t)
$
Where $f(t) = F(t) / m$.

Let us assume the case that the driving force is a sinusoidal function of time (of course in reality is not always a perfect sine wave, however any periodic driving force can be assembled from sinusoids thanks to Fourier transforms):
$
  f(t) = f_0 cos(omega_d t)
$

We can find a solution to this non-homogeneous ODE thanks to the fact that its differential operator $D(f)$ is linear. We already know the solutions if it were homogeneous $D(x_h) = 0$ where $x_h$ are the solutions to damped oscillation, and can find a *particular solution* $D(x_p) = f(t)$ by making the RHS complex with the help of Euler's formula, finding a complex solution and taking its real part (See Taylor 5.5):
$
  A = f_0 / sqrt((omega_n^2-omega_d^2)^2+4 beta^2 omega_d^2), phi = arctan((2 beta omega_d)/(omega_n^2 - omega_d^2))\
  x_p (t) = A cos(omega_d t - phi)
$

We have found a particular solution, therefore applying linearity:
$
  D(x_h + x_p) = D(x_h) + D(x_p) = 0 + f(t) = f(t)
$
$x = x_h + x_p$ is also a solution. Furthermore, we know that a second order linear differential operator must have 2 dimensions in its null space, which $x_h$ already spans. Therefore $x_h + x_p$ contains every possible solution, where $x_p$ can be thought of as an adjustment term to fix the basis when $f(t)$ is introduced into the linear operator.

Finally:
$
  x(t) = A cos(omega_d t - phi) + [
    e^(- beta t)(C_1 e^(sqrt(beta^2 - omega_n^2) t) + C_2 e^(- sqrt(beta^2 - omega_n^2) t))
  ]\
$
Where $omega_n$ is the natural angular frequency (no damping or oscillation) and $omega_d$ is the driving force angular frequency.

The terms inside of the square brackets are called *transients* because they decay over time and play no role in the steady state of the system.

This leads to the following insights as expected:
- The steady amplitude of the system is given by $A$. It is directly proportional to the driving force $m f_0$.
- The steady angular frequency is that of the driving force $omega_d$.

These steady state conditions are the same regardless of initial displacement or velocity.

#figure(
  image("images/damped-driven-oscillator.png", width: 50%),
) <fig-damped-driven-oscillator>

==== Resonance
As seen above, the amplitude of driven oscillations depends on several variables:
$
  A = f_0 / sqrt((omega_n^2-omega_d^2)^2+4 beta^2 omega_d^2)
$
It is greatest when $omega_n = omega_d$ (the natural and driving frequency are the same) and the damping coefficient $beta$ is low. Therefore $omega_n$ is also called the *resonant frequency*. If there is no damping and the oscillator is being driven at the resonant frequency, $A -> oo$.
#figure(
  image("images/resonant-frequency.png", width: 60%),
) <fig-resonant-frequency>

An application of this is when tuning a radio, the resonant frequency of an LRC circuit is adjusted so that it is the same as the desired radio station's signal and that specific induced signal has the largest amplitude.

===== Q Factor
Reducing the damping constant $beta$ not only increases the amplitude but also makes the resonance peak narrower, focusing the oscillator on a narrow ranger of driving frequencies:
#figure(
  image("images/q-factor.png", width: 40%),
) <fig-q-factor>

The *Q Factor* is a measure of how narrow the resonance for an oscillator is:
$
  Q = omega_n / (2 beta)
$
Where the resonance width is inversely proportional to $beta$, hence a high Q value indicates a narrow width. A crystal oscillator should have a large Q value as clocks depend on its resonance frequency being constant.

=== Lagrangian Mechanics

== Special Relativity
_Spacetime_ - A 4-dimensional representation of the universe as 3D space + time. Classical mechanics treats time as a uniform quantity throughout the universe with a constant rate of passage. However relativistic effects mean that time passes at different rates in different frames of reference, hence a 4th dimension is introduced.

TODO: Minkowski space

TODO: Michelson-Morsley experiment, Lorentzian electrodynamics and the aether

After the failed Michelson-Morsley experiment, a new theory was needed to explain the speed of light. Special relativity is a theory published in 1905 (On the Electrodynamics of Moving Bodies) by Albert Einstein, accurately modelling motion through spacetime when gravitational and quantum effects are negligible.

In special relativity, time and distances become relative to the velocity of particles.

_Postulate_ - Something given as true in a theory.

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
