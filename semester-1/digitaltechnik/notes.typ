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

Why digital instead of analog? Error correction.

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
A way of expressing a boolean expression that can easily be determined from the desired truth table (and then simplified using boolean algebra / Karnaugh diagrams). After constructing either a list of minterms for each 1 in the output, or list of maxterms for each 0:
- Disjunctive Normal Form - Minterms (ANDed variables) joined using disjunctions (OR)
- Conjunctive Normal Form - Maxterms (ORed negations) joined using conjunctions (AND)

Both result in the same output.

== Karnaugh Diagrams
Used to visually and systematically simplify boolean expressions instead of through often complicated boolean algebra manipulation. Furthermore, race conditions (hazards) can be easier identified using this method.

They are analogous to a truth table but represented as a matrix with $2^n$ elements, where $n$ is the number of inputs.

Simply a methodical way of using the neighbour simplification rule:
$(not A and not B) or (A and not B) = not B$

_Don't care_ - Combinations of inputs for which the output doesn't matter, for example additional unneeded numbers in a boolean counting system. Marked with an X in a Karnaugh Diagram. The X's can be treated as 1s or 0s when creating packets if it reduces the amount of packets (and therefore joining gates) in the simplified expression.

=== Method
- Construct a matrix with $2^n$ elements, where each side of the matrix represents the two states of a variable. One of each pair of variables facing opposite one another must be "split" so the neighbour rule can still be applied (See examples).
- Each element contains a 1 for each minterm (DNF) and the rest 0, or 0 for each maxterm (in this case the element headers are negated when allocating) and the rest as 1. _Don't Care_ conditions can be written as X when the output for a specific combination doesn't matter.
- Create packets (also known as blocks) using the largest possible rectangle with 1s / 0s (may include Xs as they fit best). The packets must contain $2^n$ cells!
- Packets may overlap, "pacman" over the border and pass through layers, but not take non rectangle shapes (for example an L shape) or be diagonal. It is better to err on the side of caution and choose less packets, which may be possible to simplify later through linear algebra.
- They must capture the entire state of the diagram - Either all the 1s or all the 0s. Xs of course don't all need to be included.
- Each packet represents a minterm (if it contains 1s) or maxterm (contains 0s), which can then be simplified to the variable(s) which remain constant in the packet ADDed / ORed together (depending on if min or maxterm).
- The result of each packet can then be combined as the DNF / KNF.
- *IMPORTANT*: When combining results of the packets, they must all represent the same type (min or maxterm). If it's easier to formulate different types of packets, min and maxterms can of course be converted between another.



#image("images/karnaugh-diagram-5.png", width: 40%)

_Static hazards_ - When the same variable is used in a parent logic gate, changes in the variable can lead to delayed "notches" in the parent's output due to time delays. These can be recognized in Karnaugh diagrams: where two packets are orthogonally next to each other but do not overlap. They can be directly fixed by introducing an extra packet two join the place of the hazard - this results in more gates overall but avoids the hazard.

TODO: Finish exercise series

== Number Systems
_Base (Radix)_ - b-adischen Reiehen like in analysis, negative indices of the base for defining decimals

_Decimal_ - Base 10, sometimes written with a \$ at the start.

_Hexadecimal_ - Uses digits $0-9$ and $A-F$ for 16 possible digits in total. Often written with 0x at start. Used to represent binary numbers in a more compact format by splitting a binary number into groups of 4 digits

_Octal_ - Radix 8, can be converted from binary using groups of 3 binary digits.

=== Converting Decimal to Radix R
+ Perform whole number division of the decimal $D$ by the Radix $R$: $D/R = Q_0 + r_0$, the remainder is the first digit in the target radix
+ Divide the result of the previous whole-number division $Q_0$ by the radix R again, this remainder is now the second digit in the target radix and so on
+ Continue until $Q_i$ reaches 0
#figure(
  image("images/integer-conversion.png", width: 60%),
) <fig-integer-conversion>

=== Converting $0 <= D_(10) < 1$ to Radix R
This is a similar process but the decimal is multiplied by the radix R and the floor of the resulting product is the current digit's value. The remainder after subtracting the floor from the current result is the next calculation's input.
#figure(
  image("images/float-conversion.png", width: 60%),
) <fig-float-conversion>

== Signed Binary Numbers
There are several possible ways to represent signed binary numbers:
- Signing bit
- 1s complement
- 2s complement: Advantageous because addition works using it, making it viable for subtraction too

=== 2s Complement
A 2s complement binary number can be converted back and forth using the following method:
+ Set apart the leading signing bit
+ Perform bitwise inversion on the other bits and add 1
+ Append the inverted leading signing bit (Do not cut off leading 0s that arose from inversion!)

Converting 2s complement to decimal is also straightforward. Either the corresponding positive binary number can be converted or:
+ Treat the leading bit as -1 \* its place value
+ Add the following binary number as positive to the negative number (ex. -256 + 16 + 2 + 1)

