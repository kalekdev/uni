#heading(outlined: false)[Digitaltechnik]

#outline()

_MSB_ - Most significant bit\
_LSB_ - Least significant bit

$x % 1$ - drop decimal value from $x$.\
$2^n$ - number of possible states with $n$ bits.\


=== Resistance of a wire
$rho$ - resistivity of the metal ($ohm m$)\
$l$ - length of the wire\
$A$ - cross sectional area of the wire\
$R=(rho l) / A$

Modern electronics uses 0.8V as high.

_Floating Voltage_ - when a pin / contact is not connected by a "normal" (lower than that of air) resistance to V_DD / circuit ground. Essentially the same as any conductive surface in the room, on which a very weak 50Hz signal is usually seen due to induction from all the EM sources in the room.

#pagebreak()

== Schaltfunktionen
_Schaltfunktion_ - $Y = f(X_0, X_1, X_2, ..., X_(N-1))$ - Nimmt mehrere Bits als Input und produziert eine einzige Bit als Ausgang.

Alle Schaltfunktionen lassen sich als einer Wahrheitstabelle darstellen mit mindestens $N+1$ Spalten und $2^N$ Zeilen, wo N ist der Nummer von Inputs.

NOT'ing a gate usually means the resistor just needs to be moved before the transistors (essentially appending a NOT gate).

*OR* - Disjunction

*AND* - Conjunction - The resistor after the output point is needed to prevent a short circuit when both inputs are high.

*Antivalenz (XOR)* - High if only one of the inputs is high.

*XNOR* - High if both inputs are the same, gate symbol is a =.

== CMOS (Complementary Metal Oxide Semiconductor) Technology
_Transistor_ - Trans-Resistor (changable resistor)\
_MOS Transistor_ - Electronic component with contacts *S* ource, *D* rain und *G* ate. Charge carriers flow from S to D. They are always controlled through a voltage between Gate and Source (unlike a current with BJT) and is therefore more efficient for very low / high power applications. They are also easier to etch in ICs and are therefore predominantly used in logic circuits.

Although very high pull up resistors vastly reduce power loss when using a single MOS transistor, such large resistances are difficult to fabricate in ICs. CMOS uses a PMOS instead which has practically $oo$ resistance when "open".

$abs(V_(G S)) < abs(V_(t h)), R_(S D) -> oo$ - The transistor is off\
$abs(V_(G S)) > abs(V_(t h)), R_(S D) -> 0$ - The transistor is on

_N-Type (NMOS)_ - Threshold voltage is positive. Negative electrons flow from S to D (Hence D is connected to the positive terminal in a circuit)\
_P-Type (PMOS)_ - Threshold voltage is negative. Positive Holes flow from S to D. Circle at the gate in symbol.

- CMOS Gatter müssen aus genau so vielen NMOS und PMOS Transistoren bestehen
- Bei m Eingängen gibt es m NMOS und m PMOS transistoren

The $V_D$ of an "off" MOS transistor is floating (undefined) unless it is pulled up / down.

A CMOS gate can be split into two networks / Pfads:
#table(
  columns: 3,
  table.header([], [Pull-up], [Pull-down]),
  [MOS Type], [PMOS], [NMOS],
  [NAND], [Parallel], [Series],
  [NOR], [Series], [Parallel],
)
These can be converted between one another by breaking the circuit into parallel / series blocks until each block contains one transistor, then switching the type of transistor and connecting them again in the opposite manner (parallel $<=>$ series). V_DD becomes the output and the output becomes ground.

=== Switching Delays
- $t_(p H L), t_(p L H)$ - Propogation delay - Time taken between a 50% change in the input voltage leading to a 50% change in the output
- $t_(t H L) (t_"fall"), t_(t L H) (t_"rise")$ - Time between the output rising / falling between 10% and 90% voltage
$t_d = (t_(p H L) +t_(p L H)) / 2$ - Average switching time, easier to work with in practice

== Boolean Algebra
The following properties apply to an expresion only containing AND / OR gates:
- Commutative, order does not matter
- Associative, grouping / order of (the same) operations is irrelevant
- Distributive, $A and (B or C) = (A and B) or (A and C)$

Some not so obvious axioms of boolena algebra:
- $A or (A and B) = A = A and (A or B)$ - consider the effect on the whole circuit when the outer variable is high / low
- $(A and B) or (not A and B) = (A or B) and (not A or B) = B$ - Neighbourhood law

=== Order of Operations
1. Brackets
2. Negation
3. AND, NAND, OR, NOR
4. XOR, XNOR

An expression with missing brackets is ambiguous and invalid.

=== De Morgan's Laws
$
  not (A and B and C and ...) equiv not A or not B or not C or...\
  not (A or B or C or ...) equiv not A and not B and not C and ...
$

