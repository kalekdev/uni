== Zeigen Sie, dass die linear unabhängige Eigenvektoren einer normalen Matrix orthogonal sind:

$
  "Eine Matrix ist normal" <=> bold(A^T A = A A^T)
$

Wir wollen zeigen, dass die Eigenvektoren verschiedener Eigenwerten von $bold(A)$ orthogonal zueinander sind. Nehmen wir an, dass es zumindest zwei nicht-null Eigenwerten $lambda_1$ und $lambda_2$ mit dazugehörige Eigenvektoren $bold(v_1)$ und $bold(v_2)$ von $bold(A)$ gibt. Zu zeigen:
$
  bold(A v_1) = lambda_1 bold(v_1)\
  bold(A v_2) = lambda_2 bold(v_2)\
  bold(v_1 perp v_2) <=> <bold(v_1\, v_2)> = 0
$

Sei $bold(A) in RR^(n times n)$ eine normale Matrix. Erstmall zeigen wir, dass die Kerne $bold(k)$ von $bold(A)$ und $bold(A^T)$ gleich sind:
$
  bold(k) in RR^n\
  bold(A k = 0)\
  bold(A^T A k = A A^T k = 0)\
  therefore bold(A^T k = 0)
$
Deswegen sind die Kerne gleich:
$
  "Kern" bold(A) = "Kern" bold(A^T)
$
Darüber hinaus dürfen wir sagen, dass die folgende Kerne auch gleich sind:
$
  bold((A - lambda I) k) = 0\
  bold((A - lambda I)^T k) = 0\
  bold((A^T - overline(lambda) I) k) = 0
$
Deswegen ist $bold(k)$ eine Eigenvektor von $bold(A)$ und $bold(A^T)$, wobei die dazugehörige Eigenwerte komplexe Konjugaten einander sind.

Das können wir jetzt schliesslich verwenden, um zu zeigen, dass $bold(v_1 perp v_2)$. Sei:
$
  (
    lambda_1 - lambda_2
  )<bold(v_1), bold(v_2)> &= <lambda_1 bold(v_1), bold(v_2)> -<bold(v_1), overline(lambda_2) bold(v_2)>\
  &= <bold(A v_1), bold(v_2)> -<bold(v_1), bold(A^T v_2)>\
  = 0
$
Da $lambda_1 equiv.not lambda_2$ folgt $<bold(v_1), bold(v_2)> = 0 qed$
