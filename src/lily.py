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
            token, length = leerpalabra(bloque, i)
        elif c.isdigit():
            token, length = leernumero(bloque, i)
        elif c=='*':
            token, length = leerproporcion(bloque, i)
        elif c in {'\'', ',', '.'}:
            token, length = leersignos(bloque, i, c)
        elif c=='\\':
            token, length = leercomando(bloque, i)
        elif c=='{':
            token, length = leerbloque(bloque, i)
        else:
            token=c
            length=1
        l.append(token)
        i=i+length
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
        comas=0
        if i<longitud-1 and tokens_rel[i+1] in {",", "'"}:
            comas=contar_comas(tokens_rel[i+1])
            i=i+1
        if is_a_note(item):
            note=notas[item[0]]
            diferencia=note-old_note
            if abs(diferencia)>3:
                comas = comas-1 if diferencia>0 else comas+1
            octava=comas+octava
            if octava: # si octava es 0 no hay que anadir nada
                tokens_abs.append(comas_string(octava))
            old_note=note
        i=i+1
    return tokens_abs


def analiza_incipit(incipit):
    m=re.search('instrumentName\s*=\s*"([^"]*)"', incipit)
    if m:
        label=m.group(1).strip()
    else:
        label="Staff"
    m=re.search('\\\\key\s*([a-z]*)', incipit)
    if m:
        key_name=m.group(1)
    else:
        key_name="c"
    key={"c":0, "f":-1, "bes":-2}[key_name]
    m=re.search('petrucci-([^"]*)"', incipit)
    if m:
        clef=m.group(1)
    else:
        clef="g2"
    if clef=="g":
        clef="g2"
    m=re.search('\\\\(time\s*[0-9]*/[0-9]*)', incipit)
    if m:
        compas=m.group(1)
    else:
        compas="time 4/4"
    return (label, clef, key, compas)

def procesar_letra(silabas, melismas):
    filtro=[]
    italicas=0
    i=0 # silabas
    j=0 # filtro
    while i<len(silabas):
        item=silabas[i]
        if item == "__":
            pass
        elif item == "--":
            filtro[j-1]=filtro[j-1] + "-"
        elif item == '\\italicas':
            italicas=1
        elif item == '\\rectas':
            a=j-1
            while filtro[a] == "_":
                a=a-1
            filtro[a]=filtro[a] + "]"
        elif item == '\\mt': # \mt #number is a macro to displace lyrics horizontally
            i=i+1
        else:
            if italicas and item != '_':
                item="[" + item
                italicas=0
            filtro.append(item)
            j=j+1
        i=i+1
    # quitamos los melismas
    sinmelismas=[]
    i=0
    while i<len(filtro):
        item=filtro[i]
        if not melismas[i]:
            sinmelismas.append(item)
        i=i+1
    return ' '.join(sinmelismas)

def hallar_melismas(tokens):
    # los melismas pueden estar activados por algunos elementos
    # dependiendo de la variable de lilypond melismaBusyProperties
    # la variable autoBeaming tambien influye
    # TODO: leer y analizar esas variables
    ligaturebusy=1
    tiebusy=1
    beambusy=0
    # se pueden anadir mas casos: slur, phrasingslur, \melisma \melismaEnd
    melismas=[]
    i=0
    melismatie=0
    melismaligature=0
    melisma=0
    while i<len(tokens):
        item=tokens[i]
        if item=='~' and tiebusy:
            melismatie=1
        if item=='\\[' and ligaturebusy:
            melismaligature=1
        if item=='\\]' and ligaturebusy:
            melisma=melisma-1
        if item=='[' and beambusy:
            melisma=melisma+1
        if item==']' and beambusy:
            melisma=melisma-1
        if is_a_note(item):
            if melismatie==1:
                melismas.append(1)
                melismatie=0
            else:
                melismas.append(melisma)
            if melismaligature:
                melismaligature=0
                melisma=melisma+1
        i=i+1
    return melismas

