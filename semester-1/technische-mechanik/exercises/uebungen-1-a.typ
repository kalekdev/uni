= Technische Mechanik - Uebungen 1

1) i. $
bold(r_P)(t) &= vec((6L)/5+L/4 cos pi t, (6L)/5+L/4 sin pi t )\
bold(v_P)(t) &=d(r_P(t))/(d t) &= vec((-pi L sin(pi t))/4, (pi L cos(pi t))/4)
$
ii. $
    v_p &= sqrt(((-pi L sin(pi t))/4)^2 + ((pi L cos(pi t))/4)^2)\
    &= sqrt((pi^2 L^2 sin^2(pi t)) / 16 + (pi^2 L^2 cos^2(pi t)) / 16)\
    &= (pi^2 L^2 ) / 16
  $
iii. Circle with radius $L/4$ and center $(6L/5, 6L/5)$.

2) $
x(t) &= a t\
t &= x/a\
y(t) &= b - a^2/b t^2 \
y(x) &= b - a^2/b x^2/a^2 = b-x^2/b\
y(t=0) &= b therefore not D\
y(x=a) &= b-a^2/b\
y(x=b) &= b-b^2/b= 0 therefore "The answer is B"\
$

3) Polar: $
rho(t) &= L_0 + a t\
phi(t) &= ohm t\
d(phi(t))/(d t) &= ohm\
bold(r) &= rho e_rho\
bold(v_A) &= d(bold(r))/(d t) = d(L_0 + a t)/(d t)e_rho + (L_0+a t) d(e_rho)/(d t)\
 &= a e_rho + (L_0+a t)dot(phi)e_phi\
 &= a e_rho + (L_0+a t)ohm e_phi\
$
Cartesian: $
 x &= rho cos(phi) = (L_0 + a t)cos(ohm t)\
 y &= rho sin(phi) = (L_0 + a t)sin(ohm t)\
bold(r) &= x e_x + y e_y\
bold(v_A) &= (-(L_0 + a t)ohm sin(ohm t) + a cos(ohm t))e_x + ((L_0 + a t)ohm cos(ohm t) + a sin(ohm t)) e_x\
$

4) Geschwindigkeit: $
bold(r) &= sqrt(3)/3 (1-cos mu t) e_rho + (3-cos mu t)e_z\
dot(e_rho) &= dot(phi)e_phi = sqrt(3) mu e_phi\
dot(r) &= sqrt(3)/3 mu sin(mu t) e_rho + sqrt(3)/3(1-cos mu t) dot(e_rho) + mu sin(mu t)e_z\
 &= sqrt(3)/3 mu sin(mu t) e_rho + sqrt(3)/3(1-cos mu t)sqrt(3)mu e_phi + mu sin(mu t)e_z\
 &= sqrt(3)/3 mu sin(mu t) e_rho + (1-cos mu t) mu e_phi + mu sin(mu t) e_z
$
Schnelligkeit:
$
  abs(dot(r)) &= sqrt((sqrt(3)/3 mu sin(mu t))^2  + ((1-cos mu t) mu)^2 + (mu sin(mu t))^2)\
  &= sqrt(1/3mu^2sin^2(mu t) + mu^2(1-2cos(mu t)+cos^2(mu t)) +mu^2 sin^2(mu t))\
  &= sqrt(mu^2(1/3sin^2(mu t) + 1-2cos(mu t)+cos^2(mu t) + sin^2(mu t)))\
  &= mu sqrt(1/3sin^2(mu t) + 2-2cos(mu t))\
$
Um die Geschwindigkeit in Kartesische Koordinaten zu finden, man kann einfach die einheits Vektoren durch die Kartesische Aequivelanten ersetzen, so dass man nicht nochmal ableiten muss.

Die Schnelligkeit soll gleich sein.

5) $
v(t_1) &= (d x) / (d t) (t_1) e_x +(d y) / (d t) (t_1) e_y\
d(a (x(t))^2)/(d t) &= 2a x(t) dot(x(t))\
 &= 1e_x + (2a x(t) dot(x(t)))e_y = 1 e_x + 2a e_y\
abs(v(t_1)) &= sqrt(1^2 + (2a)^2)
 &= sqrt(1+4a^2)
$
