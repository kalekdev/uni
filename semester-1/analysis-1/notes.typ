#heading(outlined: false)[Analysis 1]

#set heading(numbering: "1.")
#show terms.item: it => {
  [\ *#it.term:*\ #it.description]
}

#outline()

Literature:
- #link("https://metaphor.ethz.ch/x/2023/hs/401-1261-07L/ex/LectureNotes.pdf")[Alessio Figalli's 2023 Lecture Notes]
- #link("https://link.springer.com/book/10.1007/b137107")[Analysis 1 by H. Amann & J. Escher]

What I would like to take notes of:
+ State the theorem / definition, expand with some intuition / memory aids
+ Write the proof by myself if deemed useful for an exam
+ Name some examples only if very helpful

These notes should serve as condensed revision material - only the minimal, important facts to remember before solving problems

#pagebreak()

= The Real Numbers

/ Definition - Set: An *unordered* collection of *distinct* (${x, x} equiv {x}$) elements such that:
+ It is defined by the elements it contains
+ It is not an element of itself, this prevents Russell's Paradox: ${x | x in.not x}$
+ Its elements can be filtered by a series of statements which hold true, for example the set of even integers: $
    {n in ZZ | exists m in ZZ: n = 2m}
  $ Where $|$ and $:$ both mean "such that".
+ The empty set $emptyset$ contains no elements

== Axioms of The Real Numbers
An axiomatic approach to defining the set of real numbers $RR$.

/ Definition - Group: A *non-empty* set $G$ endowed with an operation $star$ which satisfies the following criteria $forall a, b, c in G$:
+ _Associativity_ - $a star (b star c) = (a star b) star c$
+ $exists$ _Neutral Element_ $n$ - $a star n = n star a = a$ - Examples:
  - $a + 0 = 0 + a = a$
  - $a dot 1 = 1 dot a = a$
+ $forall a exists$ _Inverse Element_ $i$ - $a star i = i star a = n$ - Examples:
  - $a + (-a) = (-a) + a = 0$
  - $a !=0 => a dot a^(-1) = a^(-1) dot a = 1$
+ If $a star b = b star a$ it is a *commutative group*, although this is not required.
Properties:
- The _Neutral Element_ is unique. Proof: $
    "Let" n, n' in G "be neutral elements"\
    n star n' = n = n'
  $
- There is unique _Inverse Element_ for all elements. Proof: $
    "Let" i, i' in G "be inverse elements for" a\
    i star (a star i') = (i star a) star i'\
    i star n = n star i'\
    i = i'
  $
Examples:
- The non-zero rational numbers $QQ := {p/q | p, q in ZZ: p, q != 0}$ with operation $dot$ is a group, where $n=1/1$ and $i(p / q) = q/p$
- The natural numbers $NN$ with operation $+$ is *not* a group, as there are no negative inverse elements

/ Definition - Ring: A non-empty set $R$ with operations $+$ and $dot$.
+ Addition is *always commutative* with $n=0, i=-a$
+ Multiplication is not necessarily commutative, for example a matrix ring
+ If multiplication is commutative, it is a *commutative ring* and has neutral element $n=1$
+ It is *not necessarily* a group for multiplication as $0$ may be included and has no inverse element $0 dot i != 1$

/ Definition - Field: A commutative ring $K$ (Körper) where $forall a in K | k != 0$ the inverse element for multiplication exists.
+ Addition: $n = 0, i = -a, -(-a) = a$
+ Multiplication: $n = 1, i = a^(-1), (a^(-1))^(-1) = a | a != 0$
Examples:
- $ZZ$ is a ring but not a field as there is no multiplicative inverse element for all non-zero elements
- The complete set of rational numbers $QQ := {p/q | p, q in ZZ: q != 0}$ is a commutative ring and a field.
- $0 dot a = 0$. Proof: $
    0 = 0 dot a - 0 dot a = (0-0) dot a = 0 dot a
  $

/ Definition - Cartesian Product: For the sets $X, Y$, the Cartesian product is the set of tuples (ordered lists): $X times Y := {(x, y) | x in X, y in Y}$
- The number of elements in the set is: $
    abs(X times Y) = abs(X) dot abs(Y)
  $
Example:
$
  X :={0, 1}, Y := {alpha, beta}\
  X times Y := {(0,alpha), (0, beta), (1, alpha), (1, beta)}\
$

/ Definition - Subset: A set whose elements are entirely contained in a parent set with the following notation:
- $P subset.eq Q$ - $P$ is a subset of $Q$ and they may be equal
- $P subset.neq Q$ - $P$ is a *proper* subset of $Q$; $Q$ has at least 1 additional element
- $P subset.not Q$ - There is at least one element in $P$ that is not in $Q$
- The same applies in reverse using sup(er)set notation $supset.eq$
- The symbols $subset$ and $supset$ are ambiguous in meaning
- Two sets can be shown to be equal if $P subset.eq Q and Q subset.eq P$ holds true

/ Definition - Relationship: A relationship on $X$ is the subset $Re := { (a, b) in X times X | a ~ b}$ where $~$ is an operator for expressing conditions called a relation and may have the following properties if the corresponding condition holds true $forall x, y ,z in X$:
- Reflexive - $x ~ x$ - Example: $<=$
- Transitive - $x ~ y and y ~ z => x ~ z$ - Example: $<$
- Symmetric - $x ~ y => y ~ x$ - Example: $=$
- Anti-Symmetric - $x ~ y and y ~ x => x = y$ - Example: $<=$ - Although such relations are often reflexive, this is not a requirement, consider $Re = emptyset, X = {1}$
- A relation is called *equivalence relation* if it is reflexive, transitive and symmetric
- A relation is called *order relation* if it is reflexive, transitive and anti-symmetric

TODO: As part of set operations
/ Definition - Complement: $A subset.eq X, A^complement = X \\ A$ The elements of a set excluding those that appear in a set.

= Functions of one Real Variable


