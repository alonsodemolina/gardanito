#! /usr/bin/python3

import re

notes={'c': 0, 'd': 1, 'e': 2, 'f':3, 'g':4, 'a':5, 'b':6}
notes_inverse=['c','d', 'e', 'f', 'g', 'a', 'b']
distance={'c': 0, 'd': 2, 'e': 4, 'f': 5, 'g': 7, 'a': 9, 'b':11}
accidentals={'is':1, 'es':-1, 's':-1, 'isis':2, 'eses':-2, 'ses':-2}
accidentals_inverse=['eses', 'es', '', 'is', 'isis']

def contar_comas(comas):
    if comas == "":
        return 0
    elif comas[0]=='\'':
        return len(comas)
    else:
        return -len(comas)

def comas_string(octava):
    if octava == 0:
        return ""
    if octava > 0:
        return "'" * octava
    else:
        return "," * (-octava)

def pitch_components (string):
    m=re.match(r"(\w*)(('|,)*)", string)
    note=m.group(1)
    commas=m.group(2)
    letter=note[0]
    sufix=note[1:]
    interval=notes[letter]
    semitones=distance[letter]
    if sufix:
        semitones=semitones+accidentals[sufix]
    return interval, semitones, contar_comas(commas)    

def synthesize (a, b, c):
    c=c+a//7
    a=a%7
    b=b%12
    letter=notes_inverse[a]
    s=b-distance[letter]
    sufix=accidentals_inverse[s+2]
    return letter+sufix+comas_string(c)

transpose="c' cis"
(n1, n2)=transpose.split()
(a1, b1, c1)=pitch_components(n1)
(a2, b2, c2)=pitch_components(n2)
(a,b,c)=(a2-a1, b2-b1, c2-c1)
(d,e,f)=pitch_components("d")

note=synthesize(d+a, e+b, f+c)
print (note)
