= Digitaltechnik - Übung 3

== 1.a
1. $
    Z = (A and overline(B and C)) or A or (B and C)\
    = A or ((A or (B and C)) and (overline(B and C) or (B and C)))\
    = A or (A or (B and C))\
    = A or (B and C)
  $
2. $
    Z = (A and overline(B and C)) or (A and overline(overline(B) or overline(C)))\
    = (A and overline(B and C)) or (A and B and C)
    = A
  $
3. $
    Z = (A and (B or C)) or (A and not C)\
    = A and ((B or C) or not C)\
    = A
  $
4. $
    Z = ((B and not C) and (A or not A)) or ((not B and C) and (A or not A))\
    = (B and not C) or (not B and C)
  $
5. $
    (A and (D or (not D and not C) or (C and not D))) or ((B and C) and (D or not A))\
    A or ((B and C) and (D or not A))\
    (A or (B and C)) and ((A or D) or (A or not A))\
    A or (B and C)
  $

=== b)
i. $
Z = (A and B) or (B and C)\
    overline(overline((A and B) or (B and C)))\
    "NAND": overline(overline(A and B) and overline(B and C))\
    overline((not A or not B) and (not B or not C))\
    overline(not B or (not A and not C))\
    "NOR": overline(not B or overline(A or C))\
  $
ii. $
 Z = A xor B\
 (not A and B) or (A and not B)\
 "NAND": overline(overline(not A and B) and overline(A and not B))\
 (A or B) and (not A or not B)\
 "NOR": overline(overline(A or B) or overline(not A or not B))
$

=== c)
Minterms:
$
  (not A and not B and not C) or (A and B and C)
$
#image("images/exercise-3-q-1-c.png", width: 40%)
Error: $>=1$

== 2.a
#image("images/exercise-3-q-2.png", width: 40%)

== b
Man müsste zumindest eine dritte state zu dem Steuereinheit hinzufügen, zum Beispiel durch 2 Bit Binary Kodierung.

== 3
a) #image("images/exercise-3-q-3.png", width: 80%)
b) $t_(p L H A Z) = 70"ns"$\
$t_(p H L A Z) = 40"ns"$
