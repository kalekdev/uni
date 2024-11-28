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

#figure(
  image("images/logic-gates.png", width: 80%),
) <fig-logic-gates>

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

LTD: Add some diagrams of CMOS circuits

=== Switching Delays
- $t_(p H L), t_(p L H)$ - Propogation delay - Time taken between a 50% change in the input voltage leading to a 50% change in the output
- $t_(t H L) (t_"fall"), t_(t L H) (t_"rise")$ - Time between the output rising / falling between 10% and 90% voltage
$t_d = (t_(p H L) +t_(p L H)) / 2$ - Average switching time, easier to work with in practice

=== Transmission Gate
These extremely simple gates are the CMOS equivalent of physical switches / relays, transmitting a signal if the T pin is high.
#figure(
  image("images/trans-gate.png", width: 80%),
) <fig-trans-gate>

LTD: Understand why it works like that, the GS voltage doesn't always make sense...

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

_Static hazards_ - When the same variable is used in a parent logic gate, changes in the variable can lead to delayed "notches" in the parent's output due to time delays. These can be recognized in Karnaugh diagrams: where two packets are orthogonally next to each other but do not overlap. They can be directly fixed by introducing an extra packet to join the place of the hazard - this results in more gates overall but avoids the hazard. IMPORTANT: This packet should also be as large as possible.

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
Tetrad / Nibble - groups of 4 bits

Many different ways to encode 10 numbers, each has their advantages / disadvantages. For example, Gray / O'Brien encoding is useful for counting, because they are assigned in such a way that only 1 bit changes per increment.

=== Parity Bit
Additional bit representing if the number of 1s in a word / block is odd / even

An extra word containg parity bits of the columns when the previous words are arranged as a matrix can be sent with the purpose of error checking, and when used in combination with word parity bits it can be used to pinpoint and correct errors.
#figure(
  image("images/error-correction.png", width: 60%),
) <fig-error-correction>

== Combinatronic Circuits
_Combinatronic (aka Datenpfad)_ circuits create a pure output that solely depends on the current inputs.

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
Outputs the sum of two binary digits and the remainder (Carry Out CO) to be passed to an adjacent full-adder one place value higher.
#figure(
  image("images/half-adder.png", width: 60%),
) <fig-half-adder>

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
Sequential circuits depend not only on the current inputs but also the previous state ie a function with two sets of inputs. They incorporate memory through back connections (Rückkopplungen).

Truth tables / Karnaugh diagrams for such circuits can be found by including previous states $Q_n$ as an input variable and calculating resulting output states $Q_(n+1)$. The back connection has effectively been cut and replaced with an additional input.

=== Latches
These are components that store a single bit based on signal levels (Zustandsgesteuert) instead of signal transitions.

==== SR-Latch
This is the most basic latch, storing a single bit which can be controlled using the Set and Reset inputs.
#figure(
  image("images/sr-latch.png", width: 60%),
) <fig-sr-latch>
TODO: Diagrams of both variants

When set is high, the output Q instantly becomes high. When reset goes high, Q instantly becomes low (the memory is reset). If they are both low, the current saved state is output. S and R high is an invalid input (can be written as a Don't Care state) and results in unstable behaviour.
#figure(
  image("images/sr-latch-states.png", width: 40%),
) <fig-sr-latch-states>

Alternatively, it can be built using NAND gates, using inverted inputs instead. This is useful when the inputs are off by default, for example a switch.
#figure(
  image("images/inverted-sr-latch.png", width: 60%),
) <fig-inverted-sr-latch>

==== Clock-controlled Latch
This has the same behaviour as a regular SR-Latch, but the S and R pins only take effect when T is high (also known as a gate controlled latch), simply by introducing two AND gates between S+T and R+T. This is useful to only allow changes during a high clock pulse and it is the basic building block of flip flops later (however unlike flip-flops, its memory can be changed anytime whilst T is high).
#figure(
  image("images/clock-sr-latch.png", width: 60%),
) <fig-clock-sr-latch>

==== D-Latch
Co-ordinating two separate set / reset signals can be tricky, so this latch allows us to control the new desired state using a single Data pin. Of course, if the clock signal were always 1, this simply mirrors the state of D, therefore it is designed for storing during the off clock period.
#figure(
  image("images/d-latch.png", width: 60%),
) <fig-d-latch>

=== Flip-Flops
These are similar to latches but they only store the value during a rising / falling edge of a clock signal (Taktflankengesteuert), protecting against undesired signal errors during the storing state of the cycle.
#figure(
  image("images/edge-symbols.png", width: 60%),
) <fig-edge-symbols>

