= Bridging Test Answers
\

// Manual numbering in case questions are skipped / appended
1. Considering the equation of a straight line, $y = m x + c$, the answer requires
  a positive gradient (m) and positive y intercept (c).

  Therefore the answer must be b, $y = 1/10 x + 3/2$.

2. $ a, b in RR_(>0) $
  a) $ 1/(a+b) = 1/a + 1/b $\
  We can see this is impossible by testing it with $a, b=1$, which yields $1/2!=2$.

  However, for the purposes of practicing typst: $
    1/(a+b)         &= b/(a b) + a/(b a)\
    1/(a+b)         &= (a + b)/(a b)\
    1               &= ((a+b)^2)/(a b)\
                    &= (a^2 +2 a b + b^2)/(a b)\
    a^2 + a b + b^2 &= 0
  $
  To satisfy the above equation, $a b<0$, which is impossible considering they are
  both positive reals. Therefore _a_ is *not* a valid equation.

  b) $ sqrt(a+b) = sqrt(a) + sqrt(b) $\
  Once again, this is impossible when tested with $a, b=1$, resulting in $sqrt(2)=2$.
  Mathematical proof: $
    a+b &= (sqrt(a) + sqrt(b))^2\
        &= a+sqrt(a b)+b\
    a b &= 0
  $
  Either a or b must be equal to zero to satisfy the above equation and _b_ is
  therefore *not* a valid answer.

  c) $
    (a+b)(c+d) &= a c + b d\
               &= (a+b)(c+d)-a d -b d\
    0          &= a d+b d\
               &= a+b
  $
  Either a and b are both 0 or one of them must be negative, therefore _c_ is
  *not* a valid answer.

  d) $
    ln(a+b) &= ln(a)+ln(b)\
            &= ln(a b)\
    a+b     &= a b
  $
  This is not true for the entire set in which a and b exist, therefore the answer
  is _e) Keine_.

3. $f(x)=x-2$ is a horizontal straight line with y intercept -2 and gradient 1. It
  equals 3 when $x = cases(5, -1)$ due to the surrounding $abs("")$. When plotting
  a sketch of the graph, we can see that $y<=3$ between $-1<=x<=5$.

  Therefore the answer is _e) Keine der obigen Antworten ist richtig_.

4. $
    "for" a, b > 0\ ln(a^4b^2)-ln(a^2b^(-2)) &= ln((a^4b^2)/(a^2b^(-2)))\
                                             &= ln(a^2b^4)
  $

  The answer is _d) $ln(a^2b^4)$_.

5. $
    ln(e) = 1\
    ln(1/e) = ln(e^(-1)) = -1\
    e^2 < 3^2\
    1 < e\
    -1<1/e<1\
  $

  Therefore the correct answer is _c)_ $ln(1/e) < 1/e < ln(e) < e < e^2 < 9 = -1 < 1/e < 1 < e < e^2 < 9$

6. The answer is _a)_ $g(x) = (x-2)^3$.

7. Let the vertices of triangle be called A, B and C, where A and C are the bottom
  corners.

  Since $angle C A B$ is $pi/3$ and it is an isoceles triangle, $angle A C B$ and
  therefore also $angle A B C$ are $pi/3$. Hence, side $A C$ is also 1 unit long.

  $ sin(angle x) = "opposite"/"hypotenuse" $

  According to Pythagoras' theorem, $1^2 = (1/2)^2 + "opposite"^2$.

  $
    "opposite" = sqrt(1 - 1/4) = sqrt(3/4) = sqrt(3)/2\
    sin(pi/3) = (sqrt(3)/2)/1 = sqrt(3) / 2
  $

  The answer is _d)_.

8. $
    n         &in NN\
    sin(pi n) &= 0\
    cos(pi n) &= cases(  &1 "if" n "is even", -&1 "if" n "is odd")
  $

  Therefore the answer is _b)_ $cos(2021 pi) < sin(2021 pi) < cos(2020 pi) = -1 < 0 < 1$.

