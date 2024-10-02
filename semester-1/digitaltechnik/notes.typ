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

== Schaltfunktionen
_Schaltfunktion_ - $Y = f(X_0, X_1, X_2, ..., X_(N-1))$ - Nimmt mehrere Bits als Input und produziert eine einzige Bit als Ausgang.

Alle Schaltfunktionen lassen sich als einer Wahrheitstabelle darstellen mit $N+1$ Spalten und $2^N$ Zeilen, wo N ist der Nummer von Inputs.

NOT'ing a gate usually means the resistor just needs to be moved before the transistors (essentially appending a NOT gate).

*AND* - The resistor after the output point is needed to prevent a short circuit when both inputs are high.

*XNOR* - High if both inputs are the same, gate symbol is a =.

*Antivalenz (XOR)* - High if only one of the inputs is high.

== CMOS
_Transistor_ - Trans-Resistor (controllable resistor)\
_MOS Transistor_ - Eine elektronische Bauelement mit Kontakte *S* ource, *D* rain und *G* ate. Ladungstraeger fliessen von S nach D. They are controlled through a voltage at G (unlike a current with BJT) and are therefore more efficient for high power usage. They are also easier to etch in ICs and are therefore predominantly used in logic circuits.

$abs(V_(g s)) < abs(V_(t h)), R_(S D) -> oo$ - The transistor is off\
$abs(V_(g s)) > abs(V_(t h)), R_(S D) -> 0$ - The transistor is on

_N-Typ (NMOS)_ - Electrons flow from D to S. Threshold voltage is positive.\
_P-Typ (PMOS)_ - circle at the gate in symbol. Holes flow from S to D. The threshold voltage is negative.

PMOS transistors can replace pull-up resistors in logic gates to reduce wasted energy. In this case:
- CMOS Gatter müssen aus genau so vielen NMOS und PMOS Transistoren bestehen
- Bei m Eingängen gibt es m NMOS und m PMOS transistoren

The $V_D$ of an "off" MOS transistor is floating (undefined) TODO: Double check

TODO: What exactly is a Pull-up vs Pull-down Pfad?

$t_(p H L)$ - Time taken to switch on once 50% of the gate voltage is reached until 90% of $V_(D S)$ is reached TODO: Check\
$t_(p L H)$ - Time taken to switch off\
$t_d = (t_(p H L) +t_(p L H)) / 2$ - Average switching time