Sometimes a reset pin is also built in, allowing us to interrupt the signal and instantly reset regardless of the current clock state.

==== D-Flipflop
This can be achieved using a leader-follower structure of two internal latches operating on an inverted clock, whether the leader or follower recieves the inversion chooses if its a rising or falling edge operated flipflop.

In the example below, the first latch is set whilst the clock is low, then the second latch accepts this saved value as the clock rises. This is a safer design as the connection between the 1st and 2nd latch is safe from external hazards.
#figure(
  image("images/d-flipflop.png", width: 60%),
) <fig-d-flipflop>

They are most commonly used in practice as they can be constructed using very few transistors in CMOS technology, where the transmission gates control if the data can progress through each step:
#figure(
  image("images/d-flipflop-cmos.png", width: 60%),
) <fig-d-flipflop-cmos>
#figure(
  image("images/d-flipflop-cmos-raw.png", width: 60%),
) <fig-d-flipflop-cmos-raw>
LTD: The double NOT gates are needed for some kind of stability rather than a short circuit, understand exactly why

==== SR-Flipflop
These are rarely used in practice but are the same concept - the current state of S and R only takes effect during a rising / falling clock.
#figure(
  image("images/sr-flipflop.png", width: 50%),
) <fig-sr-flipflop>

==== JK-Flipflop
The Jump and Kill pins function as the S and R pins, however both are allowed to be high, which simply toggles the output.
#figure(
  image("images/jk-flipflop.png", width: 60%),
) <fig-jk-flipflop>
#figure(
  image("images/jk-from-d-fliplop.png", width: 60%),
) <fig-jk-from-d-fliplop>

==== T-Flipflop
This simply toggles the output at every rising edge.
#figure(
  image("images/t-flipflop.png", width: 60%),
) <fig-t-flipflop>

Alternatively the toggling functionality can be turned on or off using a JK-flipflop.
#figure(
  image("images/jk-t-flipflop.png", width: 60%),
) <fig-jk-t-flipflop>

==== Delayed-Flipflop
This consists of 2 combined flipflops, a change taken in during a rising signal is only outputed after the corresponding falling signal and vice versa.
#figure(
  image("images/delayed-flipflop.png", width: 60%),
) <fig-delayed-flipflop>

==== Timing
The delays for a given flipflop must be respected to ensure correct operation:
- $t_(p d)$ - Propagation delay - time until a succesful save appears at the output, starts at 50% of the clock edge, ends when 50% of the new output is reached (if a change occurs).
- $t_s$ - Setup time - How long the input signal must stay constant before the edge, so that it's guaranteed to have been taken in by the leader latch.
- $t_h$ - Hold time - How long the input must stay constant after the edge to ensure the follower latch accepts it.
#figure(
  image("images/flip-flop-timing.png", width: 80%),
) <fig-flip-flop-timing>

These delays can be combined to analyse the minimum clock period (and therefore maximum clock frequency; the fastest rate at which we are allowed to operate a computer) of a complex circuit involving several flip flops and combinatronic circuits.

For instance in the circuit below, the minimal clock period must be $t_(p d f f 1) + t_(p d k s) + t_(p d f f 2)$ to ensure a signal can make it through the circuit before the clock signal changes:
#figure(
  image("images/min-clock-period.png", width: 60%),
) <fig-min-clock-period>

Of course if a circuit contains several branches, the branch with the longest delay represents hte minimum clock period.

==== Applications
Apart from stable 1-bit storage, flipflops can be useful building blocks for a variety of functional components.

===== Frequency Divider
Chained T-flipflops are useful to reduce the clock frequency, each flipflop reduces it by a factor of two, hence:
$
  f_"Target" &= f_"Clock" / 2^n\
  n &= log_2 (f_"Clock" / f_"Target")
$

===== Counter
The intermittent and final output state can also be used as a 2-digit binary counter:
#figure(
  image("images/flipflop-counter.png", width: 60%),
) <fig-flipflop-counter>]
LTD: Can this extended to more than 2 digits?

== Automata
Mealy vs moore
mealy can be used to reduce number of states needed - previous n + latest input considered for example binary pattern recognizer
binary encoding to reduce number of flip flops needed

Moore automata more stable, outputs are accurate regarding inputs, synchronisation between clock and inputs needed, use flipflops.

sequence detecter can be made with only 3 flip flops and binary encoding, or simply a series of 7 flipflops and a series of (notted) inputs to an and gate

automata can be connected with each other to abstract separate functions

cpus are infinite state machines, opcodes have arbitray operands and modern memory holds a huge amount of states.
