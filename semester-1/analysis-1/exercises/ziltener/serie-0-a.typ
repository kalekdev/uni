= Analysis 1 - Serie 0

1. Graphen von Funktionen und Mengen
ii. Sie sind inversen einander und deshalb reflektiert ueber $x=y$

2. Ableitung
i. a) $
  f(x) := x^2\
  f'(x) = 2x
$
b) $
  f(y) := y^2\
  f'(y) := 2y\
$
c) $
  f(x) := e^x\
  f'(x) := e^x\
$
d) $
  u = x^2\
  f(x) := e^(x^2) = e^u\
  (d y)/(d x) = (d y)/(d u) (d u)/(d x)\
  f'(x) := 2x e^(x^2)
$

ii. a) 0 b) 0 c) 1 d) 0

3. Integral
i. a) $
  integral_0^1 x d x &= [x^2/2]_0^1\
                     &= (1/2) - 0 = 1/2
$
b) $
  integral_0^1 x e^(x^2) d x &= [(e^(x^2))/2]_0^1\
                             &= (e/2) - 1/2 = (e-1)/2
$
c) $
  integral_(-1)^1 abs(x) d x &= 2 integral_0^1 x d x\
                             &= 1
$
c) $
  integral_(-1)^1 abs(y) d y &= integral_(-1)^1 abs(x) d x\
                             &= 1
$

ii. $
  f(x)  &:= integral_1^x cos(x) d x = [sin(x)]_1^x\
        &= sin(x) + sin(1)\
  f'(x) &= cos(x)
$

iii. $
  cos(pi/2) = 0
$

4. i) fuer jedes
ii) wahr iii) wahr iv) falsch v) wahr vi) falsch

5. Mengen
i. a) 0 b) 1 c) 2 d) 2

ii. $
  (x+2)(x-1) = 0\
  "Antwort:" {1, -2}
$

6 Folge, Konvergenz, Grenzwert i. $
  0^2, 1^2, 2^2, 3^2, 4^2, 5^2\
  0, 1, 4, 9, 16, 25
$

ii. $
  0+1, 1+1, 2+1, 3+2, 5+3, 8+5\
  1, 2, 3, 5, 8, 13
$

iii. a) $
  lim_(n->oo) n^2 = oo
$
b) $
  lim_(n->oo) 1/n = 0
$
c) $
  lim_(n->oo) (n+1)/(n+2) = 1
$

7 Summe, Induktion

i. $
  1 + 2 + 3 + 4 = 10
$

iii. Es gilt fuer $n=1$:
$
  1 = (1(1+1))/2
$
Voraussetzung: Es gilt fuer $n in NN$
$
  sum_(i=1)^n i = (n(n+1))/2
$
Es gilt auch fuer $n+1$
$
  sum_(i=1)^(n+1) i &"soll gleich" ((n+1)(n+1+1))/2 = ((n+1)(n+2))/2 "sein"\
  sum_(i=1)^(n+1) i &= sum_(i=1)^n i + (n+1)\
                    &= (n(n+1))/2 + (2(n+1))/2\
                    &= ((n+1)(n+2))/2
$
So ist es fuer $n in NN$ bewiesen.

iv. $
  sum_(i=1)^oo 1/2^(i-1) = sum_(i=1)^oo 2/2^i = 2sum_(i=1)^oo 1/2^(i)\
$
Das ist eine geometrische Reihe mit $a=1/2, r=1/2$. $S_oo$ davon ist:
$
  sum_(i=1)^oo 1/2^(i)  &= (1/2)/(1-1/2) = 1/(2-1) = 1\
  2sum_(i=1)^oo 1/2^(i) &= 2 dot 1 = 2
$
Die Antwort ist 2.

