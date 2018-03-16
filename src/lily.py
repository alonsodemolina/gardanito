#!/usr/bin/python

import re


def quitar_comments(string):
    # eliminamos bloques %{ ... %}
    s=re.sub(r'%{.*?%}', r'', string, flags=re.DOTALL)
    # eliminamos comentarios de una linea % ...
    t=re.sub(r'%.*?\n', r'\n', s)
    return t

def extraer(texto, string):
    # Busca en texto una definicion de la forma string={....}
    # Devuelve el bloque {...}, y el texto con la definicion eliminida
    bloque=""
    # \W matches any non-alphanumeric
    p=re.compile('\W' + string + '\s*=\s*')
    m=p.search(texto)
    string_start=m.start()
    string_end=m.end()
    i=string_end
    llaves=0
    initial_status=1
    while llaves!=0 or initial_status == 1:
        c=texto[i]
        bloque=bloque + c
        if c == '{':
            initial_status=0
            llaves=llaves+1
        if c == '}':
            llaves=llaves-1
        i=i+1
    resto=texto[:string_start+1] + texto[i:]
    return bloque, resto

def tokenizar(bloque):
    l=[]
    i=1
    while True:
        c=bloque[i]
        if c=='}':
            break
        elif c.isspace():
            i=i+1
            continue
        elif c.isalpha():
            token, long = leerpalabra(bloque, i)
        elif c.isdigit():
            token, long = leernumero(bloque, i)
        elif c=='*':
            token, long = leerproporcion(bloque, i)
        elif c in {'\'', ',', '.', '-', '_'}:
            token, long = leersignos(bloque, i, c)
        elif c=='\\':
            token, long = leercomando(bloque, i)
        elif c=='{':
            token, long = leerbloque(bloque, i)
        else:
            token=c
            long=1
        l.append(token)
        i=i+long
    return l

def leerpalabra(string, pos):
    palabra=""
    j=pos
    letra=string[j]
    while letra.isalpha():
        palabra=palabra + letra
        j=j+1
        letra=string[j]
    return palabra, j-pos

def leernumero(string, pos):
    numero=""
    j=pos
    digito=string[j]
    while digito.isdigit():
        numero=numero + digito
        j=j+1
        digito=string[j]
    return numero, j-pos

def leerproporcion(string, pos):
    proporcion=""
    j=pos
    c=string[j]
    while c.isdigit() or c.isspace() or c=='/' or c=='*':
        if not c.isspace():
            proporcion=proporcion + c
        j=j+1
        c=string[j]
    return proporcion, j-pos

def leersignos(string, pos, signo):
    signos=""
    j=pos
    c=string[j]
    while c==signo:
        signos=signos + c
        j=j+1
        c=string[j]
    return signos, j-pos

def leercomando(string, pos):
    j=pos+1
    c=string[j]
    if c.isalpha():
        comando, long=leerpalabra(string,j)
    else:
        comando=c
        long=1
    return '\\' + comando, long + 1

def leerbloque(string, pos):
    bloque="{"
    j=pos+1
    llaves=1
    while llaves>0:
        c=string[j]
        bloque=bloque+c
        if c == '{':
            llaves=llaves+1
        if c == '}':
            llaves=llaves-1
        j=j+1
    return bloque, j-pos

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
    

def relative_to_absolute(tokens_rel, initial_note, octava):
    tokens_abs=[]
    i=0
    old_note=initial_note
    longitud=len(tokens_rel)
    while i < longitud:
        item=tokens_rel[i]
        tokens_abs.append(item)
        letter=item[0]
        comas=0
        if i<longitud-1 and tokens_rel[i+1] in {",", "'"}:
            comas=contar_comas(tokens_rel[i+1])
            i=i+1
        if letter in set(notas.keys()):
            note=notas[letter]
            diferencia=note-old_note
            if abs(diferencia)>3:
                comas = comas-1 if diferencia>0 else comas+1
            octava=comas+octava
            if octava: # si octava es 0 no hay que anadir nada
                tokens_abs.append(comas_string(octava))
            old_note=note
        i=i+1
    return tokens_abs

notas={'c': 0, 'd': 1, 'e': 2, 'f':3, 'g':4, 'a':5, 'b':6}
lilyfile=open("../resources/O_Quam_Gloriosum_Est_Regnum.ly")
texto=quitar_comments(lilyfile.read())
cantus, texto = extraer(texto, "cantus")

s=cantus.find('{')

tokens=tokenizar(cantus[s:])

# \relative c''
m=re.search('\\\\relative\s*([a-z]*)((,|\')*)\s*',cantus[:s])
if m:
    initial_note=notas[m.group(1)[0]]
    octava=contar_comas(m.group(2))
    tokens=relative_to_absolute(tokens, initial_note, octava)
print tokens
