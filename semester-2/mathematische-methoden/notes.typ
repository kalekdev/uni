#heading(outlined: false)[Mathematische Methoden]

#outline()

#set heading(numbering: (..nums) => nums.pos().map(str).slice(1, none).join("."))

#pagebreak()

== Fourier Transforms
_Analysis_ - Converts from a signal to a frequency distribution by sampling the signal.\
_Synthesis_ - Synthesises the approximated signal from its constituent sinusoids.

The goal is to find a set of trigonmetric functions, such that their superposition matches the signal being analysed. This is usually done by finding the suitable sinusoid for each possible frequency - changing the time-domain signal to frequency-domain sets of amplitudes and phase shifts.

To be able to capture an arbitrary signal in the frequency domain, we need to determine the amplitude, frequency and phase difference of each possible frequency. A possible basis could be a single $sin$ function:
$
  rho(omega) sin(omega t + phi(omega))
$
Where $rho(omega)$ is the amplitude distribution and $phi(omega)$ the phase shift distribution for all frequencies which we must determine. There are variants such as DCT and wavelet decomposition which work in this way. In fact, there are endless possible bases which can capture any signal, such bases are called *complete*.

However unless there is a compelling reason to use an alternative basis, Fourier transforms are done using complex numbers as polar coordinates in the complex plane. This representation has many advantages making them suitable:
- We can represent them in a compact, easy to manipulate way using Euler's formula:
$
  R e^(i omega t) = R(cos(omega t) + i sin(omega t))\
$
This is especially useful when solving for the Fourier transform of a known integrable function (rather than sampling a signal digitally), as powers of $e$ are easy to combine and simplify.
- They encode amplitude and phase for a given frequency, where the amplitude is simply the radius in the complex plane and the angle is the initial phase shift.

When considering $sin$ and $cos$ specifically:
- They are infinitely differentiable
- When considering the space of continuous functions with inner product $<f, g> = integral_a^b f(t) overline(g(t)) d t$, they are an orthogonal basis:
$
  "Orthogonal:"\
  <sin, cos> &= integral_0^(2 pi) sin(x) cos(x) d x = sin^2(x) |_0^(2 pi)\
  &= 0\
  "Linearly Independent:"\
  alpha sin(x) + beta cos(x) &= 0 forall x in [0, 2 pi] <=> alpha = beta = 0
$
TODO: Show that they span the entire space.

Here is the summary of the most popular forms of continuous Fourier transform analysis / synthesis functions:
#figure(
  image("images/fourier-transform-equations.png", width: 100%),
) <fig-fourier-transform-equations>

=== Negative Frequencies
These can give the notion of a sinusoid progressing in the negative direction ie clockwise on the unit circle. However, in many Fourier transforms they do not play a huge role and don't appear as part of the frequency spectrum. Nonetheless, it is necessary to include these frequencies in the analysis to be able to characterize certain complex valued signals.

=== Analysis
The goal here is to convert a time-domain signal $f(t)$ to a frequency $->$ complex number (amplitude and initial phase encoded) mapping, usually denoted as $hat(f)(omega)$. I will consider the angular frequency version of this transform as it feels the most intuitive to me:
$
  hat(f) (omega) = integral_(-oo)^oo f(t) e^(-i omega t) d t
$

Let us imagine we want to find how much of a sinusoid with frequency $omega_1$ is in the signal and at what phase shift it begins. The integral "plays" the complex unit circle at this frequency alongside the sampled signal and sums the product of all of these infinitesimal samples, which results in a complex number with a radius corresponding to how much the frequency is part of the signal and whose angle is equal to the best phase shift of that frequency so it aligns with $f(t)$. TODO: Understand exactly why this mechanism works so well.

TODO: An interesting detail is the negative sign in the power of $e$. This is effectively the complex conjugate and has something to do with inner product of complex space using the Hermetian. Hopefully this becomes clear after understanding the matrix representation of the transform.

This results in the fourier transform $hat(f) (omega)$ with a complex output. When we plot the radius against frequency graph for all of these complex outputs, we arrive at the top left graph, which can be extremely useful for identifying interesting or unwanted frequencies which are part of the signal:
#figure(
  image("images/fourier-analysis-results.png", width: 70%),
) <fig-fourier-analysis-results>
Since the phase is usually not that interesting, it is often discarded unless we plan on synthesizing the time domain signal again.

=== Synthesis
We can also recreate the time domain signal from the complex frequency-domain transform:
$
  f(t) = integral_(-oo)^oo hat(f) (omega) e^(i omega t) d omega
$
This effectively calculates the superposition of all possible frequencies at a specific point in time.

As seen previously $hat(f) (omega)$ returns a complex number for each frequency in the form $R e(i theta)$ where $R$ is the amplitude of the sinusoid and $theta$ is that frequencies phase shift. When multiplied with $e^(i omega t)$:
$
  hat(f) (omega) e^(i omega t) &= R e^(i theta) e^(i omega t)\
  &= R e^(i(omega t + theta))\
  &= R cos(omega t + theta) + i R sin(omega t + theta)
$
We arrive at the following familiar $R cos(omega t + theta)$ representation of a sinusoid for that given frequency. TODO: I believe the imaginary part is simply ignored, or maybe it evaluates to 0 somehow thanks to the conjugate used when analysing.

=== Discrete Fourier Transform
TODO then cover matrix method in linalg notes

=== Fourier Series
This is the process of converting a periodic signal against time to the frequency domain.

