= Digitaltechnik - Uebung 1

1. Zeitkontinuerlichen Signalen haben Werten in jeder Punkt von Zeit, diskrete haben Werte nur zwischen bestimmten Intervallen. Zum Beispiel hat die Temperatur (und die Mehrheit von Eigenschaften in der Natur) immer einen Wert, aber wenn einen digitalen Sensor die Temperature misst, speichert er einen Wert nur einmal pro Zeiteinheit.

2. Wertkontinuerlichen Signalen haben unendlich viele Werten zwischen zwei Werten, wie zum Beispiel eine ideale $sin$ Welle. Diskreten Signalen koennen nur bestimme Werte nehmen, zum Beispiel die Ausgang einer Schaltfunktion.

3. a) $
#table(columns: 9, table.header([Fullmenge], [Bit 0], [Bit 1], [Bit 2], [Bit 3], [Bit 4], [Fullstand], [Fehler], [Binary]),
  [0.5l], [0], [0], [0], [0], [0], [0], [0.0l],[000],
  [1.1l], [1], [0], [0], [0], [0], [1l], [0.1l],[001],
  [1.3l], [1], [0], [0], [0], [0], [1l], [0.3l],[001],
  [1.6l], [1], [0], [0], [0], [0], [1l], [0.6l],[001],
  [1.7l], [1], [0], [0], [0], [0], [1l], [0.7l],[001],
  [1.8l], [1], [0], [0], [0], [0], [1l], [0.8l],[001],
  [2.1l], [1], [1], [0], [0], [0], [2l], [0.1l],[010],
  [2.2l], [1], [1], [0], [0], [0], [2l], [0.2l],[010],
  [2.3l], [1], [1], [0], [0], [0], [2l], [0.3l],[010],
  [2.4l], [1], [1], [0], [0], [0], [2l], [0.4l],[010],
  [2.5l], [1], [1], [0], [0], [0], [2l], [0.5l],[010],
  [2.5l], [1], [1], [0], [0], [0], [2l], [0.5l],[010],
  [2.8l], [1], [1], [0], [0], [0], [2l], [0.8l],[010],
  [2.9l], [1], [1], [0], [0], [0], [2l], [0.9l],[010],
  [3.2l], [1], [1], [1], [0], [0], [3l], [0.2l],[011],
  [3.6l], [1], [1], [1], [0], [0], [3l], [0.6l],[011],
  [4.4l], [1], [1], [1], [1], [0], [4l], [0.4l],[100],
  [4.5l], [1], [1], [1], [1], [0], [4l], [0.5l],[100],
  [4.7l], [1], [1], [1], [1], [0], [4l], [0.7l],[100],
  [5.3l], [1], [1], [1], [1], [1], [5l], [0.3l],[101],
 )
$
b) Quantisierung von 1l. Das heisst die Analog Werten eine Praezision von $+0. dot(9)l$\
d) $+0.5l$\
e) Es braucht 3 Binaere digits, was 0 bis $2^3=8$l Zeigen kann. Siehe Tabelle.

4. a) 2\
b) x represents an undefined value in between the two thresholds.\
000111x1111xx000xxxx

#pagebreak()
5.
i. $#table(columns: 2, table.header([A], [Z]),
	[0], [1],
	[1], [1]
 )$
ii. $#table(columns: 2, table.header([A], [Z]),
	[0], [1],
	[1], [0]
 )$
iii. $#table(columns: 2, table.header([A], [Z]),
	[0], [1],
	[1], [0]
 )$ Wie ein NOT Gatter

6. a) 2 Eingaenge, 1 Ausgang. $2^2=4$ Eingangskodierungen sind moeglich.\
b) NAND $#table(columns: 3, table.header([A], [B], [NAND]),
	[1], [1], [0],
	[1], [0], [1],
	[0], [1], [1],
	[0], [0], [1],
 )$
OR $#table(columns: 3, table.header([A], [B], [OR]),
	[1], [1], [1],
	[1], [0], [1],
	[0], [1], [1],
	[0], [0], [0],
 )$
NOT $#table(columns: 2, table.header([A], [NOT]),
	[1], [0],
	[0], [1],
 )$\
\
c)
$#table(columns: 6, table.header([A], [B], [X], [Y], [V], [Z]),
	[1], [1], [0], [1], [1], [0],
	[1], [0], [1], [1], [0], [1],
	[0], [1], [1], [1], [0], [1],
	[0], [0], [1], [0], [1], [0],
 )$\
Die Ausgang ist hoch, nur wenn die beide Inputs unterschiedlich sind.\
d) $(A and not B) or (not A and B)$ TODO: Can this be simplified further?

7. a) B: $#table(columns: 3, table.header([A], [S], [B]),
	[1], [1], [0],
	[1], [0], [1],
	[0], [1], [0],
	[0], [0], [0],
 )$ Hoch wenn nur A hoch ist
C: $#table(columns: 3, table.header([A], [S], [B]),
	[1], [1], [1],
	[1], [0], [0],
	[0], [1], [0],
	[0], [0], [0],
 )$

c)
$#table(columns: 4, table.header([E], [Z], [I], [X]),
	[1], [1], [1], [1],
	[1], [1], [0], [0],
	[1], [0], [1], [1],
	[1], [0], [0], [1],
	[0], [1], [1], [1],
	[0], [1], [0], [0],
	[0], [0], [1], [0],
	[0], [0], [0], [0],
 )$\
