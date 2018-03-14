#!/usr/bin/python

import sys
import xml.etree.ElementTree as ET


# situacion en el pentagrama del do central
# la primera linea vale 0, hacia arriba suma
# clave de sol:-2; clave de fa en cuarta:10; clave de do en tercera:4; etc.
def hallar_do_central_location(clave, linea):
    base_value={'g': -4, 'c': 0, 'f': 4 }[clave]
    return base_value + (int(linea)-1)*2

# situacion respecto del do central
def hallar_location(nombre, octava):
    base_value={'c': 0, 'd': 1, 'e': 2, 'f': 3, 'g': 4, 'a': 5, 'b': 6}[nombre]
    return base_value + (int(octava)-4)*7


tree = ET.parse('../resources/o_quam.mei')
root = tree.getroot()

stream=[]

staff=root.find(".//staffDef")
signo_clave=staff.get('clef.shape')
signo_clave=signo_clave.lower()
linea_clave=staff.get('clef.line')
stream.append("clave." + signo_clave + linea_clave)

do_central_location=hallar_do_central_location(signo_clave, linea_clave)

layer=root.find(".//staff/")

for item in layer:
    if item.tag == "note":
        dur=item.get('dur')
        pname=item.get('pname')
        octave=item.get('oct')
        location=hallar_location(pname, octave)
        altura=str(location + do_central_location)
        dots=item.get('dots')
        accid=item.get('accid')
        # alteracion
        if accid == "s":
            stream.append("sostenido." + altura)
        if accid == "f":
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
    if item.tag == "rest":
        dur=item.get('dur')
        stream.append("silencio." + dur)
    if item.tag == "ligature":
        stream.append("ligadura")


tabla=open("tabla.txt")
glyph={}
for linea in tabla.readlines():
    campos=linea.split()
    glyph[campos[0]]=campos[1]
    
print stream

for item in stream:
    sys.stdout.write(glyph[item.rstrip()])

print