Fractional numbers still have $plus.minus 2^0$ as the signing bit, they can be converted in the same way. In the case of a whole + fractional number only the first bit is the signing bit.

IMPORTANT: Do not forget signing bit for positive numbers

The $m Q n$ notation simply tells us how many bits before ($m$) and after the decimal place ($n$) represent the amount.

== Binary Arithmetic
Addition of two binary numbers, with maximum $n$ digits has at most $n+1$ bits in the result.

Addition of 4x1s = Carry over 1 two places. This applies in general to all carry bits, because the entire addition result is simply being "overlayed" on the existing sum

Binary subtraction can be written as the addition of 2s complement numbers. It will simply work and the MSB will be an accurate signing bit. IMPORTANT: Do not forget +'ve number signing bit!

== Encoding
Tetraden / Nibble - groups of 4 bits

Many different ways to encode 10 numbers, each has their advantages / disadvantages. For example, Gray / O'Brien encoding is useful for counting, because they are assigned in such a way that only 1 bit changes per increment.

=== Parity Bit
Additional bit representing if the number of 1s in a word / block is odd / even

An extra word containg parity bits of the columns when the previous words are arranged as a matrix can be sent with the purpose of error checking, and when used in combination with word parity bits it can be used to pinpoint and correct errors.
#figure(
  image("images/error-correction.png", width: 60%),
) <fig-error-correction>

== Datapath Circuits

=== Multiplexer
Outputs one selected bit from several inputs using a (in this case 2 digit) binary selection signal. Circuit is simply a set of minterms $(not S_0 and not S_1 and D_0) or (not S_0 and S_1 and D_1) or (S_0 and not S_1 and D_2) or (S_0 and S_1 and D_3)$
#figure(
  image("images/multiplexer.png", width: 60%),
) <fig-multiplexer>

=== Demultiplexer
Inverse of a multiplexer, selects at which output a signal is outputed:
#figure(
  image("images/demultiplexer.png", width: 60%),
) <fig-demultiplexer>

=== Code Translator (Umsetzer)
Converts between number encoding. Create KNF -> Karnaugh diagram for each output and the set of inputs, regular circuit synthesis procedure.

=== Half Adder
Outputs the sum of two binary digits and the remainder (Carry Out CO) to be passed to an adjacent full-adder one place value higher. Symbol has $sum$ on it.

=== Full Adder
3 inputs: A, B and Carry In (CI) for a lower CO bit. Simply a combination of two half adders plus an OR gate taking in CI and CO of the internal half adder.
#image("images/full-adder.png")

=== Parallel Adder
Addition of 2 multiple digit binary numbers can be synthesised as usual using Karnaugh diagrams. This is the most efficient multi digit adder but is very application specific and needs a lot of work to extend.

=== Ripple Carry
#figure(
  image("images/ripple-carry-adder.png", width: 60%),
) <fig-ripple-carry-adder>
Advantage: Easy to extend and combine

Disadvantage: Carry bits take time to ripple up the place values, the time needed to get a correct output increases linearly

=== Carry-Look-Ahead Adder
Due to the fact that adders are so central to more complex electronic circuits, it is very useful to combine the delay and extendability advantages of both the parallel and ripple carry adder into one.

This is based on propagating carry bits as soon as possible, as these do not depend on an accurate sum. A full adder will output high on CO if:
- Both of the inputs are high
- One of the inputs is high and CI is high

Although this leads to slightly more complex hardware, the sums can therefore also be calculated in parallel and the circuit remains extendable.

The carry logic can be calculated using this recursive formula:
#figure(
  image("images/carry-look-ahead-formula.png", width: 60%),
) <fig-carry-look-ahead-formula>

=== Subtraction
As mentioned before, this is straightforward using addition of 2s complement signed numbers.

Conversion to 2s complement can alternatively be done using XOR Gates instead of NOT for the inversion step, allowing us to control if the current amount should be subtracted (inverted) or added:
#figure(
  image("images/subtraction-xor.png", width: 60%),
) <fig-subtraction-xor>

=== Multiplication
Multiplication occurs in the same way for any radix, through shifting and addition:
#figure(
  image("images/binary-multiplication.png", width: 60%),
) <fig-binary-multiplication>

The shifting logic can be built by simply wiring several adders (Basiszellen) together or using a single adder and multiplexer + counter (Booth's Algorithm).

== Sequential Circuits
Sequential circuits depend not only on the inputs but also the previous state.
TODO: formal definition
TODO: Mention how logic tables are used with previous states -> state n+1

=== SR-Latch
TODO: Diagrams of both variants
TODO: Draw / find state diagram, describe pin functionality
Q2 is simply $not Q 1$

=== Clock-controlled Latch
Just like SR but the S and R pins only take effect when the clock is high.
TODO: Symbol, Circuit and state diagrams
TODO: is this called edge triggered?

=== D-Latch
