= Digitaltechnik - Uebung 2

1. $2^N$ Zeilen, $N+1$ Spalten

2. a) $
    #table(columns: 8, table.header([A], [B], [C], [U], [V], [W], [X], [Z]),
  [0], [0], [0], [0], [0], [1], [1], [1],
  [0], [0], [1], [0], [0], [0], [0], [0],
  [0], [1], [0], [0], [0], [0], [0], [0],
  [0], [1], [1], [0], [0], [0], [0], [0],
  [1], [0], [0], [0], [0], [1], [1], [1],
  [1], [0], [1], [0], [0], [0], [0], [0],
  [1], [1], [0], [0], [1], [0], [1], [0],
  [1], [1], [1], [0], [1], [0], [1], [0],
 )
  $
b) $U=not B and B and not A, V=B and A, W=not C and not B, X=U or V or W, Z = W$

#image("exercise-2-q-3.jpeg", width: 60%)

4. a) $
    #table(columns: 9, table.header([A], [B], [T1], [T2], [T3], [T4], [T5], [T6], [Z]),
  [0], [0], [zu], [zu], [NN], [offen], [offen], [zu], [0],
  [0], [1], [zu], [offen], [NN], [offen], [offen], [zu], [0],
  [1], [0], [offen], [zu], [offen], [zu], [offen], [zu], [0],
  [1], [1], [offen], [offen], [zu], [zu], [zu], [offen], [1],
 )
$
b) $
    #table(columns: 10, table.header([A], [B], [C], [T1], [T2], [T3], [T4], [T5], [T6], [Z]),
  [0], [0], [0], [zu], [zu], [zu], [offen], [offen], [offen], [1],
  [0], [0], [1], [zu], [zu], [offen], [zu], [offen], [offen], [0],
  [0], [1], [0], [zu], [offen], [NN], [offen], [zu], [offen], [0],
  [0], [1], [1], [zu], [offen], [NN], [zu], [zu], [offen], [0],
  [1], [0], [0], [offen], [NN], [NN], [offen], [offen], [zu], [0],
  [1], [0], [1], [offen], [NN], [NN], [zu], [offen], [zu], [0],
  [1], [1], [0], [offen], [NN], [NN], [offen], [zu], [zu], [0],
  [1], [1], [1], [offen], [NN], [NN], [zu], [zu], [zu], [0],
 )
$

5. a)
- A: Eingang
- B: Ausgang
- C: Eingang
- D: Eingang

#image("exercise-2-q-5.jpeg", width: 50%)
e) $(not A and not B and not C) or (not D and not E) or not F$
