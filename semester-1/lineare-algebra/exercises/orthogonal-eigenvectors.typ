== Zeigen Sie, dass die linear unabhängige Eigenvektoren einer normalen Matrix orthogonal sind:

$
  "Eine Matrix ist normal" <=> bold(A^T A = A A^T) <=> "TODO: Not sure if i can say this Sie ist invertierbar"
$

Sei $bold(A) in RR^(n times n)$ eine normale Matrix. Erstmall zeigen wir, dass die Kerne von $bold(A)$ und $bold(A^T)$ gleich sind:
$
  bold(B = A^T A = A A^T)\
  bold("Kern" B = k\
  B k = 0)\
$
Was auch als
$
  bold((A^T A) k &= B k = 0)\
  bold(((A^T)^(-1) A^T A)k &= (A^T)^(-1)0)\
  bold(A k &= 0)\
$
und
$
  bold((A A^T) k &= B k = 0)\
  bold(A^T k &= 0)\
$
geschrieben werden kann.

Deswegen sind die Kerne gleich:
$
  bold(A k = A^T k = 0)\
  "Kern" bold(A) = "Kern" bold(A^T)
$
Dank der Fundamentalsatz der Linearen Algebra, dürfen wir sagen dass:
$
  "Kern" bold(A^T) perp "Bild" bold(A) therefore "Kern" bold(A) perp "Bild" bold(A)
$

Jetzt wollen wir zeigen, dass die Eigenvektoren verschiedener Eigenwerten von $bold(A)$ orthogonal zueinander sind. Nehmen wir an, dass es zumindest zwei nicht-null Eigenwerten $lambda_1$ und $lambda_2$ mit dazugehörige Eigenvektoren $bold(v_1)$ und $bold(v_2)$ von $bold(A)$ gibt. Es folgt:
$
  bold(A v_1) = lambda_1 bold(v_1) in "Bild" bold(A)\
  bold(A v_2) = lambda_2 bold(v_2) in "Bild" bold(A)\
  therefore bold(v_1\, v_2) perp "Kern" bold(A)
$
Es gibt ein $lambda_k$ so dass $norm(bold(v_k)) = 1$
Da $bold(A)$ invertierbar ist (todo ist es?), das Kern ist einfach nur das null vektor $bold(0)$.

$
  <bold(v_1\, v_2)> = 0 ?
$
