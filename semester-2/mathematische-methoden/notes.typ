#heading(outlined: false)[Mathematische Methoden]

#outline()

#set heading(numbering: (..nums) => nums.pos().map(str).slice(1, none).join("."))

#pagebreak()

== Fourier Analysis
The goal is to find a set of trigonmetric functions, such that their superposition matches the signal being analysed.

To be able to capture an arbitrary signal, we need to determine the amplitude, frequency and phase difference of each possible frequency. A possible basis could be a single $sin$ function:
$
  integral_(-oo)^oo rho(omega) sin(omega t + phi(omega)) d omega
$
Where $rho(omega)$ is the amplitude distribution and $phi(omega)$ the phase shift distribution for all frequencies which we must determine. There are variants such as DCT and wavelet decomposition which work in this way. In fact, there are endless possible bases which can capture any signal, such bases are called *complete*.

However unless there is a compelling reason to use an alternative basis, Fourier transforms are done using $sin$ and $cos$. They have many advantages making them a suitable:
- Infinitely differentiable
- When considering the space of continuous functions with inner product $<f, g> = integral_a^b f(t) overline(g(t)) d t$, they are an orthogonal basis:
$
  "Orthogonal:"\
  <sin, cos> &= integral_0^(2 pi) sin(x) cos(x) d x = sin^2(x) |_0^(2 pi)\
  &= 0\
  "Linearly Independent:"\
  alpha sin(x) + beta cos(x) &= 0 forall x in [0, 2 pi] <=> alpha = beta = 0
$
TODO: Show that they span the entire space.

Furthermore, we can represent them in a compact way using Euler's formula:
$
  R e^(i omega t) = cos(omega t) + i sin(omega t)\
$

=== Fourier Series
This is the process of converting a periodic signal against time to a series of trigonometric waves with certain amplitudes and phase differences for a specific frequency.

=== Fourier Transform
This is the more general form which can also convert *non-periodic* signals.

TODO:
- Express signal as fourier series
- How to sample and calculate the transform