def is_a_note(string):
    if string[0].lower() in set(notas.keys()):
        return True
    else:
        return False

def read_note(i, tokens):
    value_factor = 2 # TODO: calculate it
    durations={ '32': 0.5,
                '16': 1,
                '8': 2,
                '4': 4,
                '2': 8,
                '1': 16,
                '\\breve': 32,
                '\\longa': 64,
                '\\maxima': 128
    }
    accidentals={'is': '#', 'es': 'b', 's': 'b'}
    l=len(tokens)
    k=0
    comas=0
    duration=""
    cautionary=""
    note=tokens[i]
    letter=note[0].upper()
    sufix=note[1:]
    if sufix == "":
        accidental=""
    else:
        accidental=accidentals[sufix]
    note=letter + accidental
    if i+1 < l:
        comas=tokens[i+1]
        k=1
    if i+2 < l:
        if tokens[i+2] == '!':
            cautionary='!'
            i=i+1
            k=2
        elif tokens[i+2] == '?':
            i=i+1
            k=2
    if i+2 < l:
        d=tokens[i+2]
        if d.isdigit() or d=='\\breve' or d=='\\longa' or d=='\\maxima':
            duration=durations[tokens[i+2]]
            k=k+1
            if i+3 < l:
                if tokens[i+3]==".":
                    duration=duration+duration/2
                    k=k+1
            duration=int(duration*value_factor)
    note=note+str(contar_comas(comas))
    return note, str(duration), cautionary, k


def normalize(tokens):
    normalized=[]
    i=0
    old_duration='8'
    tie=0
    while i<len(tokens):
        item=tokens[i]
        if is_a_note(item):
            (note, duration, cautionary, items_read)=read_note(i, tokens)
            if duration == "":
                duration=old_duration
            else:
                old_duration=duration
            if not tie:
                normalized.append(note)
                normalized.append(duration)
                if cautionary == "!":
                    normalized.append('!')
            else:
                j=-1
                while not normalized[j].isdigit():
                    j=j-1
                normalized[j]=str( int(normalized[j]) + int(duration) )
            i=i+items_read
            tie=0
        elif item=='~':
            tie=1
        else:
            normalized.append(item)
        i=i+1
    print normalized
    return normalized


def parse(tokens):
    intermediate=[]
    i=0
    while i<len(tokens):
        item=tokens[i]
        if item=='\\[':
            j=i+1
            notes_in_ligature=0
            while tokens[j] != '\\]':
                if is_a_note(tokens[j]):
                    notes_in_ligature=notes_in_ligature+1
                j=j+1
            intermediate.append("ligature " + str(notes_in_ligature))
        i=i+1
    print intermediate
    return intermediate

#################   main   #################

notas={'c': 0, 'd': 1, 'e': 2, 'f':3, 'g':4, 'a':5, 'b':6}
lilyfile=open("../resources/O_Quam_Gloriosum_Est_Regnum.ly")
texto=quitar_comments(lilyfile.read())

voz="cantus"

# incipit
incipit, texto=extraer(texto, "incipit" + voz)
(label, clef, key, compas)=analiza_incipit(incipit)
print label, clef, key, compas

# musica
musica, texto = extraer(texto, voz)
s=musica.find('{')
tokens=tokenizar(musica[s:])
# si es un bloque \relative lo convertimos en absoluto
m=re.search('\\\\relative\s*([a-z]*)((,|\')*)\s*',musica[:s])
if m:
    initial_note=notas[m.group(1)[0]]
    octava=contar_comas(m.group(2))
    tokens=relative_to_absolute(tokens, initial_note, octava)
melismas=hallar_melismas(tokens)
tokens=normalize(tokens)
intermediate=parse(tokens)

# texto
lyrics, texto=extraer(texto, "texto" + voz)
s=lyrics.find('{')
silabas=lyrics[s+1:-1].split()
lyrics=procesar_letra(silabas, melismas)
print lyrics



