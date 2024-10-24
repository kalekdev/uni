== Prove that the Legendre Polynomials $P_(0-3)$ are a basis for $cal(P)_4 (RR_3[x])$:
To show that they are a basis, we need to show that:
+ They span (and as a basis are also a subset of) $cal(P_4)$
+ They are linearly independent

Firstly we express them in terms of the Monomes $p_n$:
$
  P_0 &= 1 = p_0\
  P_1 &= x = p_1\
  P_2 &= 1 / 2 (3x^2-1) = 3 / 2p_2 -1 / 2p_0\
  P_3 &= 1 / 2 (5x^3-3x) = 5 / 2p_3 - 3 / 2p_1\
$

==== They span $cal(P_4)$:
$
  bold(x) in RR^4\
  "Let" q = x_0 P_0 + x_1 P_1 + x_2 P_2 + x_3 P_3\
  = x_0 p_0 + x_1 p_1 + x_2 (3 / 2p_2 -1 / 2p_0) + x_3(5 / 2p_3 - 3 / 2p_1)\
  = (x_0 - 1 / 2x_2)p_0 + (x_1-3 / 2 x_3) p_1 + (3 / 2x_2)p_2 + (5 / 2 x_3)p_3
$
Therefore $q$ can be expressed as a linear combination of Monomes $p_(0-3)$ and $therefore q in cal(P_4)$.

$cal(P_4)$ can be shown to be a subset of $"Span"{P_0, P_1, P_2, P_3}$ in the same manner.

==== They are linearly independent:
If the 0 vector is the only solution for $bold(x)$, they are linearly independent.
$
  bold(x) in RR^4\
  x_0 P_0 + x_1 P_1 + x_2 P_2 + x_3 P_3 = 0\
  (x_0 - 1 / 2x_2)p_0 + (x_1-3 / 2 x_3) p_1 + (3 / 2x_2)p_2 + (5 / 2 x_3)p_3 = 0
$
The Monomes have already been proven to be linearly independent in Dr Gradinaru's script, hence:
$
  x_0 - 1 / 2x_2 &= 0\
  x_1-3 / 2 x_3 &= 0\
  3 / 2x_2 &= 0\
  5 / 2 x_3 &= 0\
$
As a Lineare Gleichungs System:
$
  mat(1, 0, -1/2, 0;0, 1, 0, -3/2;0, 0, 3/2, 0;0, 0, 0, 5/2) vec(x_0, x_1, x_2, x_3) = 0
$
This matrix has full rank and therefore only has the trivial solution (0) for $bold(x)$.

Therefore these Legendre Polynomials are linearly independent and their Bild is equal to $cal(P_4)$, meaning they are a basis for the space $RR_3[x] qed$.
