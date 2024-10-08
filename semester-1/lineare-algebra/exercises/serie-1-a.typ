= Lineare Algebra - Serie 1

1. $
    bold(A x = b)\
    mat(1, 1, 2, 2;1, 2, 3, 4;1, 3, 6, 10;1, 4, 10, 20) vec(x_1, x_2, x_3, x_4) = vec(b_1, b_2, b_3, b_4)\
    "Gaussische Elimination:"\
    mat(1, 0, 0, 0;0, 1, 0, 0;0, 0, 1, 0;0, 0, 0, 1) mat(
  augment: #4,
  1, 1, 2, 2, b_1;1, 2, 3, 4, b_2;1, 3, 6, 10, b_3;1, 4, 10, 20, b_4)\
    mat(1, 0, 0, 0;1, 1, 0, 0;1, 0, 1, 0;1, 0, 0, 1) mat(
  augment: #4,
  1, 1, 2, 2, b_1;0, 1, 1, 2, b_2-b_1;0, 2, 4, 8, b_3-b_1;0, 3, 8, 18, b_4-b_1)\
    mat(1, 0, 0, 0;1, 1, 0, 0;1, 2, 1, 0;1, 3, 0, 1) mat(
  augment: #4,
  1, 1, 2, 2, b_1;
  0, 1, 1, 2, b_2-b_1;0, 0, 2, 4, b_3-b_1-2(b_2-b_1);0, 0, 5, 12, b_4-b_1-3(b_2-b_1))\
    mat(1, 0, 0, 0;1, 1, 0, 0;1, 2, 1, 0;1, 3, 5/2, 1) mat(
      augment: #4,
      1, 1, 2, 2, b_1;0, 1, 1, 2, b_2-b_1;0, 0, 2, 4, b_3-b_1-2(b_2-b_1);0, 0, 0, 2, b_4-b_1-3(b_2-b_1)-5/2(b_3-b_1-2(b_2-b_1)))\
    mat(
      augment: #4,
      1, 1, 2, 2, b_1;0, 1, 1, 2, b_2-b_1;0, 0, 2, 4, b_3-3b_1-2b_2;0, 0, 0, 2, b_4-b_1-3b_2-3b_1 -5/2b_3+5/2b_1+5b_2-5b_1)\
    "TODO: Attempt to reach identity matrix, the protokol matrix should be the inverse"\
    2x_4 = b_4 -6.5b_1+2b_2-5 / 2b_3\
    2x_3 = b_3-3b_1-2b_2-4(b_4 -6.5b_1+2b_2-5 / 2b_3)\ = 23b_1 -10b_2 +11b_3 -4b_4\
    x_2 = b_2 - b_1 -1 / 2(23b_1 -10b_2 +11b_3 -4b_4) -(b_4 -6.5b_1+2b_2-5 / 2b_3)\ = -6b_1 +4b_2-3b_3+b_4\
    x_1 = b_1 -(-6b_1 +4b_2-3b_3+b_4) -(23b_1 -10b_2 +11b_3 -4b_4) -(
      b_4 -6.5b_1+2b_2-5 / 2b_3
    )\ = -9.5b_1 +4b_2 -5.5b_3 +2b_4\
    bold(B) = mat(
  -9.5,4,-5.5,2;
  -6,4,-3,1;
  23/2,-5,11/2,-2;
  -3.25,1,-5/4,1/2
)\
  $
$
  bold(B b = x)\
  mat(
  -9.5,4,-5.5,2;
  -6,4,-3,1;
  23/2,-5,11/2,-2;
  -3.25,1,-5/4,1/2
) vec(1,3,2,2) = vec(x_1, x_2, x_3, x_4) = vec(-4.5, 2,3.5,-1.75)
$
There is an arithmetic error somewhere in the above calculations, which would take too much time to find in relation to how much it would teach me.

8. $
    &mat(augment: #2,
 -1/2,-1,1;
  2,2,2)\
    &mat(augment: #2,
 -1/2,-1,1;
  0,-2,6)\
    x_2 &= -3\
    x_1 &= -2(x_2+1) = -2(-2) = 4
  $

9. $
    &mat(augment: #3,
 1,2,-2,3;
 0,1,3,2;
 0,0,1,3)\
    &mat(augment: #3,
 1,2,-2,3;
 0,1,0,-7;
 0,0,1,3)\
    &mat(augment: #3,
 1,0,-2,17;
 0,1,0,-7;
 0,0,1,3)\
    &mat(augment: #3,
 1,0,0,23;
 0,1,0,-7;
 0,0,1,3)\
    "Answer" = vec(23,-7,3)
  $