9. $ sin^2(x) + cos^2(x) = 1 $

  Therefore the answer is _b)_.

10. The period of $sin(theta)$ is $2 pi$.

  $
    2 pi &= 2 x\
    x    &= pi
  $

  The answer is _d)_.

11. $
    f'(x)  &= 3/4x^(-1/4)\
    g'(x)  &= 4/5x^(-1/5)\
    f''(x) &= -3/16x^(-5/4)\
    g''(x) &= -4/25x^(-6/5)\ \

    #let f(x) = {
      -3 / 16 * calc.pow(x, (-5 / 4))
    }
    f''(1) &= #f(1)\

    #let g(x) = {
      -4 / 25 * calc.pow(x, (-6 / 25))
    }
    g''(1) &= #g(1)
  $

  At $x=1$ the second derivative of both is negative, hence they are both concave
  downards. The derivative is decreasing at a greater rate for $f(x)$, therefore
  the answer is _c)_.

12. $
    (2n^3-1)/(10n^3+n+21)                            &= (2n^3(1-1/(2n^3)))/(2n^3(5+1/(2n^2)+21/(2n^3)))\
    lim_(n -> oo)(1-1/(2n^3))/(5+1/(2n^2)+21/(2n^3)) &= 1/5
  $

  The answer is _d)_ $1/5$.

13. $
    sum_(k=0)^n (-1)^k/2^k = sum_(k=0)^n (-1/2)^k\
    #{
      let term(k) = calc.pow(-1, k) / (calc.pow(2, k))
      for i in range(0, 6) {
        [#term(i)
          ,]
      }
    }
  $
  It is an arithmetic series with first term 1 and common ratio $-1/2$.
  $
    S_oo &= a/(1-r)
         &= 1/(1+1/2)
         &= 2/3
  $
  Therefore the answer is _b)_ $2/3$.

14. $
    (sqrt(2+h) - sqrt(2))/h times (sqrt(2+h)+sqrt(2))/(sqrt(2+h)+sqrt(2)) &= h/(h sqrt(2+h) + h sqrt(2))\
                                                                          &= 1/(sqrt(2+h)+sqrt(2))\
    lim_(h->0)1/(sqrt(2+h)+sqrt(2))                                       &= 1/(2sqrt(2))
  $
  Therefore the answer is _b)_ $1/(2sqrt(2))$.

15. The answer is _e)_.

16. According to the product rule, $(f dot g)'(x)=f'(x)g(x) + g'(x)f(x)$
  $
    2 times 3 + 4 times 1 = 10
  $
  The answer is _d)_ 10.

17.
  Chain rule:
  $ (d f(x))/(d u) = (d f(x))/(d u) (d u)/(d x) $

  $
    f(x)  &= e^(2x)\
    u     &= 2x\
    f(x)  &= e^u\
    f'(x) &= 2e^u = 2e^(2x)
  $
  The answer is _c)_ $2e^(2x)$.

18. $
    0 <= sin x <= 1\
    u           &= sin x\
    (d u)/(d x) &= cos x\
    f(x)        &= ln(u)\
    f'(x) = 1/u cos x = (cos x)/(sin x)
  $
  The answer is _b)_ $(cos x)/(sin x)$.

19. $
    d((e^x + e^(-x))/2)/(d x) &= 1/2 d(e^x + e^(-x))/(d x) = (e^x - e^(-x))/2 = sinh(x)
  $
  The answer is _a)_ $sinh(x)$.

20. $
    u              &= 3x\
    f(x)           &= -cos(u)\
    (d f(x))/(d x) &= 3sin(u) = 3sin(3x)\
    sin((3 pi)/2)  &= -1
  $
  Therefore the tangent at $pi/2$ is $3 times -1 = -3$. The answer is _a)_.

21. At 5, the function crosses the x axis. As the gradient remains negative
  throughout this interval, $f(4) > 0 "and" f(6) < 0$. The answer is _d)_.

22. $
    integral_0^2 3x^2 d x &= [x^3]_0^2 \
                          &= 2^3 - 0^3 = 8
  $

