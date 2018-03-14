# Intermediate format
A proposal for an output intermediate format common to all modules.

The intermediate format consists of a list of strings which encodes the music
and optionally a single string which encodes the lyrics.


## Example
This example is the beginning of "O quam gloriosum est"

```python
['Cantus', 'c1' '0', 'time 2/2', 'ligature 2', 'longa G3', 'brevis A3', 'semibrevis A3', 'minima A3', 'minima A3', 'dotted minima A3', 'semiminima B3', 'ligature 2', 'brevis C4', 'dotted brevis D4', 'minima D4', 'minima G3', 'dotted minima C4', 'semiminima B3', 'semiminima A3', 'semiminima G3', 'minima A3', 'semibrevis G3', 'minima F#3', 'semibrevis G3', 'brevis G3', 'semibrevis rest', 'minima rest', 'minima C3']
```

```python
"O quam glo- ri- o- _ _ sum est re- _ _ _ _ _ _ _ gnum in"
```


## Music
The music is encoded as a list of strings.
Each string is one or more words separated by a single space.
A list of strings makes it very human readable.

The three first elements of the list have a special meaning: label, original clef and key signature. Perhaps that information should be included in a different structure as a "header". The time signature can change in the middle of the piece, so it should not be part of that "header".

**Label:** 
Any string

**Clef:** 
`'signn'`

* _sign_ is one of f, c, g

* _n_ is the line. 1 is the bottom line

**Key signature:** 
`'-1'` for one flat, `'0'` for nothing

**Time signature:** 
Think about a more meaningful notation.

**Normal notes:** 
`'duration NOTEoctave'`

* _duration_ is one of `maxima`, `longa`, `brevis`, `semibrevis`, `minima`, `semiminima`, `fusa`, `semifusa`

* _NOTE_ is one of C, C#, D, Eb, E, F, F#, G, G#, A, Bb, B

* _octave_ is an integer. C3 is central do. ¿No debería ser C4?

**Dotted notes:** 
`'dotted duration NOTEoctave'`

**Colored notes:** 
`'colored duration NOTEoctave'`

* _duration_ is the notated duration

**Rests:** 
`'duration rest'`

* The rests can be grouped in any way. The exact distribution of rests is calculated later.

**Ligatures:** 
`'ligature n'`

* _n_ is the number of following notes that are part of the ligature


## Lyrics

* A single string with syllables separated by a single space.

* A syllable for each note or ligature.

* Melismas are indicated with the syllable _ (underscore).

* If a word continues to the next syllable that is indicated by a - (hyphen) at the end of the first syllable.

* To indicate repetition of text (ij) we use brackets: `"Ky- ri- e, [Ky- ri- e]"`

* Abbreviations and ligatures in the text can be calculated later.




