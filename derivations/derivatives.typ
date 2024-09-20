== Derivative of $a^x, a in RR$:
$
  lim_(h->0) (a^(x+h)-a^x)/(h) &= lim_(h->0) (a^x a^h-a^x)/(h)\
                               &= a^x lim_(h->0) (a^h-1)/(h)\
                               &= a^x ? "would need l'hopitals rule, nvm"
$
Instead:
$
  a^x            &= (e^(ln a))^x = e^(x ln a)\
  "Ketten regel:"\
  (d(a^x))/(d x) &= e^(x ln a) ln a = a^x ln a
$

== Ableitung von $f(x) = tan(x)$:
$
  tan(x)                       &= sin(x)/cos(x)\
  d(sin(x) dot 1/cos(x))/(d x) &= d(sin(x))/(d x) dot 1/cos(x) + sin(x) dot d(cos(x)^(-1))/(d x)\
                               &= cos(x)/cos(x) + sin(x) dot (-cos^(-2)(x) dot -sin(x))\
                               &= 1 + sin(x) dot sin(x)/(cos^(2)(x))\
                               &= 1+ tan^2(x)\
  sin^2(x) + cos^2(x) = 1\
  tan^2(x) + 1 = 1/(cos^2(x))  &= sec^2(x)\
$

== Ableitung von $f(x) = ln(x)$ durch Umkehrregel:
$
  f(x) = ln(x)\
  f^(-1)(x) = e^x\
  f'(x)                 &= 1/(f^(-1)'(f(x)))\
  f^(-1)(f(x))          &= e^ln(x)\
  d(e^ln(x))/(d (f(x))) &= e^ln(x) = x\
  f'(x)                 &= 1/x
$
#pagebreak()
== Ableitung von $f(x) = arcsin(x)$ durch Umkehrregel:
$
  f(x)  &= arcsin(x)\
  f'(x) &= 1/(d(sin(arcsin(x)))/(d (arcsin(x))))\
$
IMPORTANT: We shouldn't simply change $sin(arcsin(x))$ to x, because $x$ cannot
be treated as a constant here, it is a function of $arcsin(x)$ which we are
differentiating with respect to.
$
    &= 1/(cos(arcsin(x)))\
    &= 1/(sqrt(1-sin^2(arcsin(x))))\
    &= 1/(sqrt(1-x^2))
$
