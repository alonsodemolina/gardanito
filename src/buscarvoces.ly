#!/usr/bin/python3

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

def analize_incipit(incipit):
    m=re.search('instrumentName\s*=\s*"([^"]*)"', incipit)
    if m:
        label=m.group(1).strip()
    else:
        label="Staff"
    # this table only 
    key_table={
            "c":0, "f":-1, "bes":-2, "ees":-3, "aes":-4, "des":-5, "ges":-6,
            "ces":-7, "g":1, "d":2, "a":3, "e":4, "b":5, "fis":6, "cis":7
    }
    m=re.search('\\\\key\s*([a-z]*)', incipit)
    if m:
        key_name=m.group(1)
    else:
        key_name="c"
    key=key_table[key_name]
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
    # first note
    m=re.search("(?:\s|\[)(c|d|e|f|g|a|b)"
                "((s|es|is)*)"
                "((,|')*)"
                "(\d+|\\\\breve|\\\\longa|\\\\maxima)"
                "(\.*)",incipit)
    diat=notes[m.group(1)]
    chrom=lily_accidentals[m.group(2)] if m.group(2) else 0
    octave=count_commas(m.group(4))
    dur=durations[m.group(6)]
    puntillos=len(m.group(7))
    dur=dur*(2-1/2**puntillos)
    note=[diat, chrom, octave, dur]
    return (label, clef, key, compas, note)



#################   main   #################

#lilyfile=open("../resources/O_Quam_Gloriosum_Est_Regnum.ly")
#lilyfile=open("../resources/Pueri_Hebraeorum.ly")
#lilyfile=open("../resources/Ardens_Est_Cor_Meum.ly")
lilyfile=open("../resources/Asperges_Me.ly")
texto=quitar_comments(lilyfile.read())
scores=[]
for match in re.finditer('\\\\score\s*{', texto):
    bloque, size=leerbloque(texto, match.end(0)-1)
    if re.search('ChoirStaff\s*<<', bloque):
        scores.append(bloque)
        for name in re.finditer('Voice[^}]*\\\\(\w+)\s*}', bloque):
            print (name.group(1))