The conversion between the pull up and pull down expression in a CMOS circuit uses De Morgan's laws:
#align(center, image("images/pu-pd-demorgan.png", width: 50%))

=== Universal Gates
Any logic circuit can be expressed using only NAND / NOR gates. This is very advantageous as all gates in the circuit would have the same timing properties, reducing costs and errors.

To convert a logical expression into NAND / NOR, double negation + De Morgan's laws can be used, for example:
$
  A and B equiv ?\
  not not A and B equiv not not A or not B\
  not A "NOR" not B equiv (A "NOR" A) "NOR" (B "NOR" B)
$

=== Min / Maxterms
For $n$ variables there are $2^n$ possible min / maxterms:
- Minterm: Expression that outputs 1 for *one* specific combination of inputs, if we want 1 only when A low, B High, minterm: $not A and B$
- Maxterm: Expression that outputs 0 for *one* specific combination of inputs, if we want 0 only when

Let us consider we want expressions that output high / low only when $A=0, B=1$:
- Minterm: $not A and B$, high only in this case
- Maxterm: $A or not B$, low only in this case

== Normal Forms
A way of expressing a boolean expression that can easily be determined from the desired truth table (and later simplified). After constructing either a list of minterms for each 1 in the output, or list of maxterms for each 0:
- Disjunctive Normal Form - Minterms joined using disjunctions (OR)
- Conjunctive Normal Form - Maxterms joined using conjunctions (AND)

Both result in the same output, DNF is more comfortable to use in Karnaugh diagrams.

== Karnaugh Diagrams
TODO: Used to simplify a DNF / KNF, systematic way instead of boolean algebra, therefore useful for functions with many variables
Easier to use with DNF (Minterms)
Simply a graphic way of using the neighbour simplification rule:
$(not A and not B) or (A and not B) = not B$

The packets must contain $2^n$ cells!
Create packets using the largest possible rectangle with 1s, remove the variable that doesn't change

packets may overlap and "pacman" over the border (even diagonally!), but not take non rectangle shapes

3+ variable diagrams are split so that moving in any one step from a cell, only one variable changes
4+ variables needs two+ layers, which need to be simultaneously simplified

_Don't care_ - Combinations of inputs for which the output doesn't matter, for example extra numbers in a boolean counting system. Marked with an X in a Karnaugh Diagram. The X's can be treated as 1s when creating packets if it reduces the amount of packets (and therefore AND gates) in the simplified expression.

Static hazards (TODO: Define) can be recognized in Karnaugh diagrams: where two paackets are orthogonally next to each other but do not overlap. They can be directly fixed by introducing an extra packet two join the place of the hazard.
Lectures 1-4 (inclusive) in the test next week

== Number Systems
_Base (Radix)_ - b-adischen Reiehen like in analysis, negative indices of the base for defining decimals

_Hexadecimal_ - Uses digits $0-9$ and $A-F$ for 16 possible digits in total. Used to represent binary numbers in a more compact format by splitting a binary number into groups of 4 digits

_Octal_ - Radix 8, can be converted from binary using groups of 3 binary digits.

=== Converting Decimal to Radix R
+ Perform whole number division of the decimal $D$ by the Radix $R$: $D/R = Q_0 + r_0$, the remainder is the first digit in the target radix
+ Divide the result of the previous whole-number division $Q_0$ by the radix R again, this remainder is now the second digit in the target radix and so on
+ Continue until $Q_i$ reaches 0

=== Converting $0 <= D_(10) < 1$ to Radix R
This is the same process but the decimal is multiplied by the radix R and the resulting product is used in the next multipliciation. The current digit is the floor of TODO: Coefficients?, starting with the most significant bit.

Only possible for a finite number of decimal digits.

== Signed Binary Numbers
- Signing bit
- 1s complement
- 2s complement: Advantageous for performing arithmetic with signed numbers as the sign remains accurate

=== 2s Complement
TODO: Screenshot from script (Konstruktion von 2er-Komplementen)
How it can be converted back into decimal, either convert to positive then calculate or use first bit (sign) as $-(2)^n$ and the others as positive binary digits

Fractional numbers still have $plus.minus 2^0$ as the signing bit, converted in the same way. In the case of a whole + fractional number only the first bit is a signing bit

IMPORTANT: Do not forget signing bit for positive numbers

== Binary Arithmetic
Addition of two binary numbers, with maximum $n$ digits has at most $n+1$ bits in the result

Binary subtraction can be written as the addition of 2s complement numbers

== Encoding
Tetraden / Nibble - groups of 4 bits

Many different ways to encode 10 numbers, each has their advantages / disadvantages. Gray / O'Brien useful for counting TODO: Why?

=== Parity Bit
Additional bit representing if the number of 1s in a word / block is odd / even TODO: Double check

An extra word can be sent with the purpose of checking and also correcting previous words


