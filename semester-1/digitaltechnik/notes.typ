= Digitaltechnik

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

_Floating Voltage_ - when a pin / contact is not connected by a "normal" (lower than that of air) resistance to V_DD / circuit ground. Essentially the same as any metal surface in the room, on which a very weak 50Hz signal is usually seen due to induction from all the EM sources in the room.

== Schaltfunktionen
_Schaltfunktion_ - $Y = f(X_0, X_1, X_2, ..., X_(N-1))$ - Nimmt mehrere Bits als Input und produziert eine einzige Bit als Ausgang.

Alle Schaltfunktionen lassen sich als einer Wahrheitstabelle darstellen mit $N+1$ Spalten und $2^N$ Zeilen, wo N ist der Nummer von Inputs.

NOT'ing a gate usually means the resistor just needs to be moved before the transistors (essentially appending a NOT gate).

*AND* - The resistor after the output point is needed to prevent a short circuit when both inputs are high.

*XNOR* - High if both inputs are the same, gate symbol is a =.

*Antivalenz (XOR)* - High if only one of the inputs is high.

== CMOS (Complementary Metal Oxide Semiconductor) Technology
_Transistor_ - Trans-Resistor (changable resistor)\
_MOS Transistor_ - Electronic component with contacts *S* ource, *D* rain und *G* ate. Charge carriers flow from S to D. They are controlled through a voltage at G (unlike a current with BJT) and is therefore more efficient for very low / high power applications. They are also easier to etch in ICs and are therefore predominantly used in logic circuits.\
Although very high pull up resistors vastly reduce power loss when using a single MOS transistor, such large resistances are difficult to fabricate in ICs. CMOS uses a PMOS instead which has practically $oo$ resistance when "open".

$abs(V_(g s)) < abs(V_(t h)), R_(S D) -> oo$ - The transistor is off\
$abs(V_(g s)) > abs(V_(t h)), R_(S D) -> 0$ - The transistor is on

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

$t_(p H L)$ - Time taken to switch on once 50% of the gate voltage is reached until 90% of $V_(D S)$ is reached TODO: Check\
$t_(p L H)$ - Time taken to switch off\
$t_d = (t_(p H L) +t_(p L H)) / 2$ - Average switching time

== Boolean Algebra
TODO:
- last 2 fundamental rules of boolean algebra
- order of operations
- De Morgan's laws
- Distributive law loop
- Universal gates NAND & NOR conversion - Advantage as they all have the same properties such as timing
- Relationship between pull up and pull down paths

== Min / Maxterm
TODO: Is this a method to create a boolean expression for any arbitrary truth table?

Lectures 1-4 (inclusive) in the test next week