23. $
    integral_0^1 e^(-2x) d x &= [-e^(-2x)/2]_0^1\
                             &= (-(e^(-2))/2) - (-e^0/2)\
                             &= -1/(2e^2) + 1/2\
                             &= 1/2 - 1/(2e^2)
  $
  The answer is _e)_ $1/2 - 1/(2e^2)$.

24.
  a) $
    integral_0^(pi/2) cos(2x) &= [-2sin(2x)]_0^(pi/2)\
                              &= (-2sin(pi)) - (-2sin(0))\
                              &= 0 + 0 = 0
  $
  b) $ integral_0^(pi/2) cos^2(x) &=[-2sin(x)cos(x)]_0^(pi/2) $
  c) $ integral_0^(pi/2) sin(2x) &=[2cos(2x)]_0^(pi/2) $
  d) $ integral_0^(pi/2) sin^2(x) &=[2sin(x)cos(x)]_0^(pi/2) $

  The answer is _a)_ $integral_0^(pi/2) cos(2x)$.

25. $
    A   &= integral_0^1 cos(x)d x = [sin(x)]_0^1\
        &= (sin(1)) - (sin(0)) = sin(1)\
    B   &= integral_0^(-1) cos(x)d x = [sin(x)]_0^(-1)\
        &= (sin(-1)) - (sin(0)) = sin(-1) = -sin(1)\
    A/B &= -sin(1)/sin(1) = -1
  $
  The answer is _b)_ -1.

26. $
    f(x) &= m x\
    F(b) &= integral_0^b f(x) d x = m/2 x^2 + c
  $
  After the point _c_, the area remains constant. The area under the graph
  increases in a linear fashion. Before, it is a quadratic function. Therefore the
  answer is _c)_.

27. $
    integral_0^1 x d x &= [(x^2)/2]_0^1\
                       &= (1/2) - 0 = 1/2
    "Total area"       &= 1/2 times 2 = 1
  $
  The answer is _b)_ 1.

28. According to the Fundamental Theorem of Calculus, $f'(x)=sin(x)$. The answer is _d)_.

29. _c)_ $limits(w)^(->)$.

30. $
    1(x-1) + 2(y-1) + 3(z-1) &= 0\
    x-1 +2y -2 +3z-3         &= 0\
    x +2y +3z                &= 6
  $
  The answer is _b)_ $x +2y +3z = 6$.

31. $
    arrow(v) times arrow(w) = vec(-5, 7, 9) times vec(1, 1, lambda) &= vec(0, alpha, beta)\
    mat(delim: "|", hat(i), hat(j), hat(k);-5, 7, 9;1, 1, lambda)   &= vec(7lambda-9, ..., ...)\
    7lambda -9                                                      &= 0\
    lambda                                                          &= 9/7\
    arrow(w) times arrow(v) = vec(1, 1, lambda) times vec(-5, 7, 9) &= vec(0, gamma, delta)\
    mat(delim: "|", hat(i), hat(j), hat(k);1, 1, lambda;-5, 7, 9)   &= vec(9-7lambda, ..., ...)\
    9-7lambda                                                       &= 0\
    lambda                                                          &= 9/7
  $
  The answer is _b)_ $9/7$.

32. $
    arrow(O P)                     &= t arrow(v) = vec(2.5t, 1.25t)\
    abs(arrow(O P))                &= sqrt(5) = sqrt((2.5t)^2+(1.25t)^2)\
    5                              &= 6.25t^2+1.5625t^2\
    5/7.8125                       &= t^2\
    t                              &= 0.8\
    arrow(O P)                     &= vec(2, 1)\
    arrow(P u)                     &= -arrow(u) + arrow(O P) = vec(1, 1-b)\
    arrow(P u) dot arrow(v)        &= 0\
    vec(1, 1-b) dot vec(2.5, 1.25) &= 2.5 + 1.25 - 1.25b = 0\
    3.75 / 1.25                    &= b\
    b                              &= 3
  $
  The answer is _b)_ 3.
