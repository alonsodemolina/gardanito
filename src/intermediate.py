#!/usr/bin/python

import sys


# situacion en el pentagrama del do central
# la primera linea vale 0, hacia arriba suma
# clave de sol:-2; clave de fa en cuarta:10; clave de do en tercera:4; etc.
def hallar_do_central_location(clave, linea):
    base_value={'g': -4, 'c': 0, 'f': 4 }[clave]
    return base_value + (int(linea)-1)*2

# situacion respecto del do central
def hallar_location(nombre, octava):
    base_value={'c': 0, 'd': 1, 'e': 2, 'f': 3, 'g': 4, 'a': 5, 'b': 6}[nombre]
    return base_value + (int(octava)-3)*7 # -4 if middle C is c4


input=['Cantus', 'c1', '0', 'time 2/2', 'ligature 2', 'longa G3', 'brevis A3', 'semibrevis A3', 'minima A3', 'minima A3', 'dotted minima A3', 'semiminima B3', 'ligature 2', 'brevis C4', 'dotted brevis D4', 'minima D4', 'minima G3', 'dotted minima C4', 'semiminima B3', 'semiminima A3', 'semiminima G3', 'minima A3', 'semibrevis G3', 'minima F#3', 'semibrevis G3', 'brevis G3', 'semibrevis rest', 'minima rest', 'minima C3']


stream=[]

clave=input[1]
signo_clave=clave[0]
linea_clave=clave[1]

stream.append("clave." + clave)

do_central_location=hallar_do_central_location(signo_clave, linea_clave)

# TODO: Add key signature to the stream

i=3
while i<len(input):
    item=input[i]
    elements=item.split()
    if elements[1]=='rest':
        dur=elements[0]
        stream.append("silencio." + dur)
    elif elements[0]=='time': # TODO
        stream.append("compas")
    elif elements[0]=='ligature': # TODO
        i=i+int(elements[1])
        stream.append("ligadura")
    else: # it is a note
        dur=elements[-2]
        pitch=elements[-1]
        pname=pitch[0].lower()
        octave=pitch[-1]
        location=hallar_location(pname, octave)
        altura=str(location + do_central_location)
        if elements[0]=='dotted':
            dots="1"
        else:
            dots="0"
        if pitch[1]=='#':
            stream.append("sostenido." + altura)
        if pitch[1]=='b':
            stream.append("bemol." + altura)
        # nota
        stream.append("nota." + dur + "." + altura)
        # puntillo
        if dots == "1":
            a=int(altura)
            if a%2 == 0:
                altura_pun=str(a+1)
            else:
                altura_pun=altura
            stream.append("puntillo." + altura_pun)
    i=i+1


print stream

# Traducimos cada elemento del stream en un unico tipo de la fuente.
# Para ello primero creamos un diccionario
tabla=open("tabla.txt")
glyph={}
for linea in tabla.readlines():
    campos=linea.split()
    glyph[campos[0]]=campos[1]
    

# TODO: intercalar espacios

for item in stream:
    sys.stdout.write(glyph[item])

print


